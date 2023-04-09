package icia.team.bonheur.services.template;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.beans.TemplateDetailBean;
import icia.team.bonheur.utils.ProjectUtils;

@Service
public class TemplateManager {
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private SqlSessionTemplate session;

	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1:
			this.getTemplateInfo(model);
			break;
		case 2:
//			this.getTemplateList(model);
			break;

		default:
			break;
		}
	}

	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			this.getWedTemplateList(mav);
			break;
		case 2:
			this.getThxTemplateList(mav);
			break;
		case 3:
			this.getBirTemplateList(mav);
			break;
		case 4:
			this.getEtcTemplateList(mav);
			break;

		default:
			break;
		}
	}

	// index template 정보 가져오기
	private void getTemplateInfo(Model model) {
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;

		templateInfoList = this.session.selectList("getTemplateInfo");
//		for(int i=0; i<templateInfoList.size(); i++) {
//			System.out.println(templateInfoList.toString());
//		}
		try {
			this.utils.setAttribute("templateInfo", templateInfoList);
			model.addAttribute("templateData", templateInfoList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// index template 정보 가져오기
	private void getWedTemplateList(ModelAndView mav) {
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;
		String jsonString = null;

		templateInfoList = this.session.selectList("getWedTemplateList");
		System.out.println(templateInfoList.toString());
		jsonString = templateInfoList.toString().replaceAll("TemplateDetailBean", "").replaceAll("\\(", "{")
				.replaceAll("\\)", "}").replaceAll("=", ":")
				.replaceAll("templateDetailCode:", "\"templateDetailCode\":\"").replaceAll(", ", "\", ")
				.replaceAll("templateDetailName:", "\"templateDetailName\":\"")
				.replaceAll("templateTagCode:", "\"templateDetailName\":\"")
				.replaceAll("templateDetailContents:", "\"templateDetailContents\":\"").replaceAll("}", "\"}")
				.replaceAll("}\"", "}");
		System.out.println(jsonString);

		try {
			mav.addObject("templateList", jsonString);
			mav.setViewName("list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// index template 정보 가져오기
	private void getThxTemplateList(ModelAndView mav) {
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;
		String jsonString = null;

		templateInfoList = this.session.selectList("getThxTemplateList");
		System.out.println(templateInfoList.toString());
		jsonString = templateInfoList.toString().replaceAll("TemplateDetailBean", "").replaceAll("\\(", "{")
				.replaceAll("\\)", "}").replaceAll("=", ":")
				.replaceAll("templateDetailCode:", "\"templateDetailCode\":\"").replaceAll(", ", "\", ")
				.replaceAll("templateDetailName:", "\"templateDetailName\":\"")
				.replaceAll("templateTagCode:", "\"templateTagCode\":\"")
				.replaceAll("templateDetailContents:", "\"templateDetailContents\":\"").replaceAll("}", "\"}")
				.replaceAll("}\"", "}");
		System.out.println(jsonString);

		try {
			mav.addObject("templateList", jsonString);
			mav.setViewName("list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// index template 정보 가져오기
	private void getBirTemplateList(ModelAndView mav) {
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;
		String jsonString = null;

		templateInfoList = this.session.selectList("getBirTemplateList");
		System.out.println(templateInfoList.toString());
		jsonString = templateInfoList.toString().replaceAll("TemplateDetailBean", "").replaceAll("\\(", "{")
				.replaceAll("\\)", "}").replaceAll("=", ":")
				.replaceAll("templateDetailCode:", "\"templateDetailCode\":\"").replaceAll(", ", "\", ")
				.replaceAll("templateDetailName:", "\"templateDetailName\":\"")
				.replaceAll("templateTagCode:", "\"templateTagCode\":\"")
				.replaceAll("templateDetailContents:", "\"templateDetailContents\":\"").replaceAll("}", "\"}")
				.replaceAll("}\"", "}");
		System.out.println(jsonString);

		try {
			mav.addObject("templateList", jsonString);
			mav.setViewName("list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// index template 정보 가져오기
	private void getEtcTemplateList(ModelAndView mav) {
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;
		String jsonString = null;

		templateInfoList = this.session.selectList("getEtcTemplateList");
		System.out.println(templateInfoList.toString());
		jsonString = templateInfoList.toString().replaceAll("TemplateDetailBean", "").replaceAll("\\(", "{")
				.replaceAll("\\)", "}").replaceAll("=", ":")
				.replaceAll("templateDetailCode:", "\"templateDetailCode\":\"").replaceAll(", ", "\", ")
				.replaceAll("templateDetailName:", "\"templateDetailName\":\"")
				.replaceAll("templateTagCode:", "\"templateTagCode\":\"")
				.replaceAll("templateDetailContents:", "\"templateDetailContents\":\"").replaceAll("}", "\"}")
				.replaceAll("}\"", "}");
		System.out.println(jsonString);

		try {
			mav.addObject("templateList", jsonString);
			mav.setViewName("list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void getDetailPageCtl(ModelAndView mav) {

	}

	private void getExPreView(Model model) {

	}

	private void MoveProduce(Model model) {

	}

	private void getPreView(Model model) {

	}

	private void getGreetMsg(Model model) {

	}

	private void getMakingPTLData(ModelAndView mav) {

	}

	private void deleteMakingPTLData(Model model) {

	}

	private void ModifyMakingPTLData(Model model) {

	}

	private void selectGuestBook() {

	}

	private void insertGuestBook() {

	}

	private void deleteGuestBook() {

	}

	private boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}

}
