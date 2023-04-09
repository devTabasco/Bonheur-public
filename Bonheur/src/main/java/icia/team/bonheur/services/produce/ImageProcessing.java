package icia.team.bonheur.services.produce;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.SubOptionBean;
import icia.team.bonheur.utils.ProjectUtils;
import icia.team.bonheur.utils.S3Upload;

@Service
public class ImageProcessing extends TransactionAssistant{
	@Autowired
	private ProjectUtils utils;
	@Autowired //메모리에 올라가있는 Bean과 비교
	private SqlSessionTemplate session;
	private SimpleTransactionManager tranManager;
	@Autowired
	private S3Upload s3;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1: saveGallaryImg(model);
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
	
	private void regThumbNail(Model model) {

	}
	
	private void regMainImg(Model model) {
		
	}
	
	private void getThumbNail(Model model) {
		
	}
	
	private void getMainImg(Model model) {
		
	}

	@Transactional
	private void saveGallaryImg(Model model) {
	    MemberBean member = (MemberBean)model.getAttribute("memberInfo");
	    String itemCode = member.getItemList().get(0).getItemCode();
	    System.out.println(member.toString());
	    System.out.println("ImageProcessing :: 진입");
	    System.out.println("saveGallaryImg::" + member.toString());

	    /* Transaction */
	    try {
	    	this.tranManager = getTransaction(false);
	    	this.tranManager.tranStart();
	        System.out.println("saveGallaryImg <try> 진입");

	        ArrayList<SubOptionBean> subOptionList = member.getItemList().get(0).getSubOptionList();
	        
	        System.out.println("subOptionList::" + subOptionList.size());
	        
	        for (int i = 0; i < subOptionList.size(); i++) {
	            byte[] galleryImageBytes = Base64.getDecoder().decode(member.getItemList().get(0).getSubOptionList().get(i).getSubOptionValue().split(",")[1]);
//	            System.out.println("galleryImageBytes::" + galleryImageBytes);
	            SubOptionBean subOptionBean = subOptionList.get(i);
	            System.out.println("subOptionBean::" + subOptionBean);
	            String subOptionType = subOptionBean.getSubOptionType();
	            String fileName = "resources/images/" + itemCode + "/"  + subOptionType + ".png";
	            System.out.println("fileName::" + fileName);
	            if (subOptionBean.getSubOptionType().startsWith("galleryImage")) {
	                File file = new File("galleryImage.png");//현재위치
	                FileOutputStream outputStream;
	                try {
	                    outputStream = new FileOutputStream(file);
	                    outputStream.write(galleryImageBytes);
	                    outputStream.close();
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	                String bucketName = "bonheur-storage";
	                s3.uploadFile(bucketName, fileName, file);
	                subOptionBean.setSubOptionValue(fileName);
	            }
	            member.getItemList().get(0).getSubOptionList().set(0, subOptionBean);
	            this.session.insert("insSubOption", member);
	        }
	        this.tranManager.commit();
	    } catch (Exception e) {
	    	e.printStackTrace();
	        this.tranManager.rollback();
	    } finally {
	        this.tranManager.tranEnd();
	    }
	    /*
	    //주문 정보 보내기
	    ItemBean itemBean = this.session.selectOne("getOrderInfo",itemCode);
	    model.addAttribute("orderInfo",itemBean);
	    */
	}

	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
