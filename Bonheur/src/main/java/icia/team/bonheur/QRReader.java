package icia.team.bonheur;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Component;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;

@Component
public class QRReader {
		
	public QRReader() {}
		
	public String getLinkInQR(File file) {
		String link = null;
		try {
            // QR 코드 이미지 파일을 읽어옵니다.
//            File file = new File("C:\\Users\\User\\Desktop\\qrcode.jpeg");
            BufferedImage image = ImageIO.read(file);
            
            // QR 코드 이미지를 분석합니다.
            LuminanceSource source = new BufferedImageLuminanceSource(image);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            Result result = new MultiFormatReader().decode(bitmap);
            
            // QR 코드에서 링크를 추출합니다.
            link = result.getText();
            
            System.out.println("Link: " + link);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NotFoundException e) {
            e.printStackTrace();
        }
		return link;
	}
	
        
}