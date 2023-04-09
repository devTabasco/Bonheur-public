package icia.team.bonheur.beans;

import java.util.ArrayList;
import lombok.Data;

@Data
public class MemberBean {
	private String message;
	private String memberCode;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberPassword;
	private String memberSubEmail;
	private String memberOauthKey;
	private ArrayList<ItemBean> itemList;
	private ArrayList<WishListBean> wishList;
}
