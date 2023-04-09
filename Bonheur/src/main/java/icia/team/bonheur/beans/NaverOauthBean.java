package icia.team.bonheur.beans;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class NaverOauthBean {
	private String resultcode;
	private NaverResponseBean response;
	
}
