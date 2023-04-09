package icia.team.bonheur.services.auth;
// 네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.JwtTokenBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.NaverOauthBean;
import icia.team.bonheur.utils.Encryption;
import icia.team.bonheur.utils.JsonWebTokenService;
import icia.team.bonheur.utils.ProjectUtils;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class NaverOauth extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private JsonWebTokenService jwts;
	private SimpleTransactionManager tranManager;

	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			this.naverAuth(mav);
			break;
			
		case 2:
			this.naverMemberJoin(mav);
			break;
		}
		
		
	}


    private void naverAuth(ModelAndView mav) {
        String token = (String)mav.getModel().get("token"); // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        String message = "";
        MemberBean member = null;

        String apiURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println(token);
        System.out.println(responseBody);
        
        ObjectMapper objectMapper = new ObjectMapper();
        try {
			NaverOauthBean naverInfo = objectMapper.readValue(responseBody, NaverOauthBean.class);
			System.out.println("naverResponse : "+naverInfo.getResponse());
			
			if(!convertToBoolean(this.session.selectOne("naverMemberCheck",naverInfo.getResponse()))) {
				//네이버로 회원가입이 되어있지 않은 경우
				this.utils.setAttribute("naverInfo", naverInfo);
				mav.setViewName("moreInfomation");
			}else {
				//네이버로 회원가입이 되어있는 경우
				//로그인 시키기
				//로그인 진행
				member = (MemberBean)(this.session.selectOne("getMemberInfoByNaver", naverInfo.getResponse()));
				member.setMemberPassword(null);
				//Name 복호화
				member.setMemberName(enc.aesDecode(member.getMemberName(), member.getMemberEmail()));
				this.utils.setAttribute("memberInfo", member);
				
				/* JWT 발행 및 Response에 적재 */
				JwtTokenBean jwtBody = JwtTokenBean.builder()
						.memberCode(member.getMemberCode())
						.memberEmail(member.getMemberEmail())
						.memberSubEmail(member.getMemberSubEmail())
						.build();
				String jwtToken = this.jwts.tokenIssuance(jwtBody, member.getMemberEmail());
				System.out.println(jwtToken);
				mav.addObject("jwt",jwtToken);
				mav.setViewName("index");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void naverMemberJoin(ModelAndView mav) {
    	NaverOauthBean naverInfo = null;
    	MemberBean member = null;
    	String message = "";
		try {
			naverInfo = (NaverOauthBean)this.utils.getAttribute("naverInfo");
			member = (MemberBean)mav.getModel().get("memberInfo");
			
			member.setMemberEmail(naverInfo.getResponse().getEmail());
			member.setMemberName(naverInfo.getResponse().getName());
			member.setMemberPhone(naverInfo.getResponse().getMobile().replaceAll("-", ""));
			member.setMemberOauthKey(naverInfo.getResponse().getId());
			
			/* AES 암호화 */
			try {
				String aesString = enc.aesEncode(member.getMemberName(), member.getMemberEmail());
				member.setMemberName(aesString);
			} catch (Exception e) {e.printStackTrace();}
			
			if(!convertToBoolean(this.session.selectOne("emailOauthDupCheck",member))) {
				System.out.println("check");
				/* Transaction */
				try {
					this.tranManager = getTransaction(false);
					this.tranManager.tranStart();
					
					if(this.convertToBoolean(this.session.insert("insOauthMember", member))) {
						System.out.println("check2");
						this.tranManager.commit();
						mav.setViewName("index");
					}else {message = "시스템 에러";
					System.out.println("check3");
					}
				} catch (Exception e) {
					this.tranManager.rollback();
				} finally {
					this.tranManager.tranEnd();
				}
			}else {
				System.out.println("check4");
				if(convertToBoolean(this.session.selectOne("OauthDupCheck"))) {
					
				}else {
					message = "이미 등록된 회원입니다.";					
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("message",message);
	}
    
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
