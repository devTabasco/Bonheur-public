package icia.team.bonheur.services.produce;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.qrcode.QRCodeReader;

import icia.team.bonheur.QRReader;
import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.SubOptionBean;
import icia.team.bonheur.utils.ProjectUtils;
import icia.team.bonheur.utils.S3Upload;

@Service
public class PageProcessing extends TransactionAssistant {
	@Autowired //메모리에 올라가있는 Bean과 비교
	private SqlSessionTemplate session;
	private SimpleTransactionManager tranManager;
	@Autowired
	private ProjectUtils utils;
	@Autowired
	private S3Upload s3;
	@Autowired
	private QRReader qrReader;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1: saveProduceStep1ItemDataCtl(model);
			break;
		case 2: saveProduceStep1SubOptionDataCtl(model);
			break;
		case 3: createMobileLink(model);
			break;
		case 4: getQrLink(model);
		break;
			
		default:
			break;
		}
	}
	
	public void backController(int serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case 1:
			break;

		default:
			break;
		}
	}
	
	private void getQrLink(Model model) {
		String qrCode = (String)model.getAttribute("qrCode");
		System.out.println(qrCode);
		byte[] imageBytes = Base64.getDecoder().decode(qrCode.split(",")[1]);
		SubOptionBean subOptionBean = new SubOptionBean();
		
		// 바이트 배열을 BufferedImage 객체로 변환합니다.
        ByteArrayInputStream bis = new ByteArrayInputStream(imageBytes);
        BufferedImage bufferedImage;
		try {
			bufferedImage = ImageIO.read(bis);
			bis.close();
			// BufferedImage 객체를 PNG 파일로 저장합니다.
			File outputfile = new File("output.png"); // 파일 이름은 자유롭게 지정 가능합니다.
			ImageIO.write(bufferedImage, "png", outputfile);
			subOptionBean.setSubOptionValue(qrReader.getLinkInQR(outputfile));
			model.addAttribute("qrLink",subOptionBean);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Transactional
	private void saveProduceStep1ItemDataCtl(Model model) {
		String message = "Access Error:시스템 접속이 실패하였습니다.";
		MemberBean member = (MemberBean)model.getAttribute("memberInfo");
		MemberBean utils = null;
		try {
			utils = (MemberBean)this.utils.getAttribute("memberInfo");
			member.setMemberCode(utils.getMemberCode());
			System.out.println(member.toString());
		} catch (Exception e1) {e1.printStackTrace();}
	    
	    /* Transaction */
	    try {
	        this.tranManager = getTransaction(false);
	        this.tranManager.tranStart();
	        System.out.println("PageProcessing :: try 진입");
	        
	        if(this.convertToBoolean(this.session.insert("insItemInfo", member))) {
	        	System.out.println("PageProcessing :: if 진입");
	            this.tranManager.commit();
	            
	            String itemCode = member.getItemList().get(0).getItemCode();
	    	    byte[] thumbNailImageBytes = Base64.getDecoder().decode(member.getItemList().get(0).getThumbNailImage().split(",")[1]);
	    	    byte[] mainImageBytes = Base64.getDecoder().decode(member.getItemList().get(0).getMainImage().split(",")[1]);

	    	    File file = new File("test1.jpg");
	    	    FileOutputStream outputStream;
	    		try {
	    			outputStream = new FileOutputStream(file);
	    			outputStream.write(thumbNailImageBytes);
	    			outputStream.close();
	    		} catch (Exception e) {e.printStackTrace();}
	    	    String bucketName = "bonheur-storage";
	    	    String fileName = "resources/images/"+itemCode+"/thumbNail.png";
	    	    s3.uploadFile(bucketName, fileName, file);
	    	    member.getItemList().get(0).setThumbNailImage(fileName);
	    	    
	    	    file = new File("test2.jpg");
	    		try {
	    			outputStream = new FileOutputStream(file);
	    			outputStream.write(mainImageBytes);
	    			outputStream.close();
	    		} catch (Exception e) {e.printStackTrace();}
	    	    bucketName = "bonheur-storage";
	    	    fileName = "resources/images/"+itemCode+"/main.png";
	    	    s3.uploadFile(bucketName, fileName, file);
	    	    member.getItemList().get(0).setMainImage(fileName);
	    	    
	    	    this.session.update("updItemInfo", member);
	    	    this.tranManager.commit();
	    	    //model.addAttribute("memberInfo", itemCode);
	    	    member.getItemList().get(0).setItemCode(itemCode);
	    	    System.out.println("memberInfo.itemCode :: "+ itemCode);
	        } else {
	            member.setMessage(message);
	        }
	    } catch (Exception e) {
	        this.tranManager.rollback();
	    } finally {
	        this.tranManager.tranEnd();
	    }
	}
	
	private void createMobileLink(Model model) {
		String iframeHtml = (String)model.getAttribute("iframeHtml");
		String itemCode = (String)model.getAttribute("itemCode");
		ItemBean itemBean = new ItemBean();
		System.out.println(iframeHtml);
		// 파일 생성 경로 설정
	    String filePath = null;
	    OutputStreamWriter writer = null;
	    SubOptionBean subOptionBean = new SubOptionBean();
	    // 파일 생성 코드 작성
	    try {
	    	//itemStatus 변경 필요
	    	itemBean.setItemCode(itemCode);
	    	itemBean.setItemStatus("1");
	    	if(convertToBoolean(this.session.update("updItemStatus",itemBean))) {
	    		filePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\ROOT\\WEB-INF\\views\\item\\"+itemCode.toUpperCase()+".jsp";
	    		writer = new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8");
	    		writer.write(iframeHtml);
	    		writer.close();
	    	};
	    	
	    	subOptionBean.setSubOptionValue(itemCode);
	    	model.addAttribute("itemCode",subOptionBean);
	    	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Transactional
	private void saveProduceStep1SubOptionDataCtl(Model model) {
	    MemberBean member = (MemberBean)model.getAttribute("memberInfo");
	    String itemCode = member.getItemList().get(0).getItemCode();
	    System.out.println(member.toString());
	    System.out.println("Step1SubOptionDataCtl :: 진입");
	    System.out.println("MemberBean::" + member.toString());
		
		/* Transaction */
		try {
			this.tranManager = getTransaction(false);
			this.tranManager.tranStart();
			System.out.println("Step1SubOptionDataCtl :: try 진입");
			
	        ArrayList<SubOptionBean> subOptionList = member.getItemList().get(0).getSubOptionList();
	        System.out.println("subOptionList::" + subOptionList.size());
	        
	        for (int i = 0; i < subOptionList.size(); i++) {
	        	System.out.println("Step1SubOptionDataCtl :: for 진입");
	        	SubOptionBean subOptionBean = subOptionList.get(i);
	        	//카카오페이 처리
	        	if(subOptionBean.getSubOptionType().equals("kakaoPayQR")) {
	        		byte[] imageBytes = Base64.getDecoder().decode(subOptionBean.getSubOptionValue().split(",")[1]);
	        		
	        		// 바이트 배열을 BufferedImage 객체로 변환합니다.
	                ByteArrayInputStream bis = new ByteArrayInputStream(imageBytes);
	                BufferedImage bufferedImage = ImageIO.read(bis);
	                bis.close();
	                
	                // BufferedImage 객체를 PNG 파일로 저장합니다.
	                File outputfile = new File("output.png"); // 파일 이름은 자유롭게 지정 가능합니다.
	                ImageIO.write(bufferedImage, "png", outputfile);

	        		subOptionBean.setSubOptionValue(qrReader.getLinkInQR(outputfile));
	        	}
	        	System.out.println("subOptionBean :: "+subOptionBean.toString());
	        	member.getItemList().get(0).getSubOptionList().set(0, subOptionBean);
	        	System.out.println("subOptionBean :: "+member.toString());
	        	this.session.insert("insSubOption", member);
	        }
	        this.tranManager.commit();

		} catch (Exception e) {
			e.printStackTrace();
			this.tranManager.rollback();
		} finally {
			this.tranManager.tranEnd();
		}
	    //주문 정보 보내기
	    ItemBean itemBean = this.session.selectOne("getOrderInfo",itemCode);
	    model.addAttribute("orderInfo",itemBean);
	}
	
	private void createUrl(Model model) {
		
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
