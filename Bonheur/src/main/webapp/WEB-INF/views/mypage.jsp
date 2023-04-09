<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <script type="text/javascript" src="resources/js/dynamicDiv.js"></script>
        <script type="text/javascript" src="resources/js/pageController.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
<style>
.modal-dialog{
	text-align: center; 
	max-width: 600px; 
	min-width: 400px; 
	margin:auto; 
	position:absolute;
	top:50%;left:50%;
}
.modal-content{
	transform: translate(-50%,-50%);
}
</style>
<body onload="mypageReturn(0)">
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
    <div id="contents" style="background-color: white; height: 0;">
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
                 <li id="order" class="con-item kor Bold" style="font-size: 17px;" onclick="mypageReturn(2)"><a>주문 내역 조회</a></li>
                 <li id="wish" class="con-item kor" style="font-size: 17px;" onclick="mypageReturn(3)"><a>위시리스트</a></li>
                 <li id="info" class="con-item kor" style="font-size: 17px;" onclick="mypageReturn(4)"><a>회원 정보 수정</a></li>
                 <li id="unregister" class="con-item kor" style="font-size: 17px;" onclick="mypageReturn(5)"><a>회원 탈퇴</a></li>
             </ul>
         </div>
    </div>
        <div id="contents-right2">
          <div id="tplStatus">
            <ul class="conR-container" style="color:#6C757D">
                <li id="in" class="con-item kor"  style="font-size: 20px; font-weight: bold" onclick="mypageReturn(0)"><a>제작 중</a></li>
                <li id="co" class="con-item kor"  style="font-size: 20px;" onclick="mypageReturn(1)"><a>제작완료</a></li>
            </ul>
            <hr class="marginTop0">
            <div class="row" style="margin-left:1%;">
			    <!-- Dynamic Insert New Template -->
			</div>
          </div>
          <!-- 위시리스트 -->
          <div id="wishList" hidden>
                	<div class="conR-container" style="color:#6C757D">
		                <div class="con-item kor Bold"  style="font-size: 20px;"><a>위시 리스트</a></div>
		            </div>
		            <hr class="marginTop0" style="margin-bottom: 50px;">
		            <div class="row" style="margin-left:1%;">
			           <!-- Dynamic Insert New Template -->
			        </div>
          </div>
          <!-- 회원 정보 수정 -->
          <div id="editAccountInfo" hidden>
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
	        <div class="modal-title fs-5" id="exampleModalLabel"><h4>변경 완료</h4></div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" style="display:flex; align-items:center; height:20vh;">
	        <h5><b>비밀번호가 변경되었습니다. 다시 로그인해주세요.</b></h5>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-primary btn-produce-sm kor" data-bs-dismiss="modal" onclick="modalCheck()">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
          
          <!-- 회원 탈퇴 -->
        		<div id="delAccount" hidden>
		            <div class="row conR-container" style="color:#6C757D">
		                <div class="col-md-9 con-item kor Bold"  style="font-size: 20px;"><a>회원 탈퇴</a></div>
		            </div>
		            <hr class="marginTop0" style="margin-bottom: 50px;">
		            <!--<button id="odBtn" onclick="createTemplateBox();">주문자 정보</button>-->
		            <h4 class="kor Bold" style="text-align: center; color: #789DBF">
		                탈퇴하기 버튼을 누르면 30일간 계정이 비활성화 됩니다.
		            </h4><br>
		            <h5 class="kor" style="text-align: center; color: #6C757D; line-height: 2">
		                계정을 다시 활성화하려면 기존 로그인 이메일과 비밀번호로 로그인하세요.<br>
		                예전처럼 Bonheur 사이트를 다시 이용하실 수 있습니다.<br>
		                언제든 Bonheur에서 다시 만나뵙기를 기다리겠습니다.<br><br>
		            </h5>
		            <div style="display: flex; align-items: center; justify-content: center;">
		                <input type="text" class="input-box input-box-md margin10 withdraw">
		                <button type="button" style="width: 150px;" class="col-md-3 btn btn-primary btn-produce-sm kor" onClick="withdraw()">탈퇴하기</button><br>
		            </div><br>
		            <div name="withdrawWarning" class="warning" style="line-height: 0; color: red"  hidden><i class="bi bi-exclamation-diamond"></i>전화번호를 다시 확인해주세요.</div>
		            <br>
		            <h5 class="kor" style="text-align: center; color: #789DBF;">
		                (30일동안 재접속이 이루어지지 않으면 계정이 완전히 삭제되어 로그인이 불가능해집니다.)
		            </h5>
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

