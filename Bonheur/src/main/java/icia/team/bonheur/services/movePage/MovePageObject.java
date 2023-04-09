package icia.team.bonheur.services.movePage;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.ItemList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.TemplateDetailBean;
import icia.team.bonheur.utils.ProjectUtils;

@Service
public class MovePageObject {
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private SqlSessionTemplate session;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1:
			break;

		default:
			break;
		}
	}
	
	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			this.getDetailPage(mav);
			break;
		case 2:
			this.getMyPage(mav);
			break;
		case 3:
			this.createItemFile(mav);
			break;
		case 4:
			this.moveProduce(mav);
			break;
		default:
			break;
		}
	}
	
	private void moveProduce(ModelAndView mav) {
		MemberBean member = (MemberBean)mav.getModel().get("member");
		MemberBean memberInfo = null;
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ItemBean itemBean = new ItemBean();
		
		itemBean.setTemplateCode(member.getWishList().get(0).getTemplateCode());
		itemList.add(itemBean);
		member.setItemList(itemList);
		
		try {
			memberInfo = (MemberBean)this.utils.getAttribute("memberInfo");
			member.setMemberCode(memberInfo.getMemberCode());
			
			ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(member);
            
            mav.addObject("itemInfo",json);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	private void createItemFile(ModelAndView mav) {
		MemberBean member = (MemberBean)mav.getModel().get("memberInfo");
		MemberBean memberInfo = null;
		
		try {
			memberInfo = (MemberBean)this.utils.getAttribute("memberInfo");
			member.setMemberCode(memberInfo.getMemberCode());
            
			ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(member);
            
            mav.addObject("itemInfo",json);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		member.setMemberCode(memberInfo.getMemberCode());
		
		System.out.println("createItemFile"+ member.toString());
		
		File existingFile = new File("D:\\changyong\\bonheur\\src\\main\\webapp\\WEB-INF\\views\\template\\"+member.getItemList().get(0).getTemplateCode().toLowerCase()+".jsp"); // 기존 파일 객체 생성
		// 새로운 파일 객체 생성
//	    File newFile = new File("D:\\Bonheur\\bonheur\\src\\main\\webapp\\WEB-INF\\views\\item\\"+member.getItemList().get(0).getItemCode().toUpperCase()+".jsp");

	        try {
//	        	MemberBean member = (MemberBean)this.utils.getAttribute("memberInfo");
	        	
	            // 기존 파일 읽기
	            BufferedReader reader = new BufferedReader(new FileReader(existingFile));
	            String line = reader.readLine();
	            StringBuilder content = new StringBuilder();
	            while (line != null) {
	                content.append(line);
	                line = reader.readLine();
	                if (line != null) {
	                    content.append(System.lineSeparator());
	                }
	            }
	            reader.close();

	            // 새로운 파일 쓰기
//	            BufferedWriter writer = new BufferedWriter(new FileWriter(newFile));
//	            writer.write(content.toString());
//	            writer.close();

	            System.out.println("새로운 파일이 생성되었습니다.");
	            mav.setViewName("produceWedding");
	            ObjectMapper mapper = new ObjectMapper();
	            String json = mapper.writeValueAsString(member);
	            mav.addObject("itemInfo",json);
	        } catch (Exception e) {
	            System.out.println("파일 생성 중 오류가 발생했습니다.");
	            e.printStackTrace();
	        }
		}
		
	
	private void getMyPage(ModelAndView mav) {
		
		mav.setViewName("mypage");
	}
	
	private void getDetailPage(ModelAndView mav) {
		String templateCode = (String)mav.getModel().get("templateCode");
		TemplateDetailBean templateDetailBean = null;
		List<TemplateDetailBean> templateInfoList = null;
		String jsonString = null;

		templateInfoList = this.session.selectList("getTemplateDetailInfo", templateCode);
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
			mav.addObject("templateDetailInfo", jsonString);
			mav.setViewName("detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void getEventPage(ModelAndView mav) {
		
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
	
}
