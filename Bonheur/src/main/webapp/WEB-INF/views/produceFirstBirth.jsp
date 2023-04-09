<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">  
    <head>
        <meta charset="UTF-8">
        <title>produce</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../../resources/css/styleGuide.css" />
        <link rel="stylesheet" type="text/css" href="../../resources/css/layout.css" />
        <link rel="stylesheet" type="text/css" href="../../resources/css/createDiv.css" />
        <script type="text/javascript" src="../../resources/js/common.js"></script>
        <script type="text/javascript" src="../../resources/js/dynamicDiv.js"></script>
        <script type="text/javascript" src="resources/js/pageController.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
    	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37df7ab613b03d28b159b77089a64a01&libraries=services"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- DatePicker JS/CSS { -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
		<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../../resources/css/datePicker.css" />
		<!-- } -->
		<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    </head>
<style>
.modal-dialog{
	text-align: center; 
	max-width: 600px; 
	margin:auto; 
	position:absolute;
	top:50%;left:50%;
}
.modal-content{
	transform: translate(-50%,-50%);
}
</style>
<body onload="javascript: infomation();">
  <div id="guideLine">
    <div id="nav" style="z-index: 2">
        <div>
            <ul class="nav-container">
                <li><div class="logo" style="line-height: 10vh;"><a class="logo" href="/">Bonheur</a></div></li>
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
    <div id="contents-left">
        <img id="progressbar" style="width: 300px;" src="../../resources/images/stepBar1.png">
        <div id="placeP"><div class="phone"><div class="M-line"></div></div></div>
    </div>
    <div id="contents-right">
    <!-- step1 -->
<div id="step1">
    <!-- 주문자 정보 -->
    <div id="ordererInfo">
    	<div class="innerContents">
    		<p id="title" class="kor Bold">주문자 정보</p>
    		<hr>
    		<div class="row">
    			<div class="col-md-2" style="line-height: 3">
		    		<p id="sub-title" class="kor Bold">주문자명</p>
		    		<p id="sub-title" class="kor Bold">휴대폰 번호</p>
		    		<p id="sub-title" class="kor Bold">이메일 주소</p>
    			</div>
    			<div class="col-md-10" style="line-height: 3;">
		    		<p id="sub-title" class="kor Regular">${memberInfo.memberName}</p>
		    		<div style="display: flex; text-align:center;">
			    		<p id="sub-title" class="kor Regular">${fn:substring(memberInfo.memberPhone, 0, 3)}</p>
			    		<span id="sub-title" style="margin: 0 5px;" class="kor Bold">-</span>
			    		<p id="sub-title" class="kor Regular">${fn:substring(memberInfo.memberPhone, 3, 7)}</p>
			    		<span id="sub-title" style="margin: 0 5px;" class="kor Bold">-</span>
			    		<p id="sub-title" class="kor Regular">${fn:substring(memberInfo.memberPhone, 7, 11)}</p>
		    		</div>
		    		<p id="sub-title" class="kor Regular">${memberInfo.memberEmail}</p>
    			</div>
    		</div>
    	</div>
    </div>
<!-- step3 -->
<div id="step3" hidden>
	<div class="innerContents">
		<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">제작 완료</p>
		<hr>
		<div class="row">
			<div class="col-md-2" style="line-height: 3">
				<p id="sub-title" class="kor Bold">주문 번호</p>
				<p id="sub-title" class="kor Bold">주문 일시</p>
				<p id="sub-title" class="kor Bold">주문 상품</p>
			</div>
			<div class="col-md-10" style="line-height: 3">
				<p id="sub-title" class="kor Regular">orderCode</p>
				<p id="sub-title" class="kor Regular">orderDate</p>
				<p id="sub-title" class="kor Regular">templateCode / templateName</p>
			</div>
		</div>
	</div>
</div>
		<input type="hidden" name="mainImage">
		<input type="hidden" name="thumbNailImage">
        <div class="innerContents button-control" style="display:flex; justify-content: center;">
            <button id="step1NextBtn" class="btn btn-primary btn-next kor bot" onclick="produceStep(2)">다음 단계로 가기</button>
            <button class="btn btn-outline-primary btn-move kor" style="margin-right: 10px;" onclick="produceStep(1)" hidden>이전 단계로 이동</button>
            <button class="btn btn-primary btn-move kor" onclick="produceStep(3)" hidden>다음 단계로 이동</button>
            <button class="btn btn-outline-primary btn-move kor" style="margin-right: 10px;" onclick="produceStep(2)" hidden>이전 단계로 이동</button>
            <button type="button" class="btn btn-primary btn-move kor" onclick="" hidden>제작완료</button>
        </div>
    </div><!-- contents-right/end tag -->
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
 </div>
</div>
</body>
</html>