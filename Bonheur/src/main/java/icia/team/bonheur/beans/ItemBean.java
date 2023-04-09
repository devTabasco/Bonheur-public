package icia.team.bonheur.beans;

import java.util.ArrayList;

import lombok.Data;
@Data
public class ItemBean {
	private String itemCode;
	private String invitationURL;
	private String invitationTitle;
	private String greetingMessage;
	private String thumbNailImage;
	private String mainImage;
	private String itemStatus;
	private String expiredDate;
	private String builtDate;
	private String templateCode;
	private String templateName;
	private ArrayList<TemplateDetailBean> templateDetailList;
	private ArrayList<SubOptionBean> subOptionList;
}
