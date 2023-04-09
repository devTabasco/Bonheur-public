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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" id="changeStyle" href="../../resources/css/styleGuide.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/common.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <script src="../../resources/js/common.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">
function reqEmailAuth(){
	/* RFC 522 : Internet Message Format */
	//let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
 	let value = document.getElementsByName('email')[0].value + '@' + document.getElementsByClassName("form-select")[0].value;
 	const email = createInputBox("hidden", "memberEmail", value, "", "");

 	let formData = new FormData();
 	formData.append(email.name, email.value);
 	serverCallByFetchAjax(formData, '/Api/EmailAuth', 'post', 'resEmailAuth');
}

function resEmailAuth(serverData){
	if(serverData.message == 'true'){
		document.getElementsByName("email")[0].readOnly = true;
		document.getElementsByName("email")[0].style.backgroundColor="rgba(195, 195, 210, 0.5)"
		document.getElementsByName("email")[0].style.color="#6C757D"
		document.getElementsByName("emailDup")[0].hidden = true;
	}else if(serverData.message == 'emailDup'){
		console.log(serverData);
		document.getElementsByName("emailDup")[0].hidden = "";
		serverData.message = "";
	}
}

function resEmailAuthCheck(serverData){
	if(serverData.message == 'true'){
		document.getElementsByName("mailAuthSuccess")[0].hidden = "";
		document.getElementsByName("mailAuthFail")[0].hidden = true;
		document.getElementsByName("emailAuthCode")[0].readOnly = true;
		document.getElementsByName("emailDup")[0].hidden = true;
		document.getElementsByName("emailAuthCode")[0].style.backgroundColor="rgba(195, 195, 210, 0.5)"
		document.getElementsByName("emailAuthCode")[0].style.color="#6C757D"
	}else if(serverData.message == 'false'){
		document.getElementsByName("mailAuthFail")[0].hidden = "";
		document.getElementsByName("mailAuthSuccess")[0].hidden = true;
		document.getElementsByName("emailDup")[0].hidden = true;
		serverData.message = "";
	}else{
		console.log(serverData);
	}
	
	//if(serverData.message != null) messageController(true, serverData.message);
	//const panel = document.getElementsByClassName('panel')[0];
	//panel.children[0].value = '';
	//if(serverData.message.split(':')[0].includes('인증')){
	//	const authCode = createTextarea('empEmail', '인증코드를 입력해주세요', '', 'box small auth');
	//	panel.replaceChild(authCode, panel.firstElementChild);
		
	//	panel.children[1].setAttribute('onclick','emailAuthCheck()');
	//	panel.children[1].innerText = '인증 코드 전송';
	//}else panel.children[0].placeholder = '이메일주소 입력';
	
}

/* 인증 코드 전송 >> View type */
function emailAuthCheck(){
	const authCode = document.getElementsByName('emailAuthCode')[0];
	if(authCode.value != null && authCode.value != ''){
	 	let formData = new FormData();
	 	let value = document.getElementsByName('email')[0].value + '@' + document.getElementsByClassName("form-select")[0].value;
	 	const email = createInputBox("hidden", "memberEmail", value, "", "");
	 	
		formData.append(authCode.name, authCode.value);
		formData.append(email.name, email.value);
		serverCallByFetchAjax(formData,'/Api/EmailAuthCheck', 'post', 'resEmailAuthCheck');
	}else{
		//messageController(true, 'Auth Code Error:메일로 받은 인증코드를 복사하여 입력해주세요');
		return;
	}		
}

function registration(){
	const name = document.getElementsByName('memberName')[0];
	const phone = document.getElementsByName('memberPhone')[0];
	const password = document.getElementsByName('memberPassword')[0];
	 	
	if(name.value != null && name.value != '' && phone.value != null && phone.value != '' && password.value != null && password.value != ''){
		
	 	let value = document.getElementsByName('email')[0].value + '@' + document.getElementsByClassName("form-select")[0].value;
	 	const email = createInputBox("hidden", "memberEmail", value, "", "");
	 	
	 	let subValue = document.getElementsByName('memberSubEmail')[0].value + '@' + document.getElementsByClassName("subEmail")[0].value;
	 	const subEmail = createInputBox("hidden", "memberSubEmail", subValue, "", "");
		
	 	let clientData = [];
	 	
	 	clientData.push([name.name, name.value]);
	 	clientData.push([phone.name, phone.value]);
	 	clientData.push([email.name, email.value]);
	 	clientData.push([password.name, password.value]);
	 	clientData.push([subEmail.name, subEmail.value]);
	 	
	 	if(document.getElementsByName('emailAuthCode')[0].readOnly == true){
	 		serverCallByRequest('/View/Registration', 'post', clientData);
	 	}
	}
}

