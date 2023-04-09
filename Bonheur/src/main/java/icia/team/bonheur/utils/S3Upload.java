package icia.team.bonheur.utils;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

import java.io.File;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.io.InputStream;

import com.amazonaws.services.s3.model.S3Object;

import icia.team.bonheur.MainController;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class S3Upload {
    BasicAWSCredentials credentials = new BasicAWSCredentials("AWS Access Key", "AWS Secret Key");
    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
        .withCredentials(new AWSStaticCredentialsProvider(credentials))
        .withRegion("ap-northeast-2")
        .build();

    public void uploadFile() {
        String bucketName = "bonheur-storage";
        String fileName = "resources/test.jpg";
        File file = new File("이미지 파일 경로");	   

        try {
            s3Client.putObject(bucketName, fileName, file);
            getImageLink();
        } catch(AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
        }
    }
    
    public void uploadFile(String bucketName, String fileName, File file) {

        try {
            s3Client.putObject(bucketName, fileName, file);
            getImageLink();
        } catch(AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
        }
    }
    
    public void getImageLink() {
    	//System.out.println("https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/test.jpg");
    }
}


