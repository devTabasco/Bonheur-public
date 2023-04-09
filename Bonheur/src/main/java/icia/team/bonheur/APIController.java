package icia.team.bonheur;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.SubOptionBean;
import icia.team.bonheur.beans.TemplateDetailBean;
import icia.team.bonheur.services.auth.Authentication;
import icia.team.bonheur.services.myInfo.LogDataObject;
import icia.team.bonheur.services.myInfo.MyInfoObject;
import icia.team.bonheur.services.produce.ImageProcessing;
import icia.team.bonheur.services.produce.PageProcessing;
import icia.team.bonheur.services.registration.Registration;
import icia.team.bonheur.services.template.TemplateManager;
import icia.team.bonheur.services.template.ListDataObject;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class APIController {
	@Autowired
	private Authentication auth;
	@Autowired
	private Registration reg;
	@Autowired
	private MyInfoObject myinfo;
	@Autowired
	private TemplateManager templateManager;
	@Autowired 
	private ListDataObject list;
	@Autowired
	private PageProcessing page;
	@Autowired
	private LogDataObject logDataObject;
	@Autowired
	private ImageProcessing image;

	
	@PostMapping(value="/Api/EmailAuth", produces = "application/json; charset=UTF-8")
		public MemberBean emailAuth(Model model, @ModelAttribute MemberBean memberBean) {
		System.out.println("----- Email Auth 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		auth.backController(1, model);
		System.out.println(model.getAttribute("memberInfo").toString());
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="/getQRLink")
	public SubOptionBean getQRLink(Model model, @RequestParam("qrCode") String qrCode) {
		model.addAttribute("qrCode",qrCode);
		page.backController(4, model);
		return (SubOptionBean)model.getAttribute("qrLink");
	}

	@PostMapping("/Api/EmailAuthCheck")
	public MemberBean emailAuthCheck(Model model, @RequestParam("emailAuthCode") String authCode, @ModelAttribute MemberBean memberBean) {
		System.out.println("----- Email Auth 진입 -----");
		model.addAttribute("authCode", authCode);
		model.addAttribute("memberInfo", memberBean);
		auth.backController(2, model);
		System.out.println(model.getAttribute("authCode").toString());
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping("/IssuanceJWT")
	public String issuanceJWT(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- Authentication 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		auth.backController(0, model);
		return ((MemberBean)model.getAttribute("memberInfo")).getMessage();
	}
	
	@PostMapping("/naverSave")
	public String naverSave(Model model, @RequestParam("n_id") String n_id) {
		System.out.println(n_id);
		return "Index";
	}
	
	@PostMapping("/Api/PassCheck")
	public MemberBean passCheck(Model model, @RequestParam("memberPassword") String password) {
	System.out.println("----- passCheck 진입 -----");
	model.addAttribute("memberPin", password);
	auth.backController(3, model);
	return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="/Api/ChangeMyInfo", produces = "application/json; charset=UTF-8")
	public MemberBean changeMyInfo(Model model, @ModelAttribute MemberBean memberBean) {
		System.out.println("----- DB 업데이트 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		myinfo.backController(1, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}

	@PostMapping(value="/getTemplateInfo", produces = "application/json; charset=UTF-8")
	public ArrayList<TemplateDetailBean> getTemplateInfo(Model model) {
		System.out.println("----- 템플릿 정보 가져오기 -----");
		templateManager.backController(1, model);
		return (ArrayList<TemplateDetailBean>)model.getAttribute("templateData");
	}

	@PostMapping(value="/getTemplateList", produces = "application/json; charset=UTF-8")
	public String getTemplateList(Model model) {
		System.out.println("----- 템플릿 리스트 정보 가져오기 -----");
		templateManager.backController(2, model);
		return (String)model.getAttribute("templateList");
	}
	
	@PostMapping("/InProduction")
	public MemberBean inProduction(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- Authentication 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		myinfo.backController(2, model);
		return (MemberBean)model.getAttribute("itemList");
	}
	
	@PostMapping(value="/Api/CompleteProduction", produces = "application/json; charset=UTF-8")
	public MemberBean completeProduction(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- Authentication 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		//list.backController(1, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}

	@PostMapping("/Api/InsertItemStep1")
	public MemberBean insertItemStep1(Model model, @ModelAttribute MemberBean memberBean) {
	    System.out.println("----- Insert Step1 진입 -----");
	    model.addAttribute("memberInfo", memberBean);
	    System.out.println(memberBean.toString());
	    page.backController(1, model);
	    return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping("/Api/InsertGalleryImage")
	public ItemBean insertGalleryImage(Model model, @ModelAttribute MemberBean memberBean) {
		System.out.println("----- Insert GalleryImage 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		System.out.println("subOption::"+memberBean.toString());
		image.backController(1, model);
		return (ItemBean)model.getAttribute("orderInfo");
	}
	
	@PostMapping("/Api/CreateItemFile")
	public SubOptionBean createItemFile(Model model, @RequestParam("iframeHtml") String iframeHtml, @RequestParam("itemCode") String itemCode) {
		System.out.println("----- Create ItemFile 진입 -----");
		model.addAttribute("iframeHtml", iframeHtml);
		model.addAttribute("itemCode", itemCode);
		page.backController(3, model);
		return (SubOptionBean)model.getAttribute("itemCode");
	}
	
	@PostMapping("/Api/InsertSubOptionStep1")
	public ItemBean insertOptionSub(Model model, @ModelAttribute MemberBean memberBean) {
		System.out.println("----- Insert OptionSub 진입 -----");
		model.addAttribute("memberInfo", memberBean);
		System.out.println("subOption::"+memberBean.toString());
		page.backController(2, model);
		return (ItemBean)model.getAttribute("orderInfo");
	}

	@PostMapping(value="/Api/AddWishList", produces = "application/json; charset=UTF-8")
	public MemberBean addWishList(Model model, @ModelAttribute MemberBean memberBean) {
		model.addAttribute("wishCode",memberBean.getWishList().get(0));
		log.info("----- addWishList 진입 -----");
		logDataObject.backController(1, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="/Api/DeleteWishList", produces = "application/json; charset=UTF-8")
	public MemberBean deleteWishList(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- deleteWishList 진입 -----");
		model.addAttribute("wishCode",memberBean.getWishList().get(0));
		System.out.println(memberBean.toString());
		logDataObject.backController(2, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="getWishInfoByMyPage", produces = "application/json; charset=UTF-8")
	public MemberBean getWishInfoByMyPage(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- getWishInfoByMyPage 진입 -----");
		logDataObject.backController(4, model);
		return (MemberBean)model.getAttribute("wishInfo");
	}
	
	@PostMapping(value="/Api/getWishInfo", produces = "application/json; charset=UTF-8")
	public MemberBean getWisiInfo(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- getWisiInfo 진입 -----");
		model.addAttribute("wishCode", memberBean.getWishList().get(0));
		logDataObject.backController(3, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="/Api/DeleteItem")
	public MemberBean deleteItem(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- deleteItem 진입 -----");
		model.addAttribute("itemCode",memberBean.getItemList().get(0).getItemCode());
		System.out.println(memberBean.toString());
		logDataObject.backController(5, model);
		return (MemberBean)model.getAttribute("memberInfo");
	}
	
	@PostMapping(value="/checkMemberCode", produces = "application/json; charset=UTF-8")
	public MemberBean checkMemberCode(Model model, @ModelAttribute MemberBean memberBean) {
		log.info("----- deleteItem 진입 -----");
		model.addAttribute("member",memberBean);
		auth.backController(4, model);
		return (MemberBean)model.getAttribute("member");
	}

}