function withdraw(){
	let formData = new FormData();
	formData.append("memberPhone",document.getElementsByClassName('withdraw')[0].innerText);
	serverCallByFetchAjax(formData, '/checkMemberCode', 'post', 'withdrawCallBack');
}

function withdrawCallBack(serverData){
	if(serverData.message==true){
		let clientData = [["memberPhone",document.getElementsByClassName('withdraw')[0].innerText]];
		serverCallByRequest("/withdraw","post",clientData);
	}else{
		document.getElementsByName('withdrawWarning')[0].hidden=false;
		document.getElementsByName('withdrawWarning')[0].style.textAlign='center';
	}
}

function getWIshInfo(){
	let formData = new FormData();
	serverCallByFetchAjax(formData, '/getWishInfoByMyPage', 'post', 'viewWishInfo');	
}

function viewWishInfo(serverData){
	console.log(serverData);
	
	for(let i = 0; i<serverData.wishList.length;i++){
		let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/"+serverData.wishList[i].templateCode.toLowerCase()+".png";
		createWishData(url, serverData.wishList[i].templateCode, serverData.itemList[i].templateName, i);
	}
	
}

function moveProduceByWish(index){
	let clientData = [];
	clientData.push(["wishList[0].templateCode",document.getElementsByClassName('wishBox')[index].children[1].innerText]);
	serverCallByRequest("/MoveProduceWedding","post",clientData);
}

function deleteByWish(index){
	let formData = new FormData();
	formData.append('wishList[0].templateCode', document.getElementsByClassName('wishBox')[index].children[1].innerText);
	serverCallByFetchAjax(formData, "/Api/DeleteWishList", 'post', "deleteCallBack");
}

function deleteByProduction(index){
	console.log(document.getElementsByClassName('templateBox')[index].children[1].children[2].children[1].children[0].children[0].innerText);
	let formData = new FormData();
	formData.append('itemList[0].itemCode', document.getElementsByClassName('templateBox')[index].children[1].children[2].children[1].children[0].children[0].innerText);
	serverCallByFetchAjax(formData, "/Api/DeleteItem", 'post', "deleteCallBackByProduction");
}

function deleteCallBackByProduction(){
	mypageReturn(0);
}

function deleteCallBack(){
	document.getElementsByClassName('row')[1].innerHTML="";
	getWIshInfo();
	document.getElementById('wish').classList.add("Bold");
	document.getElementById('order').classList.remove('Bold');
	document.getElementById('unregister').classList.remove('Bold');
	document.getElementById('info').classList.remove('Bold');
	document.getElementById('tplStatus').hidden= true;
	document.getElementById('delAccount').hidden= true;
	document.getElementById('editAccountInfo').hidden=true;
	document.getElementById('wishList').hidden = false;
}

function createWishData(url, templateCode, templateName, index){
	
	let row = document.getElementsByClassName('row')[1];
	
	let col = document.createElement('div');
	col.setAttribute("class","wishBox col-5");
	
	let imageBox = document.createElement('div');
	imageBox.setAttribute("class","template-ex-guide");
	
	let image = document.createElement('img');
	image.setAttribute("class","img-box-3");
	image.style.backgroundImage='url("'+url+'")';
	image.style.backgroundSize= "cover";
	
	let p1 = document.createElement('p');
	p1.setAttribute("class","eng");
	p1.style.color="#0069D9";
	p1.style.fontSize="20px";
	p1.style.marginTop="5px";
	p1.innerText=templateCode;
	
	let p2 = document.createElement('p');
	p2.setAttribute("class","eng");
	p2.style.color="#789DBF";
	p2.innerText=templateName;
	
	let div1 = document.createElement('div');
	div1.style.marginTop="5px";
	
	let button1 = document.createElement('button');
	button1.setAttribute("class","btn btn-primary btn-xs kor");
	button1.innerText="제작하기";
	button1.setAttribute("onClick","moveProduceByWish('"+index+"')");
	
	let button2 = document.createElement('button');
	button2.setAttribute("class","btn btn-outline-primary btn-xs kor bt");
	button2.style.marginLeft="5px"
	button2.innerText="삭제";
	button2.setAttribute("onClick","deleteByWish('"+index+"')");
	
	div1.appendChild(button1);
	div1.appendChild(button2);
	imageBox.appendChild(image);
	col.appendChild(imageBox);
	col.appendChild(p1);
	col.appendChild(p2);
	col.appendChild(div1);
	
	row.appendChild(col);
}

