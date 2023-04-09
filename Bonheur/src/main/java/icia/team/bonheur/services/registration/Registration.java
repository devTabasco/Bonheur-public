package icia.team.bonheur.services.registration;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.utils.Encryption;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.beans.MemberBean;
import lombok.extern.slf4j.Slf4j;

/* Registration Class
 * - 대표자등록
 * - 상점등록
 * - 직원등록
 * - 분류등록 
 * */
@Service
@Slf4j
public class Registration extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired //메모리에 올라가있는 Bean과 비교
	private SqlSessionTemplate session;
	private SimpleTransactionManager tranManager;
	
	//ActionBean
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1:
			
			break;
		case 2:
			
			break;

		default:
			break;
		}
	}
	
	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			this.registrationCtl(mav);
			break;

		default:
			break;
		}
	}
	
	/* 회원가입 첫 페이지 이동 */
	//ActionBean
//	public void moveGroup();
//	
//	/* 그룹네임 중복 체크 >> 임시 저장 */
//	//ActionBean
//	public void groupNameDuplicateCheckCtl();
//	
//	/* 그룹네임 삭제 >> 임시 저장 */
//	//ActionBean
//	public void delGroupNameCtl();
	
	/* 회원가입 :: 그룹코드 생성 */
	//ActionBean
	@Transactional
	private void registrationCtl(ModelAndView mav) {
		String message = "네크워크 오류 : 잠시후 다시 시도해주세요";
		mav.setViewName("createAccount");
		if(mav.getModel().get("memberInfo") != null) {
			MemberBean member = (MemberBean)mav.getModel().get("memberInfo");
			
//			memberBean.setMessage(memberBean.getMemberName()!=null?"true":"false");
			
			/* AES 암호화 */
			try {
				String aesString = enc.aesEncode(member.getMemberName(), member.getMemberEmail());
				member.setMemberName(aesString);
				System.out.println("test");
			} catch (Exception e) {e.printStackTrace();}
			
			/* SHA 암호화 */
			String encPassword = enc.encode(member.getMemberPassword());
			member.setMemberPassword(encPassword);
			
			/* Transaction */
			try {
				this.tranManager = getTransaction(false);
				this.tranManager.tranStart();
				
				if(this.convertToBoolean(this.session.insert("insMember", member))) {
					this.tranManager.commit();
					mav.setViewName("index");
				}else {member.setMessage(message);}
			} catch (Exception e) {
				this.tranManager.rollback();
			} finally {
				this.tranManager.tranEnd();
			}
		}
	}
	
	private boolean convertToBoolean(int value) {
		return value>0? true: false;
	}
}
