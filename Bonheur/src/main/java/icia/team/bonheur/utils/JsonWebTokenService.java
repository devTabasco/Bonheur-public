package icia.team.bonheur.utils;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;
import org.springframework.stereotype.Component;

import icia.team.bonheur.beans.JwtTokenBean;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JsonWebTokenService {
	//expiredData는 Long type으로 만들어야함.
	private long expiredData = 1000L * 60 * 30;
	
	public String tokenIssuance(JwtTokenBean tokenBody, String userKey) { //userKey는 우리가 정해서 전달하면 됨. 현재는 groupCode
		/* JWT Specification Configure 1 : Header */
		Map<String, Object> jwtHeaders = new HashMap<>(); // Map : key-value pair
		//HashMap이 추상체, Map이 구현체
		jwtHeaders.put("typ", "JWT");
		jwtHeaders.put("alg", "HS256"); //algorithm
		
		/* JWT Specification Configure 2-1 : SignatureAlgorithm */
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		
		/* JWT Specification Configure 2-2 : SecretKey */
		Key secretKey = new SecretKeySpec(userKey.getBytes(), signatureAlgorithm.getJcaName()); //getJcaName = HS256;
		
		return Jwts.builder() //builder를 사용하면, 해당 클래스에 바로 set을 넣어줄 수 있다. //thumbnail에서 비슷하게 사용.
				.setHeader(jwtHeaders) //.setHeaderParam을 이용해서 setHeader에 Map을 넣지 않고, 넣을수도 있다.
				.setSubject("BonheurJWT")
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + expiredData))
				.claim("TokenBody", tokenBody) //jwtTokenBean을 claim에 저장 //우리가 사용할 정보
				.signWith(signatureAlgorithm, secretKey) //.signWith(SignatureAlgorithm.HS256, secretKey.getBytes())로 적을수도 있다.
				.compact(); //toString();
	}
	
	public boolean tokenExpiredDateCheck(String userToken, String userKey) throws Exception {
		boolean result = false;
		
		try {
			Claims claims = Jwts.parser().setSigningKey(userKey.getBytes())
					.parseClaimsJws(userToken)
					.getBody(); //Payload부분만 가져오기
			return !claims.getExpiration().before(new Date());
		}catch (ExpiredJwtException e) {
//			throw new Exception("Token does not contain expiration date");
			return result;
		}
	}
	
	//token에 담긴 정보 확인
	public Map<String, Object> getTokenInfo(String userToken, String userKey) throws Exception {
		Claims claims = null;
		
		try {
			claims = Jwts.parser().setSigningKey(userKey.getBytes())
					.parseClaimsJws(userToken)
					.getBody();			
		}catch (Exception e) {
			throw new Exception("Token does Not Exist");
		}
		
		return claims;
	}
	
}