function inProduction(serverData) {
    //function createDiv(objId, className, funcName, innerText, width, isInline)
    //function createText(type, contents, isInline)
    //function createInputBox(type, name, value, placeholder, guideNum)
    //function createButton(type, value, guideNum)
    //function createImgBox(alt, src, funcName, guideNum)
    document.getElementById("in").style.fontWeight = "bold";
	document.getElementById("co").style.fontWeight = "400";
    console.log(serverData);
    
    for(let i = 0; i<serverData.itemList.length; i++){
    	if(serverData.itemList[i].itemStatus == 0){
    		let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/"+serverData.itemList[i].templateCode.toLowerCase()+".png";
    		createInproduction(url, serverData.itemList[i].templateCode, serverData.itemList[i].templateName, serverData.itemList[i].itemCode, serverData.itemList[i].builtDate, serverData.itemList[i].expiredDate, i);
    	}
    }
    
}

function createInproduction(url, templateCode, templateName, itemCode, builtDate, expiredDate, index){
	
	let box = createDiv("template","templateBox","","","","");
	box.style.display="flex";
	box.style.alignItems="center"
	
	let subBox1 = createDiv("","","","","","");
	subBox1.style.display="inline-block";
	subBox1.style.width="43%";
	let img = createImgBox("","","",3);
	img.style.backgroundImage='url("'+url+'")';
	img.style.backgroundSize= "cover";
	
	let subBox2 = createDiv("","","","","","");
	subBox2.style.display="inline-block";
	subBox2.style.width="57%";
	subBox2.style.marginLeft="10px";
	
	let titleBox =createText("","","");
	titleBox.style.textAlign="left";
	
	let title = document.createElement("span");
	title.innerHTML=templateName;
	title.setAttribute("class", "eng");
	title.style.color="#0069D9";
	title.style.fontSize="20px";
	title.style.marginRight="15px";
	
	let subTitle = document.createElement("span");
	subTitle.innerHTML=templateCode;
	subTitle.setAttribute("class", "eng");
	subTitle.style.color="#789DBF";
	subTitle.style.fontSize="16px";
	
	titleBox.appendChild(title);
	titleBox.appendChild(subTitle);
	let br = createBr();
	
	let row = createDiv("","row","","","","");
	let col4 = createDiv("","col-md-4 kor","","","");
	let col8 = createDiv("","col-md-8 kor eng","","","");
	
	let subTitleBox = createDiv("","conR-container2","","");
	let subContentsBox = createDiv("","conR-container2","","");
	
	let subButton1 = createButton("삭제", "deleteDiv()", "1");
	subButton1.classList.add("bt");
	subButton1.style.width="150px";
	subButton1.style.marginRight="15px";
	subButton1.setAttribute("onClick","deleteByProduction('"+index+"')");
	
	let subButton2 = createButton("제작하기", "", "2");
	subButton2.style.width="150px";
	
	let sub1 = createText("","주문번호","");
	let sub2 = createText("","상품유형","");
	let sub3 = createText("","주문일시","");
	
	subTitleBox.appendChild(sub1);
	subTitleBox.appendChild(sub2);
	subTitleBox.appendChild(sub3);
	
	subTitleBox.style.fontSize="16px";
	col4.appendChild(subTitleBox);
	col4.style.textAlign="left";
	col4.style.lineHeight="2";
	
	let type = "";
	
	if(itemCode.substring(0,3)=="WED"){
		type="M청첩장";
	}else if(itemCode.substring(0,3)=="THX"){
		type="M감사장";
	}else if(itemCode.substring(0,3)=="BIR"){
		type="M돌잔치"
	}else{
		type = "M초대장";
	}
	
	let sub5 = createText("",itemCode,"");
	let sub6 = createText("",type,"");
	let sub7 = createText("",builtDate,"");
	
	subContentsBox.appendChild(sub5);
	subContentsBox.appendChild(sub6);
	subContentsBox.appendChild(sub7);
	
	subContentsBox.style.fontSize="16px";
	col8.appendChild(subContentsBox);
	
	col8.style.textAlign="left";
	col8.style.lineHeight="2";
	
	row.appendChild(col4);
	row.appendChild(col8);
	row.style.color="#6C757D";
	
	box.appendChild(subBox1);
	box.appendChild(subBox2);
	subBox1.appendChild(img);
	subBox2.appendChild(titleBox);
	subBox2.appendChild(br);
	subBox2.appendChild(row);
	row.appendChild(subButton1);
	row.appendChild(subButton2);
	
	document.body.appendChild(box);
	
	const element = document.getElementsByClassName('row')[0];
	element.appendChild(box);
}

