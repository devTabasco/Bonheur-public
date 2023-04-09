package icia.team.bonheur.services.myInfo;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.utils.Encryption;
import icia.team.bonheur.utils.JsonWebTokenService;
import icia.team.bonheur.utils.ProjectUtils;
@Service
public class MyInfoObject extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private SqlSessionTemplate session;
	private SimpleTransactionManager tranManager;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1: changeMyInfo(model);
			break;
		case 2: getDoingItemInfo(model);
		break;

		default:
			break;
		}
	}
	
	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1: loginCheck(mav);
			break;

		default:
			break;
		}
	}
	
	private void getDoingItemInfo(Model model) {
		MemberBean member = null;
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		List<ItemBean> list = null;
		try {
			member = (MemberBean)this.utils.getAttribute("memberInfo");
			list = this.session.selectList("getDoingItemInfo", member);
			itemList = (ArrayList<ItemBean>)list;
			System.out.println(itemList.toString());
			
			member.setItemList(itemList);
			
			model.addAttribute("itemList",member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void changeMyInfo(Model model) {
		System.out.println("changeMyInfo::STEP0");
		if(model.getAttribute("memberInfo") != null) {
			MemberBean memberInfo = (MemberBean)model.getAttribute("memberInfo");
			System.out.println("changeMyInfo::STEP1");
			String encPassword = enc.encode(memberInfo.getMemberPassword());
			memberInfo.setMemberPassword(encPassword);
			
			try {
				memberInfo.setMemberEmail(((MemberBean)this.utils.getAttribute("memberInfo")).getMemberEmail());
				System.out.println(memberInfo.toString());
				this.tranManager = getTransaction(false);
				this.tranManager.tranStart();
				System.out.println("changeMyInfo::STEP2");
				if(this.convertToBoolean(this.session.update("updMyInfo", memberInfo))) {
					this.tranManager.commit();
				}
			} catch (Exception e) {
				e.printStackTrace();
				this.tranManager.rollback();
			}finally {
				this.tranManager.tranEnd();
				System.out.println("changeMyInfo::STEP3");
			}
		}
	}
	
	private void getMyPageData(ModelAndView mav) {
		
	}
	
	private void loginCheck(ModelAndView mav) {
		
		MemberBean memberInfo;
		
		try {
			memberInfo = (MemberBean)this.utils.getAttribute("memberInfo");
			
			if(memberInfo != null) {
				mav.setViewName("mypage");
			}else {
				mav.setViewName("login");
			}
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	private void getAlertMsg(Model model) {
		
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
