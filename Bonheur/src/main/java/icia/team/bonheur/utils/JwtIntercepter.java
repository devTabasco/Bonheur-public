package icia.team.bonheur.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.beans.MemberBean;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtIntercepter implements HandlerInterceptor {
	@Autowired
	private JsonWebTokenService jwtService;
	@Autowired
	private ProjectUtils utils;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, 
			Object handler) throws Exception {
						
		String userKey = null, message = null;
		boolean result = false;
		if(!req.getMethod().equals("OPTIONS")) {// API Request(preFlight -> response -> Flight)인 경우 preFlight인 경우 제외
			if(!req.getMethod().equals("GET")) {
				if(((MemberBean)this.utils.getAttribute("memberInfo")) != null){
					userKey = ((MemberBean)this.utils.getAttribute("memberInfo")).getMemberEmail();
					/* 통신방식에 따라 JWT 접근방식 달리하기 */
					String jwtToken = null;
					if(req.getParameter("BonheurJWT") != null) {
						jwtToken = req.getParameter("BonheurJWT");
					}else {
						jwtToken = req.getHeader("BonheurJWT");
					}
					
					System.out.println("PREHANDLE : " + jwtToken);
//					String jwtToken = 
//							req.getRequestURI().split("\\/")[1].equals("View")? 
//									req.getParameter("BonheurJWT") : req.getHeader("BonheurJWT");
					
					if(jwtToken != null	&& jwtToken.length() > 0) {
						if((result = this.jwtService.tokenExpiredDateCheck(jwtToken, userKey)) 
								== true) {
							message = null;
						}else message = "토큰이 만료되었습니다.";
					}else message = "Token Error:Token does Not Exist or Token has Expired";
				}else message = "Session Error:보안상 다시 로그인을 해주세요.";	
			}else message = "접근 Error:비정상적인 접근 경로입니다.";
		}else result = true;
		
		if(!result || userKey == null) res.sendRedirect("/Login?"+ message);
		
		return result;
	}

	@Override
	public void postHandle( HttpServletRequest req, HttpServletResponse res,
			Object handler, ModelAndView mav)throws Exception { // Before View Rendering
		log.info(">>> postHandle <<< ");
	}	

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, 
			Object handler, Exception ex)throws Exception { // After View Rendering
		log.info(">>> afterComplection <<<");
	}
	
	/* Spring Framework 6.0 지원 현재 Spring Boot 에서 지원 >> postHandle, afterCompletion 실행 과정 없음
	public void afterConcurrentHandlingStarted(HttpServletRequest req, HttpServletResponse res, 
			Object handler, Exception ex) {
	}*/
}