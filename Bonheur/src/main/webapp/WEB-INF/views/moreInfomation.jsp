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
    <title>moreInfomation</title>
    <!-- script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script-->
    <link rel="stylesheet" type="text/css" id="changeStyle" href="../../resources/css/styleGuide.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/common.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="frame">
            <div class="box">
            <div id="naver_id_login"></div>
                <div class="logo" style="margin: 30px 0;"><a href="/">Bonheur</a></div>
                <p class="kor">아래 추가 정보를 입력하세요.</p>
                <input type="text" class="input-box-cm kor" style="margin: 20px 0;" placeholder="보조이메일을 입력해주세요" name="memberSubEmail"/>
                <div name="mailAuthFail" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-check-circle"></i>이메일 양식을 확인해주세요.</div>
                <button type="button" class="btn btn-primary btn-produce-md kor" style="margin: 20px 0;" onClick="naverMemberJoin()">Login</button><br>
            </div> 
        </div>
    </div>
</body>
<script type="text/javascript">
	function naverMemberJoin(){
		let clientData = [];
		clientData.push(["memberSubEmail",document.getElementsByName('memberSubEmail')[0].value]);
		
		serverCallByRequest("/naverMemberJoin","post",clientData);
	}
</script>
</html>