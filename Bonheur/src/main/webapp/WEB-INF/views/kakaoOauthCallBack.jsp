<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="../../resources/js/common.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body onload="requestUserInfo()">
<h1>kakaoOauthCallBack</h1>
<button class="api-btn" onclick="requestUserInfo()">사용자 정보 가져오기</button>
</body>
<script type="text/javascript">
Kakao.init('aa7a2e9f7e56abef76c7bfab61fb9873');
function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        console.log(JSON.stringify(res));
      })
      .catch(function(err) {
    	  console.log(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
</html>