function completeProduction(serverData){
	console.log(serverData);
	document.getElementById("co").style.fontWeight = "bold";
	document.getElementById("in").style.fontWeight = "400";
    
    for(let i = 0; i<serverData.itemList.length; i++){
    	if(serverData.itemList[i].itemStatus == 1){
    		let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/"+serverData.itemList[i].templateCode.toLowerCase()+".png";
    		createCompleteProduction(url, serverData.itemList[i].templateCode, serverData.itemList[i].templateName, serverData.itemList[i].itemCode, serverData.itemList[i].builtDate, serverData.itemList[i].expiredDate, i);
    	}
    }
}
    
function createCompleteProduction(url, templateCode, templateName, itemCode, builtDate, expiredDate, index){
	
	let box = createDiv("template","templateBox","","","","");
	box.style.display="flex";
	box.style.alignItems="center"
	
	let subBox1 = createDiv("","","","","","");
	subBox1.style.display="inline-block";
	subBox1.style.width="43%";
	let img = createImgBox("","","",3);
	img.style.backgroundImage='url("'+url+'")';
	img.style.backgroundSize= "cover";
	
	let subBox2 = createDiv("","","","","","");
	subBox2.style.display="inline-block";
	subBox2.style.width="57%";
	subBox2.style.marginLeft="10px";
	
	let titleBox =createText("","","");
	titleBox.style.textAlign="left";
	
	let title = document.createElement("span");
	title.innerHTML=templateName;
	title.setAttribute("class", "eng");
	title.style.color="#0069D9";
	title.style.fontSize="20px";
	title.style.marginRight="15px";
	
	let subTitle = document.createElement("span");
	subTitle.innerHTML=templateCode;
	subTitle.setAttribute("class", "eng");
	subTitle.style.color="#789DBF";
	subTitle.style.fontSize="16px";
	
	titleBox.appendChild(title);
	titleBox.appendChild(subTitle);
	let br = createBr();
	
	let row = createDiv("","row","","","","");
	let col4 = createDiv("","col-md-4 kor","","","");
	let col8 = createDiv("","col-md-8 kor eng","","","");
	
	let subTitleBox = createDiv("","conR-container2","","");
	let subContentsBox = createDiv("","conR-container2","","");
	
	let subButton = createButton("삭제", "deleteDiv()", "1");
	subButton.classList.add("bt");
	subButton.style.width="300px";
	subButton.setAttribute("onClick","deleteByProduction('"+index+"')");
	
	let sub1 = createText("","주문번호","");
	let sub2 = createText("","상품유형","");
	let sub3 = createText("","주문일시","");
	let sub4 = createText("","사용기한","");
	subTitleBox.appendChild(sub1);
	subTitleBox.appendChild(sub2);
	subTitleBox.appendChild(sub3);
	subTitleBox.appendChild(sub4);
	subTitleBox.style.fontSize="16px";
	col4.appendChild(subTitleBox);
	col4.style.textAlign="left";
	col4.style.lineHeight="2";
	
	let type = "";
	
	if(itemCode.substring(0,3)=="WED"){
		type="M청첩장";
	}else if(itemCode.substring(0,3)=="THX"){
		type="M감사장";
	}else if(itemCode.substring(0,3)=="BIR"){
		type="M돌잔치"
	}else{
		type = "M초대장";
	}
	
	let sub5 = createText("",itemCode,"");
	let sub6 = createText("",type,"");
	let sub7 = createText("",builtDate,"");
	let sub8 = createText("",expiredDate,"");
	subContentsBox.appendChild(sub5);
	subContentsBox.appendChild(sub6);
	subContentsBox.appendChild(sub7);
	subContentsBox.appendChild(sub8);
	subContentsBox.style.fontSize="16px";
	col8.appendChild(subContentsBox);
	
	col8.style.textAlign="left";
	col8.style.lineHeight="2";
	
	row.appendChild(col4);
	row.appendChild(col8);
	row.style.color="#6C757D";
	
	box.appendChild(subBox1);
	box.appendChild(subBox2);
	subBox1.appendChild(img);
	subBox2.appendChild(titleBox);
	subBox2.appendChild(br);
	subBox2.appendChild(row);
	row.appendChild(subButton);
	
	document.body.appendChild(box);
	
	const element = document.getElementsByClassName('row')[0];
	element.appendChild(box);
}

