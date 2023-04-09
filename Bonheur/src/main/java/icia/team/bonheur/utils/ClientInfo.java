package icia.team.bonheur.utils;

import org.springframework.stereotype.Component;

@Component
public class ClientInfo {
	
	public final static String getBrowserInfo(String header) {
		String browser = null;
		String version = null;
		
		if(header.toLowerCase().indexOf("windows") != -1) {
			if(header.toLowerCase().indexOf("firefox") != -1) {
				browser = "W-FIREFOX";
				version = header.toLowerCase().split("firefox/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("opera") != -1 || header.toLowerCase().indexOf("opr") != -1) {
				browser = "W-OPERA";
				if(header.toLowerCase().indexOf("opera") != 1) version = header.toLowerCase().split("opera/")[1].split(" ")[0];
				else version = header.toLowerCase().split("opr/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("whale") != -1) {
				browser = "W-WHALE";
				version = header.toLowerCase().split("whale/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("naver") != -1) {
				browser = "W-NAVER";
				version = "inapp";
			}else if(header.toLowerCase().indexOf("trident") != -1) {
				browser = "W-IE";
				version = header.toLowerCase().split("rv:")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("edge") != -1 || header.toLowerCase().indexOf("edg") != -1) {
				browser = "W-EDGE";
				if(header.toLowerCase().indexOf("edge") != -1) version = header.toLowerCase().split("edge/")[1].split("\\.")[0];
				else version = header.toLowerCase().split("edg/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("chrome") != -1) {
				browser = "W-CHROME";
				version = header.toLowerCase().split("chrome/")[1].split("\\.")[0];
			}
		}else {
			if(header.toLowerCase().indexOf("fxios") != -1) {
				browser = "M-FIREFOX";
				version = header.toLowerCase().split("fxios/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("opt") != -1 || header.toLowerCase().indexOf("opr") != -1) {
				browser = "M-OPERA";
				version = header.toLowerCase().split("opt/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("whale") != -1) {
				browser = "M-WHALE";
				version = header.toLowerCase().split("whale/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("naver") != -1) {
				browser = "M-NAVER";
				version = "inapp";
			}else if(header.toLowerCase().indexOf("edge") != -1 || header.toLowerCase().indexOf("edg") != -1) {
				browser = "M-EDGE";
				if(header.toLowerCase().indexOf("edge") != -1) version = header.toLowerCase().split("edge/")[1].split("\\.")[0];
				else version = header.toLowerCase().split("edg/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("crios") != -1) {
				browser = "M-CHROME";
				version = header.toLowerCase().split("crios/")[1].split("\\.")[0];
			}else if(header.toLowerCase().indexOf("duckduckgo") != -1) {
				browser = "M-DUCKDUCKGO";
				version = header.toLowerCase().split("duckduckgo/")[1].split(" ")[0];
			}else if(header.toLowerCase().indexOf("safari") != -1) {
				browser = "M-SAFARI";
				version = header.toLowerCase().split("safari/")[1].split("\\.")[0];
			}
		}
		
		return browser+"(v."+ version + ")";
	}
}