function resRegistration(serverData){
	console.log(serverData);
}
window.onload = function(){
	let m = document.getElementsByName("memberName")[0];
	m.onblur = function (e) {
	    if(!lengthCheck(m)) {
	    	document.getElementsByName("nameLengthCheck")[0].hidden = "";	
	    }else{
	    	document.getElementsByName("nameLengthCheck")[0].hidden = true;	
	    }
	};
	let s = document.getElementsByName("memberPhone")[0];
	s.onblur = function (e) {
	    if(!lengthCheck(s)) {
	    	document.getElementsByName("phoneLengthCheck")[0].hidden = "";
	    }else{
	    	document.getElementsByName("phoneLengthCheck")[0].hidden = true;	
	    }
	};
	let g = document.getElementsByName("memberPassword")[0];
	g.onblur = function (e) {
	    if(!lengthCheck(g)) {
	    	document.getElementsByName("passwordLengthCheck")[0].hidden = "";
	    }else{
	    	document.getElementsByName("passwordLengthCheck")[0].hidden = true;	
	    }
	};
}

</script>
<body>
    <div class="wrapper">
        <div class="frame">
            <div class="box-big">
                <div class="logo" style="margin: 40px 0;"><a href="/">Bonheur</a></div>
                <p class="kor" style="margin-bottom: 15px;">등록할 계정 정보를 입력해주세요.</p>
                <input type="text" class="input-box-cm kor" name="memberName" style="margin-bottom: 15px;" placeholder=" 이름을 입력하세요"/>
                <div name="nameLengthCheck" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-exclamation-diamond"></i> 2~5자 이내로 입력해주세요</div>
                <input type="text" class="input-box-cm kor" name="memberPhone" style="margin-bottom: 15px;" placeholder=" 핸드폰 번호를 입력하세요"/><br>
                <div name="phoneLengthCheck" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-exclamation-diamond"></i> 10~11자 이내로 입력해주세요</div>
                <div style="display: inline-flex; margin-bottom: 15px;">
                    <input type="text" name="email" class="input-box-cm input-box-st kor" style="width: 130px;" placeholder=" 이메일 아이디"/>
                    <span style="line-height: 40px; margin: 0 12px;">@</span>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.com">hanmail.com</option>
                     </select>
                </div><br>
                <div name="emailDup" class="warning" style="margin-bottom: 15px; color: red"  hidden><i class="bi bi-exclamation-diamond"></i>이미 가입된 이메일 입니다.</div>
                <button type="button" class="btn btn-primary btn-produce-sm kor" style="margin-bottom: 15px;" onClick="reqEmailAuth()">인증 번호 요청</button><br>
                <input type="text" class="input-box-cm input-box-st kor" name="emailAuthCode" style="margin-bottom: 15px; width: 130px" placeholder=" 인증번호 입력"/>
                <button type="button" class="btn btn-primary btn-xs kor emailAuthCheck" onClick="emailAuthCheck()">인증 확인</button><br>
                <div name="mailAuthSuccess" class="warning" style="margin-bottom: 15px;" hidden><i class="bi bi-check-circle"></i> 이메일이 인증되었습니다</div>
                <div name="mailAuthFail" class="warning" style="margin-bottom: 15px; color: red"  hidden><i class="bi bi-exclamation-diamond"></i> 이메일을 인증해주세요</div>
                <input type="password" class="input-box-cm kor" name="memberPassword" style="margin-bottom: 15px;" placeholder=" 비밀번호를 입력하세요"/>
                <div name="passwordLengthCheck" class="warning" style="margin-bottom: 15px; color: red" hidden><i class="bi bi-exclamation-diamond"></i> 8~20자 이내로 입력해주세요</div>
                <div style="display: inline-flex; margin-bottom: 15px;">
                    <input type="text" name="memberSubEmail" class="input-box-cm input-box-st kor" style="width: 130px;" placeholder=" 보조이메일 입력"/>
                    <span style="line-height: 40px; margin: 0 12px;">@</span>
                    <select class="form-select subEmail" aria-label="Default select example">
                        <option selected>gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.com">hanmail.com</option>
                    </select>
                </div><br>
                <button type="button" class="btn btn-primary btn-produce-md kor" style="margin: 20px 0;" onClick="registration()">가입하기</button>
                </div>
            </div> 
        </div>
</body>
</html>