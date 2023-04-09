package icia.team.bonheur.services.myInfo;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.team.bonheur.SimpleTransactionManager;
import icia.team.bonheur.TransactionAssistant;
import icia.team.bonheur.beans.ItemBean;
import icia.team.bonheur.beans.MemberBean;
import icia.team.bonheur.beans.WishListBean;
import icia.team.bonheur.utils.JsonWebTokenService;
import icia.team.bonheur.utils.ProjectUtils;

@Service
public class LogDataObject extends TransactionAssistant {
	@Autowired //메모리에 올라가있는 Bean과 비교
	private SqlSessionTemplate session;
	private SimpleTransactionManager tranManager;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private ProjectUtils utils;
	
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1:
			this.addWishList(model);
			break;
		case 2:
			this.deleteWishList(model);
			break;
		case 3:
			this.getWishInfo(model);
			break;
		case 4:
			this.getWishInfoByMyPage(model);
			break;
		case 5:
			this.deleteItem(model);
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
	
	private boolean selectWishList(MemberBean member) {
		boolean result = false;
		
		try {
			result = convertToBoolean(this.session.selectOne("selectWishList", member));
				
		} catch (Exception e) {e.printStackTrace();
		}
		
		return result;
	}
	
	private void getWishInfoByMyPage(Model model) {
		MemberBean member = null;
		WishListBean wishListBean = null;
		ItemBean itemBean = null;
		ArrayList<ItemBean> itemList = new ArrayList<ItemBean>();
		ArrayList<WishListBean> wishList = new ArrayList<WishListBean>();
			try {
				member = (MemberBean)this.utils.getAttribute("memberInfo");
				
				List<WishListBean> wish = this.session.selectList("selectWishByMyPage", member);
				wishList = (ArrayList<WishListBean>)wish;
				
				for(int i=0;i<wishList.size();i++) {
					itemBean = (this.session.selectOne("getTemplateName",wishList.get(i)));
					itemList.add(itemBean);
				}
				
				member.setItemList(itemList);
				member.setWishList(wishList);
				System.out.println(member.toString());
				
				model.addAttribute("wishInfo",member);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	}
	
	private void getWishInfo(Model model) {
		MemberBean member = null;
		WishListBean wishListBean = null;
		ArrayList<WishListBean> wishList = new ArrayList<WishListBean>();
		String message = "네크워크 오류 : 잠시후 다시 시도해주세요";
			try {
				member = (MemberBean)this.utils.getAttribute("memberInfo");
				wishListBean = (WishListBean)model.getAttribute("wishCode");
				wishList.add(wishListBean);
				member.setWishList(wishList);
				
				System.out.println(member.toString());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			if(this.convertToBoolean(this.session.selectOne("selectWishList", member))) {
				member.setMessage("dup");
			}else {
				member.setMessage("usable");
			}
				
			model.addAttribute("memberInfo",member);
	}
	
	@Transactional
	private void addWishList(Model model) {
		MemberBean member = null;
		WishListBean wishListBean = null;
		ArrayList<WishListBean> wishList = new ArrayList<WishListBean>();
		String message = "네크워크 오류 : 잠시후 다시 시도해주세요";
			try {
				member = (MemberBean)this.utils.getAttribute("memberInfo");
				wishListBean = (WishListBean)model.getAttribute("wishCode");
				wishList.add(wishListBean);
				member.setWishList(wishList);
				
				System.out.println(member.toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if(!this.selectWishList(member)) {
				/* Transaction */
				try {
					this.tranManager = getTransaction(false);
					this.tranManager.tranStart();
					
					if(this.convertToBoolean(this.session.insert("insWishList", member))) {
						this.tranManager.commit();
						member.setMessage("addTrue");
						model.addAttribute("memberInfo",member);
					}else {member.setMessage(message);}
				} catch (Exception e) {
					this.tranManager.rollback();
				} finally {
					this.tranManager.tranEnd();
				}
			}else {
				member.setMessage("시스템 오류");
			}
	}
	
	@Transactional
	private void deleteWishList(Model model) {
		MemberBean member = null;
		WishListBean wishListBean = null;
		ArrayList<WishListBean> wishList = new ArrayList<WishListBean>();
		String message = "네크워크 오류 : 잠시후 다시 시도해주세요";
			try {
				member = (MemberBean)this.utils.getAttribute("memberInfo");
				wishListBean = (WishListBean)model.getAttribute("wishCode");
				wishList.add(wishListBean);
				member.setWishList(wishList);
				
				System.out.println("delete : " + member.toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if(this.selectWishList(member)) {
				/* Transaction */
				try {
					this.tranManager = getTransaction(false);
					this.tranManager.tranStart();
					
					if(this.convertToBoolean(this.session.delete("deleteWishList", member))) {
						this.tranManager.commit();
						member.setMessage("delTrue");
						model.addAttribute("memberInfo",member);
						System.out.println("삭제 완료");
					}else {member.setMessage(message);}
				} catch (Exception e) {
					this.tranManager.rollback();
				} finally {
					this.tranManager.tranEnd();
				}
			}else {
				member.setMessage("시스템 오류");
			}
	}
	
	@Transactional
	private void deleteItem(Model model) {
		MemberBean member = null;
		String itemCode = null;
		String message = "네크워크 오류 : 잠시후 다시 시도해주세요";
			try {
				member = (MemberBean)this.utils.getAttribute("memberInfo");
				itemCode = (String)model.getAttribute("itemCode");
				member.getItemList().get(0).setItemCode(itemCode);;
				
				System.out.println("delete : " + member.toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
				/* Transaction */
				try {
					this.tranManager = getTransaction(false);
					this.tranManager.tranStart();
					this.session.delete("deleteGuestBook", member);
					this.session.delete("deleteOptionSub", member);
					if(this.convertToBoolean(this.session.delete("deleteItem", member))) {
						this.tranManager.commit();
						System.out.println("삭제 완료");
					}else {member.setMessage(message);}
				} catch (Exception e) {
					e.printStackTrace();
					this.tranManager.rollback();
				} finally {
					this.tranManager.tranEnd();
				}
	}
	
	private void getTPLDataCtl(Model model) {//템플릿 데이터 가져오기
		
	}
	
	private void ItemDataCheck(Model model) {//해당유저가 갖고있는 모든 템플릿 데이터 유무 확인 (TRLDataCheck() > ItemDataCheck())
		
	}
	
	private void getCompleteTPLLink(ModelAndView mav) {//제작완료 템플릿 가져오기 (getCompletePTLLink() > getCompleteTPLLink())
		
	}
	
	private void deleteWishTPLData(Model model) {// deleteWishPTLData() > deleteWishTPLData()
		
	}
	
	private void makeWishTPL(ModelAndView mav) {// makeWishPTL() > makeWishTPL()
		
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
