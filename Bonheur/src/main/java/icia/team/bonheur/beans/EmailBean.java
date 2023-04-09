package icia.team.bonheur.beans;

import java.util.ArrayList;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EmailBean {
	private String sender;
	private String senderName;
	private ArrayList<String[]> receiver;
	private String subject;
	private boolean isHtml;
	private String contents;
}
