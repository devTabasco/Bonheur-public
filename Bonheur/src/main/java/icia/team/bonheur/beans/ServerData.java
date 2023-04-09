package icia.team.bonheur.beans;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class ServerData {
	private String message;
	private String storeCode;
	private String storeName;
	private String empCode;
	private String empName;
	private String empLevCode;
	private String empLevName;
	private String empEmail;
	private String empImageCode;
	private String storeImageCode;
	private String accessDate;
}
