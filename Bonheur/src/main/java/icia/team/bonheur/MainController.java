package icia.team.bonheur;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.*;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.NaverOauthBean;
import icia.team.bonheur.beans.TemplateDetailBean;
import icia.team.bonheur.services.auth.Authentication;
import icia.team.bonheur.services.auth.KakaoOauth;
import icia.team.bonheur.services.auth.NaverOauth;
import icia.team.bonheur.services.movePage.MovePageObject;
import icia.team.bonheur.services.myInfo.MyInfoObject;
import icia.team.bonheur.services.produce.PageProcessing;
import icia.team.bonheur.services.registration.Registration;
import icia.team.bonheur.services.template.TemplateManager;
import icia.team.bonheur.utils.S3Upload;
import lombok.extern.slf4j.Slf4j;

//@CrossOrigin(origins="*", allowedHeaders = "*")
@Controller
@Slf4j
public class MainController {
	@Autowired
	private S3Upload s3Upload;
	@Autowired
	private Authentication auth;
	@Autowired
	private Registration reg;
	@Autowired
	private MyInfoObject myInfo;
	@Autowired
	private TemplateManager templateManager;
	@Autowired
	private PageProcessing pageProcessing;
	@Autowired
	private MovePageObject movePageObject;
	@Autowired
	private NaverOauth naverOauth;
	@Autowired
	private KakaoOauth kakaoOauth;
	
	@RequestMapping(value = {"/", "/Index"}, method = RequestMethod.GET)
	public String index() {
		log.info("***** 사이트 진입 *****");
		return "index";
	}
	
	@RequestMapping(value = "/SignUp", method = RequestMethod.GET)
	public String signUp() {
		log.info("***** 사이트 진입 *****");
		return "createAccount";
	}
	
	@RequestMapping(value = "/produceWedding", method = RequestMethod.POST)
	public ModelAndView produceWedding(ModelAndView mav, @ModelAttribute MemberBean member) {
		log.info("***** produceWedding *****");
		mav.addObject("member", member);
		mav.setViewName("produceWedding");
		movePageObject.backController(4, mav);
		return mav;
	}
	
	@RequestMapping(value = "/produceThxCard", method = RequestMethod.POST)
	public ModelAndView produceThxCard(ModelAndView mav, @ModelAttribute MemberBean member) {
		log.info("***** produceThxCard *****");
		mav.addObject("member", member);
		mav.setViewName("produceThxCard");
		movePageObject.backController(4, mav);
		return mav;
	}
	
	@RequestMapping(value = "/produceFirstBirth", method = RequestMethod.POST)
	public ModelAndView produceFirstBirth(ModelAndView mav, @ModelAttribute MemberBean member) {
		log.info("***** produceFirstBirth *****");
		mav.addObject("member", member);
		mav.setViewName("produceFirstBirth");
		movePageObject.backController(4, mav);
		return mav;
	}
	
	@RequestMapping(value = "/produceExtraCard", method = RequestMethod.POST)
	public ModelAndView produceExtraCard(ModelAndView mav, @ModelAttribute MemberBean member) {
		log.info("***** produceExtraCard *****");
		mav.addObject("member", member);
		mav.setViewName("produceExtraCard");
		movePageObject.backController(4, mav);
		return mav;
	}

	@RequestMapping(value = "/Wedding", method = RequestMethod.POST)
	public ModelAndView wedding(ModelAndView mav) {
		log.info("***** 사이트 진입 *****");
		templateManager.backController(1, mav);
		return mav;
	}
	
	@RequestMapping(value = "/ThxCard", method = RequestMethod.POST)
	public ModelAndView thxCard(ModelAndView mav) {
		log.info("***** 사이트 진입 *****");
		templateManager.backController(2, mav);
		return mav;
	}
	
	@RequestMapping(value = "/FirstBirth", method = RequestMethod.POST)
	public ModelAndView firstBirth(ModelAndView mav) {
		log.info("***** 사이트 진입 *****");
		templateManager.backController(3, mav);
		return mav;
	}
	
	@RequestMapping(value = "/ExtraCard", method = RequestMethod.POST)
	public ModelAndView extraCard(ModelAndView mav) {
		log.info("***** 사이트 진입 *****");
//		s3Upload.uploadFile();
		templateManager.backController(4, mav);
		return mav;
	}
	
	@RequestMapping(value = "/View/Access", method = RequestMethod.POST)
	public ModelAndView accessCtl(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		System.out.println("test");
		mav.addObject(memberBean);
		auth.backController(1, mav);
		return mav;
	}
	
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/Logout", method = RequestMethod.POST)
	public String logout(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		auth.backController(2, mav);
		System.out.println("LogoutTest");
		return "index";
	}

	@RequestMapping(value="/View/Registration", method = RequestMethod.POST)
	public ModelAndView registration(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		log.info("----- 가입완료 -----");
	
		mav.addObject("memberInfo", memberBean);
		reg.backController(1, mav);
		System.out.println(mav.addObject("memberInfo").toString());
		return mav;
	}
	
	@RequestMapping(value = "/View/MyPage", method = RequestMethod.POST)
	public ModelAndView mypage(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		log.info("***** 마이페이지 진입 *****");
		System.out.println("MyPage 진입");
		movePageObject.backController(2, mav);
		return mav;
	}
	
