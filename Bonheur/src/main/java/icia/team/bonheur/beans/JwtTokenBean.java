package icia.team.bonheur.beans;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class JwtTokenBean {
	private String memberCode;
	private String memberEmail;
	private String memberSubEmail;
	private String publisher;
}
