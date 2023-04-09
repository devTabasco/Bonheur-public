<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../resources/js/beforeAuth.js"></script>
    <script src="../../resources/js/common.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Login</title>
    <!-- script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script-->
    <link rel="stylesheet" type="text/css" id="changeStyle" href="../../resources/css/styleGuide.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/common.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body onload="OauthImageProcessing()">
    <div class="wrapper">
        <div class="frame">
            <div class="box">
                <div class="logo" style="margin: 60px 0;"><a href="/">Bonheur</a></div>
                <p class="kor">로그인 정보를 입력하세요.</p>
                <input type="text" class="input-box-cm kor" style="margin: 20px 0;" placeholder="이메일을 입력해주세요" name="memberEmail"/>
                <div name="mailAuthFail" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-check-circle"></i>이메일 양식을 확인해주세요.</div>
                <input type="password" class="input-box-cm kor" placeholder=" 비밀번호를 입력해주세요" name="memberPassword"/>
                <div name="mailAuthFail" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-check-circle"></i>비밀번호는 8~20자리 입니다.</div>
                <button type="button" class="btn btn-primary btn-produce-md kor" style="margin: 20px 0;" onClick="accessCtl()">Login</button><br>
                <div class="snslogBox">
                    <div id="naver_id_login" onClick="naverLogin()"></div>
                    <!-- img src="../../resources/images/naverCircle.png" style="width: 50px; cursor: pointer;" onClick="naverLogin()"-->
                    <p class="kor" style="color: #58aaff; margin-top: 10px;">SNS 계정으로 간편 로그인</p>
                </div>
                <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2 kor" style="color: #6C757D;">아직 계정이 없으신가요?</p>
                    <a href="/SignUp"><button type="button" class="btn btn-primary btn-xs kor" style="width: 120%;">계정 생성</button></a>
                </div>
            </div> 
        </div>
    </div>
</body>
<script type="text/javascript">
        var naver_id_login = new naver_id_login("VI3uzlz0i2g1eRgy7BmK", "http://192.168.0.36/NaverCallBack");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://192.168.0.36");
        naver_id_login.setState(state);
        //naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
        
        function OauthImageProcessing(){
        	document.getElementById('naver_id_login').children[0].children[0].src="../../resources/images/naverlog.png";
        	document.getElementById('naver_id_login').children[0].children[0].style.width="8vw";
        	document.getElementById('naver_id_login').style.display="inline-block";
        	
        }
</script>
</html>