<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>MyInfoEdit</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/styleGuide.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/layout.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/createDiv.css" />
        <script type="text/javascript" src="resources/js/common.js"></script>
        <script type="text/javascript" src="resources/js/pageController.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
<body>
    <div id="guideLine" style="margin-top: 50px;">
    <div id="nav" style="z-index: 1">
        <div>
            <ul class="nav-container">
                <li><div class="logo" style="line-height: 10vh;"><a class="logo" href="/">Bonheur</a></li>
                <li class="nav-item kor nav-category" onClick="pageReturn(0)" style="margin-left:40%;">청첩장</li>
                <li class="nav-item kor nav-category" onClick="pageReturn(1)">감사장</li>
                <li class="nav-item kor nav-category" onClick="pageReturn(2)">돌잔치</li>
                <li class="nav-item kor nav-category" onClick="pageReturn(3)">기타 초대장</li>
                <li class="nav-item" style="margin-left:10%"><a><div class="bi bi-person-circle b" style="font-size: 30px;" onClick="openModal(0)"></div></a></li>
                <li class="nav-item" style="margin-left:20px"><a><div class="bi bi-bell b" style="font-size: 30px;"></div></a></li>
                <li class="nav-item" hidden><input type="text" class="input-box input-box-sm" placeholder=""></li>
                <li class="nav-item" style="margin-left:20px"><div class="bi bi-search b" style="font-size: 30px;" onclick="openSearchBar()"></div></li>
            </ul>
        </div>
    </div>
    <div class="modal-box-sm" hidden>
        	<div class="kor Bold modal-content" style="font-size: 14px; color: #6C757D" onClick="pageReturn(4)">마이페이지</a></div>
        	<hr class="hr-solid">
        	<div class="kor Bold modal-content" style="font-size: 14px; color: #6C757D" name="in" onClick="login()" hidden>로그인</div>
        	<div class="kor Bold modal-content" style="font-size: 14px; color: #6C757D" name="out" onClick="logout()" hidden>로그아웃</div>
    </div>
    <div id="contents-left2">
         <div>
            <ul class="conL-container" style="color:#6C757D">
                 <li class="kor" style="font-size: 14px; margin-top: 100px;"><p style="margin-bottom: 0px;">안녕하세요</p></li>
                 <li class="kor Bold" style="font-size: 20px; margin-bottom: 50px;"><a>${memberInfo.memberName} 님</a></li>
                 <li class="con-item kor" style="font-size: 17px;" onclick="mypageReturn(2)"><a>주문 내역 조회</a></li>
                 <li class="con-item kor" style="font-size: 17px;" onclick="mypageReturn(3)"><a>위시리스트</a></li>
                 <li class="con-item kor Bold" style="font-size: 17px;" onclick="mypageReturn(4)"><a>회원 정보 수정</a></li>
                 <li class="con-item kor" style="font-size: 17px;"><a>회원 탈퇴</a></li>
             </ul>
         </div>
    </div>
    <div id="contents-right2">
        <div class="row conR-container" style="color:#6C757D">
            <div class="col-md-9 con-item kor Bold"  style="font-size: 20px;"><a>회원 정보 수정</a></div>
            <button type="button" style="width: 150px; margin: 0 0 0 auto;" class="col-md-3 btn btn-primary btn-produce-sm kor" onclick="changeButtonClick()">변경하기</button>
        </div>
        <hr class="marginTop0">
        <!--<button id="odBtn" onclick="createTemplateBox();">주문자 정보</button>-->
        <div class="row" style="margin-top: 20px; margin-left: 30px;">
            <div class="col-md-2 kor" style="line-height: 4;">
                <p>이름</p>
                <p>핸드폰 번호</p>
                <p>이메일 주소</p>
                <p>비밀 번호</p>
                <p name="newPass" hidden>새 비밀번호</p>
                <p name="newPassCheck" hidden>새 비밀번호 확인</p>
                <p>복구 이메일 주소</p>
            </div>
            <div class="col-md-10 kor eng"  style="line-height: 4;">
                <p>${memberInfo.memberName }</p>
                <input type="text" name="memberPhoneSplit" class="input-box input-box-sm" style="text-align:center; width: 100px;" value= ${fn:substring(memberInfo.memberPhone, 0, 3)}>
                <span style="margin: 0 5px;">-</span>
                <input type="text" name="memberPhoneSplit" class="input-box input-box-sm" style="text-align:center; width: 100px;" value= ${fn:substring(memberInfo.memberPhone, 3, 7)}>
                <span style="margin: 0 5px;">-</span>
                <input type="text" name="memberPhoneSplit" class="input-box input-box-sm" style="text-align:center; width: 100px;" value= ${fn:substring(memberInfo.memberPhone, 7, 11)}>
                <div name="phoneWarning" class="warning" style="line-height: 0; color: red"  hidden><i class="bi bi-exclamation-diamond"></i> 전화번호를 다시 확인해주세요.</div>
                <p>${memberInfo.memberEmail }</p>
                <div style="display: flex; align-items: center;">
                    <input name="memberPassword" type="password" class="input-box input-box-md margin10">
                    <button type="button" style="width: 150px;" class="btn btn-primary btn-produce-sm kor" onclick="passCheck()">비밀번호 변경</button><br>
                </div>
                <div name="passWarning" class="warning" style="line-height: 0; color: red"  hidden><i class="bi bi-exclamation-diamond"></i> 현재 사용 중인 비밀번호를 입력해주세요</div>
                <div><input name="newPassInput" type="password" class="input-box input-box-md margin10" hidden></div>
                <div name="passwordLengthCheck" class="warning" style="line-height: 0; color: red" hidden><i class="bi bi-exclamation-diamond"></i> 8~20자 이내로 입력해주세요</div>
                <div><input name="newPassCheckInput" type="password" class="input-box input-box-md margin10" hidden></div>
                <div name="equalCheckFail" class="warning" style="line-height: 0; color: red" hidden><i class="bi bi-exclamation-diamond"></i> 비밀번호가 일치하지 않습니다</div>
                <div name="equalCheckSuccess" class="warning" style="line-height: 0;" hidden><i class="bi bi-check-circle"></i> 비밀번호 일치</div>
                <div style="display: inline-flex; margin-bottom: 25px; align-items: center;">
                    <input type="text" name="memberSubEmail" class="input-box input-box-st kor" value= ${fn:split(memberInfo.memberSubEmail,'@')[0]} >
                    <span style="line-height: 40px; margin: 0 12px;">@</span>
                    <select class="form-select subEmail" aria-label="Default select example">
                        <option selected value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="zum.com">zum.com</option>
                      </select>
                </div><br>
            </div>
        </div>
    </div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="text-align: center;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">회원정보 변경완료</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>비밀번호가 변경되었습니다. 다시 로그인해주세요.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-primary btn-produce-sm kor" data-bs-dismiss="modal" onclick="modalCheck()">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
    <div id="footer">
        <div>
            <ul class="footer-container">
                <li style="margin-left:5%"><div class="logo" style="line-height: 5vh;"><a class="logo" style="font-size: 20px;">Bonheur</a></div></li>
                <li class="footer-item kor" style="margin-left:60%"><a>서비스 소개</a></li>
                <li class="footer-item kor"><a>이용약관</a></li>
                <li class="footer-item kor"><a>개인정보처리방침</a></li>
            </ul>
            <div id="footer-contents">
                <p class="kor">(주)보네르</p>
                <p class="kor">본사 : 인천광역시 미추홀구 학익동</p>
                <p class="kor">문의전화 : 1588-1588 | 이메일 : info@bonheur.com | 개인정보관리책임자 : 윤지수</p>
                <p class="kor">통신판매업신고번호 : 2023-00001 | 사업자등록번호 : 123-45-56789</p>
                <p class="kor">Copyright ⓒ Bonheur all rights reserved</p>
            </div>
        </div>
    </div>
