package icia.team.bonheur.services.template;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ListDataObject {
	public void backController(int serviceCode, Model model) {
		switch (serviceCode) {
		case 1:
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
	
	private void getPageCtl(ModelAndView mav) {
		
	}
	
	private void getTagDataCtl(Model model) {
		
	}
	
	private boolean convertToBoolean(int value) {
		return value>0?true:false;
	}
}
