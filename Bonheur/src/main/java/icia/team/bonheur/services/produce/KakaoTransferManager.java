package icia.team.bonheur.services.produce;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;

import icia.team.bonheur.BufferedImageLuminanceSource;

public class KakaoTransferManager {
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
			break;

		default:
			break;
		}
	}
	
	private void getKakaoTransferLink(Model model) {
		try {
            // QR 코드 이미지 파일을 읽어옵니다.
            File file = new File("C:\\Users\\User\\Desktop\\qrcode.jpeg");
            BufferedImage image = ImageIO.read(file);
            
            // QR 코드 이미지를 분석합니다.
            LuminanceSource source = new BufferedImageLuminanceSource(image);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            Result result = new MultiFormatReader().decode(bitmap);
            
            // QR 코드에서 링크를 추출합니다.
            String link = result.getText();
            
            System.out.println("Link: " + link);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NotFoundException e) {
            e.printStackTrace();
        }
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