</div>
</body>
<script>

	function passCheck(){
		const password = document.getElementsByName("memberPassword")[0];
		
		if(password != null && password != ''){
			let formData = new FormData();
			formData.append(password.name, password.value);
			serverCallByFetchAjax(formData, '/Api/PassCheck', 'post', 'resPassCheck');
		}else if(password == null || password == ''){
			document.getElementsByName("passWarning")[0].hidden = "";
		}
	}
	
	function resPassCheck(serverData){
		
		if(serverData.message == 'true'){
			document.getElementsByName("memberPassword")[0].style.backgroundColor='rgba(195, 195, 210, 0.5)';
			document.getElementsByName("memberPassword")[0].style.color='#6C757D';
			document.getElementsByName("passWarning")[0].hidden = true;
			document.getElementsByName("newPass")[0].hidden = "";
			document.getElementsByName("newPassCheck")[0].hidden = "";
			document.getElementsByName("newPassInput")[0].hidden = "";
			document.getElementsByName("newPassCheckInput")[0].hidden = "";
		}else{
			document.getElementsByName("passWarning")[0].hidden = "";
		}
	}
	
	function validation() {
		const password = document.getElementsByName("newPassInput")[0];
		const passCheck = document.getElementsByName("newPassCheckInput")[0];
		let check = false;
		
		    if(!lengthCheck(password)) {
		    	document.getElementsByName("passwordLengthCheck")[0].hidden = "";
		    }else{
		    	document.getElementsByName("passwordLengthCheck")[0].hidden = true;	
		    	
		    	if (password != null && password != '' && passCheck != null && passCheck != ''){
					if(password.value === passCheck.value){
			    		document.getElementsByName("equalCheckFail")[0].hidden = true;	
			    		document.getElementsByName("equalCheckSuccess")[0].hidden = "";	
						check = true;
					}else{
				   		document.getElementsByName("equalCheckFail")[0].hidden = "";	
				   		document.getElementsByName("equalCheckSuccess")[0].hidden = true;	
					}
				}
		    }
		
		return check;
			
	}
	
	function changeButtonClick(){
		const newPass = document.getElementsByName("newPassInput")[0];
		const memberPassword = document.getElementsByName("memberPassword")[0];
		let phoneNumber = "";
		//전화번호 합치기
		for(let i=0;i<3;i++){
			phoneNumber += document.getElementsByName("memberPhoneSplit")[i].value;
		}
		const phone = createInputBox("hidden","memberPhone",phoneNumber,"","");
	 	let subValue = document.getElementsByName('memberSubEmail')[0].value + '@' + document.getElementsByClassName("subEmail")[0].value;
	 	const subEmail = createInputBox("hidden", "memberSubEmail", subValue, "", "");
	 	
	 	if(memberPassword.value != ''){ //비밀번호를 반드시 입력해야 모든 수정이 이루어짐.
		 		if(!newPass.hidden){
					if(validation()){
						if(lengthCheck(phone)){
							let formData = new FormData();
							
							formData.append('memberPassword', newPass.value);
							formData.append(phone.name, phone.value);
							formData.append(subEmail.name, subEmail.value);
							
							serverCallByFetchAjax(formData, '/Api/ChangeMyInfo', 'post', 'resChangeButtonClick');
						}else{
							document.getElementsByName('phoneWarning')[0].hidden = '';
						}
					};
				}else{
					//비밀번호 말고 일반 정보만 변경하는 경우 처리
					if(lengthCheck(phone)){
						let clientData = []
						
						clientData.push([memberPassword.name, memberPassword.value]);
						clientData.push([phone.name, phone.value]);
						clientData.push([subEmail.name, subEmail.value]);
						serverCallByRequest('/View/ChangeMyGeneralInfo', 'post', clientData);
						
					}else{
						document.getElementsByName('phoneWarning')[0].hidden = '';
					}
				}
		}else{
			//비밀번호를 입력하지 않은 경우
			document.getElementsByName('passWarning')[0].hidden = '';
		}
	 }
	 	
		
	
	function resChangeButtonClick(){
		sessionStorage.removeItem('JWT');
		
		const exampleModal = document.getElementById('exampleModal');
		let myModalInstance = new bootstrap.Modal(exampleModal);

		myModalInstance.show();
	}
	
	function modalCheck(){
		serverCallByRequest("/Logout", "post", "");
	}

</script>
</html>