	@RequestMapping(value="/View/MyInfoEdit", method = RequestMethod.POST)
	public String myInfoEdit(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		log.info("----- 회원정보수정 -----");
		
		//mav.addObject("memberInfo", memberBean);
//		myInfo.backController(1, mav);
		//System.out.println(mav.addObject("memberInfo").toString());
		return "myInfoEdit";
	}
	
	@RequestMapping(value="/View/ChangeMyInfo", method = RequestMethod.POST)
	public String changeMyInfo(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		log.info("----- 회원정보수정 서버로 날리기 -----");
		
		//mav.addObject("memberInfo", memberBean);
//		myInfo.backController(1, mav);
		//System.out.println(mav.addObject("memberInfo").toString());
		System.out.println(memberBean.getMemberPhone());
		return "index";
	}
	
	@RequestMapping(value="/View/ChangeMyGeneralInfo", method = RequestMethod.POST)
	public String changeMyGeneralInfo(ModelAndView mav, @ModelAttribute MemberBean memberBean) {
		log.info("----- 회원정보수정 서버로 날리기 -----");
		
		//mav.addObject("memberInfo", memberBean);
//		myInfo.backController(1, mav);
		//System.out.println(mav.addObject("memberInfo").toString());
		System.out.println(memberBean.toString());
		return "myInfoEdit";
	}
	
	@RequestMapping(value="/View/Detail", method = RequestMethod.POST)
	public ModelAndView detail(ModelAndView mav, @ModelAttribute TemplateDetailBean templateDetailBean) {
		log.info("----- Detail Page Return -----");
		
		mav.addObject("templateCode", templateDetailBean.getTemplateDetailCode());
		movePageObject.backController(1, mav);
		return mav;
	}
	
	@RequestMapping(value = "/m/{itemCode}/{url}", method = RequestMethod.GET)
	public String getWeddingItem(@PathVariable("itemCode") String itemCode, @PathVariable("url") String url) {
	    log.info("***** 사이트 진입 *****");
	    return "item/" + itemCode;
	}
	
	//데이터 처리 메서드(파일 복사)
	@RequestMapping(value = "/template/{templateCode}", method = RequestMethod.GET)
	public String moveTemplate(@PathVariable("templateCode") String templateCode) {
		log.info("***** 사이트 진입 *****");
		
		return "template/" + templateCode;
	}
	
	@RequestMapping(value = "/introduce", method = RequestMethod.POST)
	public String introduce() {
		log.info("***** 사이트 진입 *****");
		
		return "introduce";
	}
	
	@RequestMapping(value = "/rule", method = RequestMethod.POST)
	public String rule() {
		log.info("***** 사이트 진입 *****");
		
		return "rule";
	}
	
	@RequestMapping(value = "/infoPolicy", method = RequestMethod.POST)
	public String infoPolicy() {
		log.info("***** 사이트 진입 *****");
			
		return "infoPolicy";
	}
	
	@RequestMapping(value = "/NaverCallBack", method = RequestMethod.GET)
	public String NaverCallBack() {
		log.info("***** 사이트 진입 *****");
		
		return "naverOauthCallBack";
	}
	
	@RequestMapping(value = "/kakaoOauthCallBack", method = RequestMethod.GET)
	public String kakaoOauthCallBack() {
		log.info("***** 사이트 진입 *****");
		
		return "kakaoOauthCallBack";
	}
	
	@RequestMapping(value = "/getNaverInfo", method = RequestMethod.POST)
	public ModelAndView getNaverInfo(ModelAndView mav, @RequestParam("token") String token) {
		log.info("***** naver Oauth 진입 *****");
		mav.addObject("token", token);
		naverOauth.backController(1, mav);
		return mav;
	}
	
	@RequestMapping(value = "/naverMemberJoin", method = RequestMethod.POST)
	public ModelAndView naverMemberJoin(ModelAndView mav, @ModelAttribute MemberBean member) {
		System.out.println("***** naverMemberJoin 진입 *****");
		mav.addObject("memberInfo", member);
		naverOauth.backController(2, mav);
		return mav;
	}
	
//	@RequestMapping(value = "/MoveProduceWedding", method = RequestMethod.POST)
//	public ModelAndView moveProduce(ModelAndView mav, @ModelAttribute MemberBean member) {
//		System.out.println("***** MoveProduce 진입 *****");
//		mav.addObject("templateCode", member.getWishList().get(0).getTemplateCode());
//		mav.setViewName("produceWedding");
//		return mav;
//	}
	
	//파일 생성하는 녀석
	@RequestMapping(value = "/MoveProduceWedding", method = RequestMethod.POST)
	public ModelAndView moveProduce(ModelAndView mav, @ModelAttribute MemberBean member) {
		System.out.println("***** MoveProduce 진입 *****");
		mav.addObject("memberInfo", member);
		movePageObject.backController(3, mav);
		return mav;
	}

	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public ModelAndView withdraw(ModelAndView mav, @ModelAttribute MemberBean member) {
		System.out.println("***** MoveProduce 진입 *****");
		mav.addObject("member", member);
		auth.backController(3, mav);
		return mav;
	}
	
	@RequestMapping(value = "/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(ModelAndView mav){
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=9102bb3b23a9396bad4849e1392d29d7"
				+ "&redirect_uri=http://192.168.0.36/oauth_kakao"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/oauth_kakao")
	public String oauthKakao(ModelAndView mav, @RequestParam(value = "code", required = false) String code){

		System.out.println("#########" + code);
		mav.addObject("code",code);
		kakaoOauth.backController(1, mav);
		return "index";
	}

}