function mypageReturn(pageNum) {
	let formData = new FormData();
	if (pageNum == 0) { //제작중
		document.getElementsByClassName('row')[0].innerHTML="";
		serverCallByFetchAjax(formData, "/InProduction", "post", "inProduction");
	}else if (pageNum == 1) { //제작완료
		document.getElementsByClassName('row')[0].innerHTML="";
		serverCallByFetchAjax(formData, "/InProduction", "post", "completeProduction");
	}else if (pageNum == 2) { //주문내역
		document.getElementById('order').classList.add("Bold");
		document.getElementById('wish').classList.remove('Bold');
		document.getElementById('unregister').classList.remove('Bold');
		document.getElementById('info').classList.remove('Bold');
		document.getElementById('editAccountInfo').hidden=true;
		document.getElementById('wishList').hidden = true;
		document.getElementById('delAccount').hidden= true;
		document.getElementById('tplStatus').hidden= false;
		serverCallByRequest("/View/MyPage", "post", "");
	}else if (pageNum == 3) { //위시
		document.getElementsByClassName('row')[0].innerHTML="";
		document.getElementsByClassName('row')[1].innerHTML="";
		getWIshInfo();
		document.getElementById('wish').classList.add("Bold");
		document.getElementById('order').classList.remove('Bold');
		document.getElementById('unregister').classList.remove('Bold');
		document.getElementById('info').classList.remove('Bold');
		document.getElementById('tplStatus').hidden= true;
		document.getElementById('delAccount').hidden= true;
		document.getElementById('editAccountInfo').hidden=true;
		document.getElementById('wishList').hidden = false;
		//serverCallByFetchAjax(formData, 'getTemplateList', 'post', 'viewTemplateList');	
	}else if (pageNum == 4) { //정보수정
		//serverCallByRequest("/View/MyInfoEdit", "post", "");
		document.getElementById('order').classList.remove("Bold");
		document.getElementById('wish').classList.remove('Bold');
		document.getElementById('unregister').classList.remove('Bold');
		document.getElementById('info').classList.add('Bold');
		document.getElementById('editAccountInfo').hidden=false;
		document.getElementById('tplStatus').hidden= true;
		document.getElementById('delAccount').hidden= true;
		document.getElementById('wishList').hidden = true;
	}else if (pageNum == 5) { //탈퇴
		document.getElementById('unregister').classList.add("Bold");
		document.getElementById('order').classList.remove('Bold');
		document.getElementById('wish').classList.remove('Bold');
		document.getElementById('info').classList.remove('Bold');
		document.getElementById('tplStatus').hidden= true;
		document.getElementById('wishList').hidden = true;
		document.getElementById('editAccountInfo').hidden=true;
		document.getElementById('delAccount').hidden= false;
	}
}

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