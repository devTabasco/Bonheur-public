package icia.team.bonheur.services.auth;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.reflect.MethodDelegate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.EmailBean;
import icia.team.bonheur.beans.JwtTokenBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.ServerData;
import icia.team.bonheur.beans.TemplateDetailBean;
import icia.team.bonheur.utils.EmailService;
import icia.team.bonheur.utils.Encryption;
import icia.team.bonheur.utils.JsonWebTokenService;
import icia.team.bonheur.utils.ProjectUtils;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class Authentication extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private EmailService email;
	private SimpleTransactionManager tranManager;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 0:
			this.issuanceJWT(model);
			break;
		case 1:
			this.emailAuthCtl(model);
			break;

		case 2:
			this.emailAuthCheckCtl(model);
			break;
			
		case 3:
			this.passwordCheck(model);
			break;
		case 4:
			this.checkMemberPhone(model);
			break;
			
		default:
			break;
		}
	}
	
	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			this.systemAccessCtl(mav);
			break;
			
		case 2:
			this.systemOutCtl(mav);
			break;

		case 3:
			this.withdraw(mav);
			break;

		default:
			break;
		}
	}
	
	private void withdraw(ModelAndView mav) {
		MemberBean memberInfo = null;
		MemberBean member = null;
		try {
			memberInfo = (MemberBean)this.utils.getAttribute("memberInfo");
			member = (MemberBean)mav.getModel().get("member");
			
			if(convertToBoolean(this.session.delete("withdraw",memberInfo))) {
				//삭제 성공
				member.setMessage("true");
			}else {
				//삭제 실패
				member.setMessage("false");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.setViewName("index");
	}
	
	private void checkMemberPhone(Model model) {
		 MemberBean member = (MemberBean)model.getAttribute("member");
		 
		 if(convertToBoolean(this.session.selectOne("checkMemberPhone",member))) {
			//있음
			member.setMessage("true");
		 }else {
			//없음
			 member.setMessage("false");
		 }
	}
	
	private void accessCtl(ModelAndView mav) {
		
	}
	private void systemOutCtl(ModelAndView mav) {
		try {
			this.utils.removeAttribute("memberInfo");
		} catch (Exception e) {e.printStackTrace();}
	}
	
	private void passwordCheck(Model model) {
		String pin = model.getAttribute("memberPin").toString();
		String message = "false";
		MemberBean member = null;
		
		try {
			member = (MemberBean)this.utils.getAttribute("memberInfo");
			model.addAttribute("memberInfo", member);
			if(this.enc.matches(pin, this.session.selectOne("getMemberPassword", member))) {
				message = "true";
			}
		} catch (Exception e) {e.printStackTrace();
		}finally {
			member.setMessage(message);
		}
	}
	
	/* JWT Issuance */
	//로그인 가능 확인
	private void issuanceJWT(Model model) {
		MemberBean memberBean = (MemberBean)model.getAttribute("memberInfo");
		String message = "false";
		System.out.println(memberBean.toString());
		try {
			//아이디 확인
			if(convertToBoolean(this.session.selectOne("isEmail",memberBean))) {
				//비밀번호 확인
				if(this.enc.matches(memberBean.getMemberPassword(), this.session.selectOne("getMemberPassword", memberBean))) {
//				if(memberBean.getMemberPassword().equals(this.session.selectOne("getMemberPassword", memberBean))) {
				
//				log.info("[2.GroupInfo] >>> {}", gr);
				
				/* Session에 BackEnd수행에 필요한 기본 자료 저장 */
				memberBean.setMemberPassword(null);
				this.utils.setAttribute("memberInfo", memberBean);
				
				/* JWT 발행 및 Response에 적재 */
				JwtTokenBean jwtBody = JwtTokenBean.builder()
						.memberCode(memberBean.getMemberCode())
						.memberEmail(memberBean.getMemberEmail())
						.memberSubEmail(memberBean.getMemberSubEmail())
						.build();
				String token = this.jwts.tokenIssuance(jwtBody, memberBean.getMemberEmail());
				System.out.println(token);
				this.utils.transferJWTByResponse(token);
				message = "true";
				
				}
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally { 
			memberBean.setMessage(message);
		}
	}
	
	/* System Access after JWT Check */
	//jwt확인 후 로그인
	private void systemAccessCtl(ModelAndView mav) {
		MemberBean memberInfo = null;
		String page = "redirect:/";
		String message = "Access Error:시스템 접속이 실패하였습니다.";
		
		try {
			memberInfo = (MemberBean)this.utils.getAttribute("memberInfo");
			memberInfo = (MemberBean)(this.session.selectList("getMemberInfo", memberInfo)).get(0);
			
			//Name 복호화
			memberInfo.setMemberName(enc.aesDecode(memberInfo.getMemberName(), memberInfo.getMemberEmail()));

			System.out.println(memberInfo.toString());

			this.utils.setAttribute("memberInfo", memberInfo);
			
			
			
		} catch (Exception e) {e.printStackTrace();}
//		message = "JWT Authentication:This site is using JWT Authentication";

//		memberInfo.setMessage(message);
		mav.setViewName(page);
	}
	
	/* EMAIL Auth */
	private void emailAuthCtl(Model model) {
		MemberBean memberBean = null;
//		EmailService email = null;
		
		if(model.containsAttribute("memberInfo")) {
			memberBean = (MemberBean)model.getAttribute("memberInfo");
			if(!convertToBoolean(session.selectOne("emailDupCheck",memberBean))) {
				
//			email = new EmailService();
			boolean result = false;
			try {
				
				/* SHA 암호화 처리 */
				String authCode = enc.encode(memberBean.getMemberEmail());
				
				/* ReceiverList 만들기 */
				ArrayList<String[]> receiverList = new ArrayList<String[]>();
				String[] receiver = {memberBean.getMemberName()!=null?memberBean.getMemberName():"고객님", memberBean.getMemberEmail()};
				receiverList.add(receiver);
				
				/* SEND MAIL : subject, content, sender, receiver */
				result = email.sendEmail(
							EmailBean.builder()
								     .sender("icia.bonheur@google.com")
							  		 .receiver(receiverList)
							  		 .subject("[본인 인증] 이메일 인증을 절차에 따라 진행해 주세요")
							  		 .contents("<H1>[Bonheur] 이메일 본인 인증</H1>"
							  		 		 + "<H3>아래의 인증코드를 시스템의 알림을 참고하여 수락하여 주시기 바랍니다.</H3><H2>인증코드 : " 
							  				 + authCode.substring(0,6) + "</H2>")
							  		 .isHtml(true)
							  		 .build());
			} catch (Exception e) {	e.printStackTrace();} 
			  finally { 
				  memberBean.setMessage(result?"true":"false");
//				  accessInfo.getStoreInfoList().get(0).getEmpList().get(0).setEmpEmail(null);
				  /* 클라이언트 전달 */
//				  model.addAttribute("ServerData", this.getServerData());
				  }
			}else {
				memberBean.setMessage("emailDup");
			}
		}
	}
	
	/* Email Auth Check */
	private void emailAuthCheckCtl(Model model) {
//		String message = "Email Auth Error:이메일 인증에 실패하였습니다. 잠시후 다시 시도하시거나 인증에 사용할 메일이 수신 가능한지 확인해 주세요.";
		
		if(model.containsAttribute("authCode") && model.containsAttribute("memberInfo")) {
			MemberBean memberBean = (MemberBean)model.getAttribute("memberInfo");
			String authCode = (model.getAttribute("authCode").toString());
			
			memberBean.setMessage(authCode.equals(enc.encode(memberBean.getMemberEmail()).substring(0,6))+"");
			
		}
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
	
}
