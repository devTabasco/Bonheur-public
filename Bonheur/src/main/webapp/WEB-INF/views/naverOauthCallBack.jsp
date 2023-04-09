<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="../../resources/js/common.js"></script>
</head>
<body>
</body>
<script type="text/javascript">0
	  var naver_id_login = new naver_id_login("VI3uzlz0i2g1eRgy7BmK", "http://bonheur.hoonzzang.com:8001/NaverCallBack");
	  // 접근 토큰 값 출력
	  var naverToken = naver_id_login.oauthParams.access_token;
	  console.log(naverToken);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	console.log(naver_id_login);
	console.log(naver_id_login.getProfileData('email'));
	console.log(naver_id_login.getProfileData('nickname'));
	console.log(naver_id_login.getProfileData('age'));
    serverCall();
  }
  
  function serverCall(){
		const form = createForm("", "getNaverInfo", "post");
		const hidden = createInputBox("hidden", "token", naverToken, "", "");
		form.appendChild(hidden);
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>