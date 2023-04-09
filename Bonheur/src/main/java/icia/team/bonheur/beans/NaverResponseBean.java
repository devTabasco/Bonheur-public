package icia.team.bonheur.beans;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class NaverResponseBean {
	private	String id;
	private String nickname;
	private String gender;
	private String email;
	private String mobile;
	private String name;
}
