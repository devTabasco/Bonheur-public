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
        <script type="text/javascript" src="../../resources/js/etcDynamicDiv.js"></script>
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
.list-phone{
        border:none;
    	width: 280px;
        height: 512px;
        margin: 0 auto;
        padding: 0;
        position:relative;
    }
    .previewFrame{
      	position: absolute;
	    width: 100%;
	    height: 100%;
	    border-radius: 50px;
    	border: solid 10px #292929;
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
        <div id="placeP">
	        <div class="phone list-phone"><div class="M-line" style="z-index:1"></div>
            	<iframe scrolling="yes" id="previewFrame" class="previewFrame"></iframe>
            </div>
        </div>
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
    <!-- 예식장 정보 -->
    <div id="weddinghallInfo">
    	<div class="innerContents">
    		<p id="title" class="kor Bold">장소 정보</p>
    		<hr>
    		  <div class="row">
    			<div class="col-md-2" style="line-height: 3; padding-right:0">
		    		<p id="sub-title" class="kor Bold">일시</p>
		    		<p id="sub-title" class="kor Bold">장소명</p>
		    		<p id="sub-title" class="kor Bold">층/홀/실</p>
		    		<p id="sub-title" class="kor Bold">장소 연락처</p>
		    		<p id="sub-title" class="kor Bold">주소</p>
		    		<div style="display: flex; align-items: center; height: 400px;">
			    		<p id="sub-title" class="kor Bold">약도</p>
		    		</div>
    			</div>
    			<div class="col-md-10" style="line-height: 3; padding-left: 24">
    				<div style="display: flex; align-items: center; height: 60px;">
	        			<input type='text' id='currentDate' name="" value="" class="datepicker inp inp-icon input-box input-box-md kor" style="margin-right: 15px" readonly="true" />
						<form>
							<input type='time' id='currentTime' class="inp input-box input-box-md kor" />
						</form>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px"><input onblur="updateInvitationTitle()" name="locationName" class="input-box input-box-lg"></div>
    				<div style="display: flex; align-items: center; height: 60px"><input onblur="updateInvitationTitle()" name="locationDetail" class="input-box input-box-lg"></div>
    				<div style="display: flex; align-items: center; height: 60px"><input onblur="updateInvitationTitle()" name="locationCall" class="input-box input-box-lg"></div>
		    		<!-- 카카오ㄴ -->
					 <div style="display: flex; align-items: center; height: 60px;">
						<input onblur="updateInvitationTitle()" name="locationAddress" type="text" id="keyword" class="search-input input-box input-box-lg" onclick="postCode();" style="margin-right:10px;">
						<button type="button" class="btn btn-primary serch-btn kor" onclick="postCode();">검색하기</button>
					 </div>
					 <div style="display: flex; align-items: center; height: 400px;">
						 <div id="map" style="width:600px;height:400px;position:relative;overflow:hidden;"></div>
					 </div>
		    		<!--  -->
    			</div>
    		</div>
    	</div>
    </div>
    <!-- 기타 정보 -->
    <div id="etcInfo">
    	<div class="innerContents">
    	  <div class="row">
	    	  <div class="col-md-8" style="display: flex; align-items: center;">
	    	  	<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">기타 정보</p>
	    	  </div>
			  <div class="col-md-4" style="display: flex; align-items: center;">
				 <div style="display: inline-block; margin: 0px 0px 0px auto;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="etcUseable" id="etcUseable1" onchange="useable()" checked>
					  <label class="form-check-label" for="etcUseable1">사용함</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="etcUseable" id="etcUseable2" onchange="useable()">
					  <label class="form-check-label" for="etcUseable2">사용안함</label>
					</div>
				 </div>
			  </div>
			</div>
    		<hr>
    		<div class="row" id="etcContents">
    			<div class="col-md-2" style="line-height: 3">
    				<p id="sub-title" class="kor Bold">버스 안내</p>
    				<p id="sub-title" class="kor Bold">자가용 안내</p>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle1" hidden><input name="addOption3" class="input-box input-box-st" placeholder=" 직접입력"></div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle2" hidden><input name="addOption4" class="input-box input-box-st" placeholder=" 직접입력"></div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle3" hidden><input name="addOption5" class="input-box input-box-st" placeholder=" 직접입력"></div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle4" hidden><input name="addOption6" class="input-box input-box-st" placeholder=" 직접입력"></div>
    			</div>
    			<div class="col-md-10">
    				<div style="display: flex; align-items: center; height: 60px"><textarea name="busInfo" class="input-box input-box-lg"></textarea></div>
    				<div style="display: flex; align-items: center; height: 60px"><textarea name="ownCarInfo" class="input-box input-box-lg"></textarea></div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents1" hidden>
    					<textarea name="option3" class="input-box input-box-lg"></textarea>
    					<button class="btn btn-primary btn-produce-sm kor" id="delBtn1" style="width:75px; margin-left:15px" onclick="etcDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents2" hidden>
    					<textarea name="option4" class="input-box input-box-lg"></textarea>
    					<button class="btn btn-primary btn-produce-sm kor" id="delBtn2" style="width:75px; margin-left:15px" onclick="etcDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents3" hidden>
    					<textarea name="option5" class="input-box input-box-lg"></textarea>
    					<button class="btn btn-primary btn-produce-sm kor" id="delBtn3" style="width:75px; margin-left:15px" onclick="etcDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents4" hidden>
    					<textarea name="option6" class="input-box input-box-lg"></textarea>
    					<button class="btn btn-primary btn-produce-sm kor" id="delBtn4" style="width:75px; margin-left:15px" onclick="etcDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; justify-content: flex-end;">
    					<button class="btn btn-outline-primary btn-produce-sm kor" id="etcAddBtn" style="width:140px" onclick="etcAddOption()"> + 항목 추가</button>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <!-- 축의금(카카오페이) -->
    <div id="kakaoPayInfo">
    	<div class="innerContents">
    	  <div class="row">
	    	  <div class="col-md-8" style="display: flex; align-items: center;">
	    	  	<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">축의금 (카카오페이)</p>
	    	  </div>
			  <div class="col-md-4" style="display: flex; align-items: center;">
				 <div style="display: inline-block; margin: 0px 0px 0px auto;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="kakaoPayUseable" id="kakaoPayUseable1" onchange="useable()" checked>
					  <label class="form-check-label" for="kakaoPayUseable1">사용함</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="kakaoPayUseable" id="kakaoPayUseable2" onchange="useable()">
					  <label class="form-check-label" for="kakaoPayUseable2">사용안함</label>
					</div>
				 </div>
			  </div>
			</div>
    		<hr>
    		<div id="kakaoPay" style="line-height:3">
    		    <div class="kakaoPay-image-box">
					<img id="kakaoPay-img-preview">
				</div>
				<input type="file" onchange="previewImage(event)">
    			<p class="kor Regular" style="font-size:18px; color:#6C757D">계좌번호 안내 없이도 카카오페이를 통해 축의금을 받을 수 있는 부가서비스 입니다.</p>
    			<p class="kor Regular" style="color:#6C757D">※ 축의금 내역은 마이페이지에서 엑셀다운로드 하셔서, 편리하게 관리할 수 있습니다.</p>
    		</div>
    	</div>
    </div>
    <!-- 계좌 정보 -->
    <div id="accountInfo">
    	<div class="innerContents">
    	  <div class="row">
	    	  <div class="col-md-8" style="display: flex; align-items: center;">
	    	  	<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">계좌 정보</p>
	    	  </div>
			  <div class="col-md-4" style="display: flex; align-items: center;">
				 <div style="display: inline-block; margin: 0px 0px 0px auto;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="accountUseable" id="accountUseable1" onchange="useable()" checked>
					  <label class="form-check-label" for="accountUseable1">사용함</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="accountUseable" id="accountUseable2" onchange="useable()">
					  <label class="form-check-label" for="accountUseable2">사용안함</label>
					</div> 
				 </div>
			  </div>
			</div>
    		<hr>
    		<div class="row" id="accountContents">
    			<div class="col-md-3" style="line-height: 3; padding-right:0">
    				<div style="display: flex; align-items: center; height: 60px">
					    <select name="actSelect1" class="actSelect1 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput1" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px">
					    <select name="actSelect2" class="actSelect2 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput2" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle5" hidden>
					    <select name="actSelect3" class="actSelect3 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput3" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle6" hidden>
					    <select name="actSelect4" class="actSelect4 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput4" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle7" hidden>
					    <select name="actSelect5" class="actSelect5 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput5" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optTitle8" hidden>
					    <select name="actSelect6" class="actSelect6 form-select" aria-label="Default select example" style="width: 150px">
					        <option selected>입금대상선택</option>
					        <option value="주최">주최</option>
					        <option value="주최자">주최자</option>
					        <option name="actDirectInput6" onclick="accountType()">직접입력</option>
					    </select>
    				</div>
    			</div>
    			<div class="col-md-9" style="padding-left:0">
    				<div style="display: flex; align-items: center; height: 60px">
						<input id="accountType1" name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank1" class="bank1 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber1" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName1" class="input-box input-box-sm" style="width:100px; margin-right:10px" placeholder="예금주 입력" >
    				</div>
    				<div style="display: flex; align-items: center; height: 60px">
						<input id="accountType2" name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank2" class="bank2 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber2" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName2" class="input-box input-box-sm" style="width:100px" placeholder="예금주 입력" >
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents5" hidden>
						<input id="accountType3" name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank3" class="bank3 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber3" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName3" class="input-box input-box-sm" style="width:100px" placeholder="예금주 입력" >
						<button class="btn btn-primary btn-produce-sm kor" id="delBtn1" style="width:75px; margin-left:15px" onclick="accountDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents6" hidden>
						<input id="accountType4" name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank4" class="bank4 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber4" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName4" class="input-box input-box-sm" style="width:100px" placeholder="예금주 입력" >
						<button class="btn btn-primary btn-produce-sm kor" id="delBtn1" style="width:75px; margin-left:15px" onclick="accountDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents7" hidden>
						<input id="accountType5" name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank5" class="bank5 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber5" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName5" class="input-box input-box-sm" style="width:100px" placeholder="예금주 입력" >
						<button class="btn btn-primary btn-produce-sm kor" id="delBtn1" style="width:75px; margin-left:15px" onclick="accountDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; align-items: center; height: 60px" id="optContents8" hidden>
						<input id="accountType6"  name="" class="input-box input-box-st" style="width:70px; margin-right:15px" placeholder="관계" hidden>
						<select name="bank6" class="bank6 form-select" aria-label="Default select example" style="margin-right:10px">
					        <option selected>은행선택</option>
	                        <option value="35">경남은행</option>
	                        <option value="29">광주은행</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="17">농협회원조합</option>
	                        <option value="25">대구은행</option>
	                        <option value="47">도이치은행</option>
	                        <option value="27">부산은행</option>
	                        <option value="3">산업은행</option>
	                        <option value="41">상호저축은행</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="36">신한금융투자</option>
	                        <option value="60">신한은행</option>
	                        <option value="39">신협중앙회</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="33">전북은행</option>
	                        <option value="31">제주은행</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
					    </select>
    					<input name="actNumber6" class="input-box input-box-md" style="width:260px; margin-right:10px" placeholder="계좌번호 입력 (-없이 숫자만 입력)">
						<input name="actName6" class="input-box input-box-sm" style="width:100px" placeholder="예금주 입력" >
						<button class="btn btn-primary btn-produce-sm kor" id="delBtn1" style="width:75px; margin-left:15px" onclick="accountDelOption()">삭제</button>
    				</div>
    				<div style="display: flex; justify-content: flex-end;">
    					<button class="btn btn-outline-primary btn-produce-sm kor" id="accountAddBtn" style="width:140px" onclick="accountAddOption()"> + 항목 추가</button>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<!-- step2 -->
<div id="step2" hidden>
	<div class="innerContents">
    	  <div class="row">
	    	  <div class="col-md-8" style="display: flex; align-items: center;">
	    	  	<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">초대영상</p>
	    	  </div>
			  <div class="col-md-4" style="display: flex; align-items: center;">
				 <div style="display: inline-block; margin: 0px 0px 0px auto;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="videoUseable" id="videoUseable1" onchange="useable2()" checked>
					  <label class="form-check-label" for="videoUseable1">사용함</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="videoUseable" id="videoUseable2" onchange="useable2()">
					  <label class="form-check-label" for="videoUseable2">사용안함</label>
					</div>
				 </div>
			  </div>
			</div>
    		<hr>
    		<div id="videoContents">
    			<div style="display: inline-block; margin-bottom: 16px;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="videoType" id="YouTube" checked>
					  <label class="form-check-label" for="YouTube">YouTube</label>
					  <i class="bi bi-exclamation-diamond margin50" style="color:#58AAFF; cursor: pointer" onclick="modalOpen(0)"></i>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="videoType" id="Vimeo">
					  <label class="form-check-label" for="Vimeo">Vimeo</label>
					  <i class="bi bi-exclamation-diamond margin50" style="color:#58AAFF; cursor: pointer" onclick="modalOpen(1)"></i>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="videoType" id="FeelMaker">
					  <label class="form-check-label" for="FeelMaker">FeelMaker</label>
					  <i class="bi bi-exclamation-diamond margin50" style="color:#58AAFF; cursor: pointer" onclick="modalOpen(2)"></i>
					</div>
				 </div>
				 <div class="row">
				 	<div class="col-md-2" style="line-height: 3">
				 		<p id="sub-title" class="kor Bold">URL 입력</p>
				 	</div>
				 	<div class="col-md-10">
					 	<div style="display: flex; align-items: center; height: 60px" id="">
	    					<input name="videoURL" class="input-box input-box-lg">
	    					<button class="btn btn-primary btn-produce-sm kor" id="" style="width:100px; margin-left:15px" onclick="">적용하기</button>
	    				</div>
				 	</div>
				 </div>
				<!-- YouTobe Modal -->
				<div class="modal fade" id="youtubeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content kor eng">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">YouTube</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" style="font-size:18px">
				      	<img src="../../resources/images/video_youtube.png" style="margin-bottom:25px">
				        <p>1. 첨부하고자 하는 YouTube 영상을 실행합니다.<br>
				        2. 메뉴에서 '공유' 버튼을 클릭합니다.<br>
				        3. URL을 복사하여 모바일 청첩장에 붙여넣기(Ctrl + V) 합니다</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-primary btn-produce-sm kor" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Vimeo Modal -->
				<div class="modal fade" id="vimeoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" style="text-align: center; max-width: 600px">
				    <div class="modal-content kor eng"">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Vimeo</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" style="font-size:18px">
				      	<img src="../../resources/images/video_vimeo.png" style="margin-bottom:25px">
				        <p>
				           1. 첨부하고자 하는 Vimeo 영상을 실행합니다.<br>
						   2. 메뉴에서 '공유하기' 버튼을 클릭합니다.<br>
						   3. 임베드 코드를 복사하여 모바일 청첩장에 붙여넣기(Ctrl + V) 합니다.<br>
							<b>※ 영상의 제목이 노출되지 않으려면 iframe까지만 복사합니다.</b>
						</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-primary btn-produce-sm kor" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- FeelMaker Modal -->
				<div class="modal fade" id="feelmakerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" style="text-align: center; max-width: 600px">
				    <div class="modal-content kor eng">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">FeelMaker</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" style="font-size:18px">
				      	<img src="../../resources/images/video_feelmaker.png" style="margin-bottom:25px">
				        <p>1. 첨부하고자 하는 FEELMAKER 영상의 URL을 복사합니다.<br>
						2. 복사하여 모바일 청첩장에 붙여넣기(Ctrl + V) 합니다.
						</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-primary btn-produce-sm kor" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div><!-- Video Contents/ end tag -->
	 </div><!-- Inner Contents/ end tag -->
	 <div class="innerContents">
			<div class="row">
	    	  <div class="col-md-8" style="display: flex; align-items: center;">
	    	  	<p id="title" class="kor Bold" style="display: inline-block; margin-bottom: 0px;">이미지 관리</p>
	    	  </div>
			  <div class="col-md-4" style="display: flex; align-items: center;">
				 <div style="display: inline-block; margin: 0px 0px 0px auto;">
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="imageUseable" id="imageUseable1" onchange="useable2()" checked>
					  <label class="form-check-label" for="imageUseable1">사용함</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input margin10" type="radio" name="imageUseable" id="imageUseable2" onchange="useable2()">
					  <label class="form-check-label" for="imageUseable2">사용안함</label>
					</div>
				 </div>
			  </div>
			</div>
    		<hr>
    		<div id="imageContents"  class="m-4">
			    <div class="dropzone"></div>
			    <!-- 포스팅 - 이미지/동영상 dropzone 영역 -->
			    <ul class="list-unstyled mb-0" id="dropzone-preview">
			      <li class="mt-2" id="dropzone-preview-list">
			        <!-- This is used as the file preview template -->
			        <div class="border rounded-3">
			          <div class="d-flex align-items-center p-2">
			            <div class="flex-shrink-0 me-3">
			              <div class="width-8 h-auto rounded-3">
			                <img data-dz-thumbnail="data-dz-thumbnail" class="galleryImage w-full h-auto rounded-3 block" src="#" alt="Dropzone-Image" style="width: 120px;"/>
			              </div>
			            </div>
			            <div class="flex-grow-1">
			              <div class="pt-1">
			                <h6 class="font-semibold mb-1" data-dz-name="data-dz-name">&nbsp;</h6>
			                <p class="text-sm text-muted fw-normal" data-dz-size="data-dz-size"></p>
			                <strong class="error text-danger" data-dz-errormessage="data-dz-errormessage"></strong>
			              </div>
			            </div>
			            <div class="shrink-0 ms-3">
			              <button data-dz-remove="data-dz-remove" class="btn btn-sm btn-danger">Delete</button>
			            </div>
			          </div>
			        </div>
			      </li>
			    </ul>
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
</div><!-- step3 End -->
		<input type="hidden" name="mainImage">
		<input type="hidden" name="thumbNailImage">
        <div class="innerContents button-control" style="display:flex; justify-content: center;">
            <button id="step1NextBtn" class="btn btn-primary btn-next kor bot" onclick="produceStep(2)">다음 단계로 가기</button>
            <button class="btn btn-outline-primary btn-move kor" style="margin-right: 10px;" onclick="produceStep(1)" hidden>이전 단계로 이동</button>
            <button class="btn btn-primary btn-move kor" onclick="produceStep(3)" hidden>다음 단계로 이동</button>
            <button class="btn btn-outline-primary btn-move kor" style="margin-right: 10px;" onclick="produceStep(2)" hidden>이전 단계로 이동</button>
            <button type="button" class="btn btn-primary btn-move kor complateBtn" onclick="" hidden>제작완료</button>
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
 <input type="hidden" name="itemCode">
</body>
<script>
/* 동적으로 값 변경 */
function previewImage(event) {
			var input = event.target;
			var reader = new FileReader();
			reader.onload = function(){
				var dataURL = reader.result;
				var imagePreview = document.getElementById("kakaoPay-img-preview");
				imagePreview.src = dataURL;
				input.src = dataURL;
			};
			reader.readAsDataURL(input.files[0]);
		}

function updateInvitationTitle() {
	let url = document.getElementsByName('invitationURL')[0].value;
	let title = document.getElementsByName('invitationTitle')[0].value;
	let greetTextarea = document.getElementsByName('greetingMessage')[0].value;
	let guestbookUseable = document.getElementsByName('guestbookUseable')[0].checked;
	let hostType = document.getElementsByClassName('hostType')[0].value;
	let hostName = document.getElementsByName('hostName')[0].value;
	let hostPhoneNumber = document.getElementsByName('hostPhoneNumber')[0].value;
	let locationName = document.getElementsByName('locationName')[0].value;
	let locationDetail = document.getElementsByName('locationDetail')[0].value;
	let locationCall = document.getElementsByName('locationCall')[0].value;
	let locationAddress = document.getElementsByName('locationAddress')[0].value;
	const iframeDOM = document.querySelector('iframe');
	
    // iframe 내부의 요소에 input 값 반영
    
    //신랑&신부 이름
    iframeDOM.contentWindow.document.querySelector('.host-name > h1').innerText = hostType +" "+ hostName;
    //제목
    iframeDOM.contentWindow.document.querySelector('.title > h1').innerText = title;
    //인사말
    iframeDOM.contentWindow.document.querySelector('.greetMsg').innerText = greetTextarea;
    //방명록
    if(!guestbookUseable){
	    iframeDOM.contentWindow.document.querySelector('.guest-book').setAttribute('hidden','');
    }else{
	    iframeDOM.contentWindow.document.querySelector('.guest-book').hidden = false;
    }
    //신랑 전화번호
    iframeDOM.contentWindow.document.querySelector('.contact > div:nth-child(1) > a:nth-of-type(1)').href = "tel:"+groomPhoneNumber;
    iframeDOM.contentWindow.document.querySelector('.contact > div:nth-child(1) > a:nth-of-type(2)').href = "sms:"+groomPhoneNumber;
    //신부 전화번호
    iframeDOM.contentWindow.document.querySelector('.contact > div:nth-child(2) > a:nth-of-type(1)').href = "tel:"+bridePhoneNumber;
    iframeDOM.contentWindow.document.querySelector('.contact > div:nth-child(2) > a:nth-of-type(2)').href = "sms:"+bridePhoneNumber;
    //예식장 정보
    //예식장명
    iframeDOM.contentWindow.document.querySelector('.location-info-flex > div:nth-child(1) > h2').innerText = weddingHallName;
    //주소 + 층홀실
    iframeDOM.contentWindow.document.querySelector('.location-info-flex > div:nth-child(1) > p:nth-of-type(1)').innerText = weddingHallAddress + " " + weddingHallDetail;
    //전화번호
    iframeDOM.contentWindow.document.querySelector('.location-info-flex > div:nth-child(1) > p:nth-of-type(2)').innerText = weddingHallCall;
    //전화번호(아이콘)
    iframeDOM.contentWindow.document.querySelector('.location-info-flex > div:nth-child(2) > a:nth-of-type(1)').href = "tel:"+weddingHallCall;
    
    //혼주1 이름, 전화번호
    
    //혼주2 이름, 전화번호
}

function infomation(){
	hostInfo();
	basicInfo();
	getIframeLink();
}

function getIframeLink(){
	let itemInfo = JSON.parse('${itemInfo}');
	console.log(itemInfo);
	document.getElementsByTagName('iframe')[0].src = "/template/"+itemInfo.itemList[0].templateCode.toLowerCase();
}

function produceStep(step){
    let buttonArea = document.getElementsByClassName("button-control")[0];
	
    if(step==1){
        document.getElementById("progressbar").src="../../resources/images/stepBar1.png"
        buttonArea.children[buttonArea.children.length-1].hidden = true;
        buttonArea.children[buttonArea.children.length-2].hidden = true;
        buttonArea.children[buttonArea.children.length-3].hidden = true;
        buttonArea.children[buttonArea.children.length-4].hidden = true;
        buttonArea.children[buttonArea.children.length-5].hidden = false;
        document.getElementById('step1').hidden= false;
        document.getElementById('step2').hidden= true;
    }else if(step==2){
        console.log('move to step2');
        document.getElementById("progressbar").src="../../resources/images/stepBar2.png"
        buttonArea.children[buttonArea.children.length-1].hidden = true;
        buttonArea.children[buttonArea.children.length-2].hidden = true;
        buttonArea.children[buttonArea.children.length-3].hidden = false;
        buttonArea.children[buttonArea.children.length-4].hidden = false;
        buttonArea.children[buttonArea.children.length-5].hidden = true;
        document.getElementById('step1').hidden= true;
        document.getElementById('step2').hidden= false;
        document.getElementById('step3').hidden= true;
      //유효성검사!
        if(inputNullCheck()){
        	itemInfoData();
        }
    }else if(step==3){
        document.getElementById("progressbar").src="../../resources/images/stepBar3.png"
        buttonArea.children[buttonArea.children.length-1].hidden = false;
        buttonArea.children[buttonArea.children.length-2].hidden = false;
        buttonArea.children[buttonArea.children.length-3].hidden = true;
        buttonArea.children[buttonArea.children.length-4].hidden = true;
        buttonArea.children[buttonArea.children.length-5].hidden = true;
        document.getElementById('step2').hidden= true;
        document.getElementById('step3').hidden= false;
        videoOptionSubUpdate();
        galleryImageData();
    }
}

/* 유효성 검사 */
function inputNullCheck(){
  let result = false;
  let url = document.getElementsByName('invitationURL')[0].value;
  let title = document.getElementsByName('invitationTitle')[0].value;
  let greetTextarea = document.getElementsByName('greetingMessage')[0].value;
  let locationName = document.getElementsByName('locationName')[0].value;
  let locationDetail = document.getElementsByName('locationDetail')[0].value;
  let locationCall = document.getElementsByName('locationCall')[0].value;
  let locationAddress = document.getElementsByName('locationAddress')[0].value;
  let thumbNailImage = document.getElementsByName('thumbNailImage')[1].value;
  let mainImage = document.getElementsByName('mainImage')[1].value;
  if(url !== "" && title !== "" && greetTextarea !== "" 
      && locationName !== "" && locationDetail !== "" && locationCall !== "" 
      && locationAddress !== "" && thumbNailImage !== "" && mainImage !== ""){
    result = true;
    console.log('기타초대장 유효성검사true');
  }
  console.log(result);
  return result;
}

/* ITEM TAB Insert */
function itemInfoData(){
	console.log('itemInfoData 진입');
  let url = document.getElementsByName('invitationURL')[0].value;
  let title = document.getElementsByName('invitationTitle')[0].value;
  let greet = document.getElementsByName('greetingMessage')[0].value;
//  let templateCode = '${templateCode}';
  let templateCode = document.getElementsByTagName('iframe')[0].src.slice(-8).toUpperCase();
  let itemStatus = '0';
  let thumbNailImage = document.getElementsByName('thumbNailImage')[1].value;
  let mainImage = document.getElementsByName('mainImage')[1].value;
  
  let formData = new FormData();
  formData.append('itemList[0].invitationURL', url);
  formData.append('itemList[0].invitationTitle', title);
  formData.append('itemList[0].greetingMessage', greet);
  formData.append('itemList[0].templateCode', templateCode);
  formData.append('itemList[0].itemStatus', itemStatus);
  formData.append('itemList[0].thumbNailImage', thumbNailImage);
  formData.append('itemList[0].mainImage', mainImage);
  
  serverCallByFetchAjax(formData, "/Api/InsertItemStep1", "post", "resItemInfoData");
}

function resItemInfoData(serverData){
	console.log('itemInfoData CallBack');
	console.log('resItemInfoData ::'+serverData.itemList[0].itemCode);
	document.getElementsByName('itemCode')[0].value = serverData.itemList[0].itemCode;
	optionSubData();
}

/* OPTIONSUB TAB Insert */
function optionSubData() {
	console.log('optionSubData() 진입');
	//방명록
	let guestbookUseable = document.getElementsByName('guestbookUseable')[0];
	let guestbookCheckedId = guestbookUseable.checked ? guestbookUseable.id : null;
	
	//호스트
	let hostUseable = document.getElementsByName('hostUseable')[0];
	let hostCheckedId = hostUseable.checked ? hostUseable.id : null;
	
	let hostType = document.getElementsByClassName('hostType')[0];
	let hostName = document.getElementsByName('hostName')[0];
	let hostCheckInput = document.getElementsByName('hostCheckInput')[0];
	let hostPhoneNumber = document.getElementsByName('hostPhoneNumber')[0];
	let hostCheckBox = document.getElementById('hostCheckBox');
	
	//장소
	let date = document.getElementsByClassName('datepicker')[0];
	let time = document.getElementById('currentTime');
	let locationName = document.getElementsByName('locationName')[0];
	let locationDetail = document.getElementsByName('locationDetail')[0];
	let locationCall = document.getElementsByName('locationCall')[0];
	let locationAddress = document.getElementsByName('locationAddress')[0];
	
	//기타
	let etcUseable = document.getElementsByName('etcUseable')[0];
	let etcCheckedId = etcUseable.checked ? etcUseable.id : null;
	
	let busInfo = document.getElementsByName('busInfo')[0];
	let ownCarInfo = document.getElementsByName('ownCarInfo')[0];
	
	let addOption3 = document.getElementsByName('addOption3')[0];
	let option3 = document.getElementsByName('option3')[0];
	let addOption4 = document.getElementsByName('addOption4')[0];
	let option4 = document.getElementsByName('option4')[0];
	let addOption5 = document.getElementsByName('addOption5')[0];
	let option5 = document.getElementsByName('option5')[0];
	let addOption6 = document.getElementsByName('addOption6')[0];
	let option6 = document.getElementsByName('option6')[0];
	
	//축의금
	let kakaoPayQR = document.getElementById('kakaoPay-img-preview');
	
	//계좌
	let accountUseable = document.getElementsByName('accountUseable')[0];
	let accountCheckedId = accountUseable.checked ? accountUseable.id : null;
	
	let actSelect1 = document.getElementsByClassName('actSelect1')[0];
	let bank1 = document.getElementsByClassName('bank1')[0];
	let actNumber1 = document.getElementsByName('actNumber1')[0];
	let actName1 = document.getElementsByName('actName1')[0];
	let actSelect2 = document.getElementsByClassName('actSelect2')[0];
	let bank2 = document.getElementsByClassName('bank2')[0];
	let actNumber2 = document.getElementsByName('actNumber2')[0];
	let actName2 = document.getElementsByName('actName2')[0];
	let actSelect3 = document.getElementsByClassName('actSelect3')[0];
	let bank3 = document.getElementsByClassName('bank3')[0];
	let actNumber3 = document.getElementsByName('actNumber3')[0];
	let actName3 = document.getElementsByName('actName3')[0];
	let actSelect4 = document.getElementsByClassName('actSelect4')[0];
	let bank4 = document.getElementsByClassName('bank4')[0];
	let actNumber4 = document.getElementsByName('actNumber4')[0];
	let actName4 = document.getElementsByName('actName4')[0];
	let actSelect5 = document.getElementsByClassName('actSelect5')[0];
	let bank5 = document.getElementsByClassName('bank5')[0];
	let actNumber5 = document.getElementsByName('actNumber5')[0];
	let actName5 = document.getElementsByName('actName5')[0];
	let actSelect6 = document.getElementsByClassName('actSelect6')[0];
	let bank6 = document.getElementsByClassName('bank6')[0];
	let actNumber6 = document.getElementsByName('actNumber6')[0];
	let actName6 = document.getElementsByName('actName6')[0];
	
	let count = 0;

	  let formData = new FormData();
	  formData.append('itemList[0].itemCode', document.getElementsByName('itemCode')[0].value);
	  //방명록
	  formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', 'OP010');
	  formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', '방명록 기능');
      formData.append('itemList[0].subOptionList['+ count +'].subOptionType', 'guestbookUseable');
      formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', guestbookCheckedId);
      count++;

      //호스트
      if(hostCheckedId === 'hostUseable1'){
	          let mainOptionCode = 'OP002';
	          let mainOptionName = '혼주 정보';
    	  
            const optionData = [
              { type: 'hostType', value: hostType.value },
              { type: 'hostName', value: hostName.value },
              { type: 'hostCheckInput', value: hostCheckInput.value },
              { type: 'hostPhoneNumber', value: hostPhoneNumber.value },
            ];
	          for (let i = 0; i < optionData.length; i++) {
	      		if(optionData[i].value) {
	              formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', mainOptionCode);
	              formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', mainOptionName);
	              formData.append('itemList[0].subOptionList['+ count +'].subOptionType', optionData[i].type);
	              formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', optionData[i].value);
	              count++;
	          }
	      }
      }
      //예식장
          const optionData = [
            { type: 'invitingDate', value: date.value },
            { type: 'invitingTime', value: time.value },
            { type: 'locationName', value: locationName.value },
            { type: 'locationDetail', value: locationDetail.value },
            { type: 'locationCall', value: locationCall.value },
            { type: 'locationAddress', value: locationAddress.value }
          ];
          for (let i = 0; i < optionData.length; i++) {
            let mainOptionCode = 'OP003';
            let mainOptionName = '예식장 정보';
            formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', mainOptionCode);
            formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', mainOptionName);
            formData.append('itemList[0].subOptionList['+ count +'].subOptionType', optionData[i].type);
            formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', optionData[i].value);
            count++;
          }
         
	  //기타
      if(etcCheckedId === 'etcUseable1'){
       let mainOptionCode = 'OP004';
       let mainOptionName = '기타 정보';
       
          const optionData = [
            { type: '버스 안내', value: busInfo.value },
            { type: '자가용 안내', value: ownCarInfo.value },
            { type: addOption3.value, value: option3.value },
            { type: addOption4.value, value: option4.value },
            { type: addOption5.value, value: option5.value },
            { type: addOption6.value, value: option6.value }
          ];
	      for (let i = 0; i < optionData.length; i++) {
	    	  if(optionData[i].value){
	            formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', mainOptionCode);
	            formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', mainOptionName);
	            formData.append('itemList[0].subOptionList['+ count +'].subOptionType', optionData[i].type);
	            formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', optionData[i].value);
	            count++;
	    	  }
	        }
      }
	
	  //축의금 QR코드
	  if(kakaoPayQR.src){
		  formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', 'OP005');
		  formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', '축의금(카카오페이)');
	      formData.append('itemList[0].subOptionList['+ count +'].subOptionType', 'kakaoPayQR');
	      formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', kakaoPayQR.src);
      count++;
	  }
	
	  //계좌
      if(accountCheckedId === 'accountUseable1'){
    	  let mainOptionCode = 'OP006';
    	  let mainOptionName = '계좌 정보';
	    	    	console.log('act accountCheckedId if 진입');

    	    const optionData = [
    	      { type: actSelect1.name, value: actSelect1.value },
    	      { type: bank1.name, 	   value: bank1.value },
    	      { type: actNumber1.name, value: actNumber1.value },
    	      { type: actName1.name, value: actName1.value },
    	      
    	      { type: actSelect2.name, value: actSelect2.value },
    	      { type: bank2.name, 	   value: bank2.value },
    	      { type: actNumber2.name, value: actNumber2.value },
    	      { type: actName2.name, value: actName2.value },
    	      
    	      { type: actSelect3.name, value: actSelect3.value },
    	      { type: bank3.name, 	   value: bank3.value },
    	      { type: actNumber3.name, value: actNumber3.value },
    	      { type: actName3.name, value: actName3.value },
    	      
    	      { type: actSelect4.name, value: actSelect4.value },
    	      { type: bank4.name, 	   value: bank4.value },
    	      { type: actNumber4.name, value: actNumber4.value },
    	      { type: actName4.name, value: actName4.value },
    	      
    	      { type: actSelect5.name, value: actSelect5.value },
    	      { type: bank5.name, 	   value: bank5.value },
    	      { type: actNumber5.name, value: actNumber5.value },
    	      { type: actName5.name, value: actName5.value },

    	      { type: actSelect6.name, value: actSelect6.value },
    	      { type: bank6.name, 	   value: bank6.value },
    	      { type: actNumber6.name, value: actNumber6.value },
    	      { type: actName6.name, value: actName6.value }
    	    ];
    	    
    	    for(let i=0; i < optionData.length; i++){
	    	    if(optionData[i].value && (optionData[i].value.slice(-2) != "선택")){
	    	      formData.append('itemList[0].subOptionList['+ count +'].mainOptionCode', mainOptionCode);
	    	      formData.append('itemList[0].subOptionList['+ count +'].mainOptionName', mainOptionName);
	    	      formData.append('itemList[0].subOptionList['+ count +'].subOptionType', optionData[i].type);
	    	      formData.append('itemList[0].subOptionList['+ count +'].subOptionValue', optionData[i].value);
	    	      count++;
	    	    }
    	    }
    	}
      
	  console.log("optionSubData::"+document.getElementsByName('itemCode')[0].value);
	  console.log("optionSubData::"+count);
	  console.log(Array.from(formData.entries()));
	  serverCallByFetchAjax(formData, "/Api/InsertSubOptionStep1", "post", "resOptionSubData");
}
function resOptionSubData(serverData) {
	console.log('resOptionSubData');
	console.log(serverData);
	document.getElementsByClassName('row')[16].children[1].children[0].innerText = serverData.itemCode;
	document.getElementsByClassName('row')[16].children[1].children[1].innerText = serverData.builtDate;
	document.getElementsByClassName('row')[16].children[1].children[2].innerText = serverData.templateCode + " / " + serverData.templateName;
}

function videoOptionSubUpdate() {
	let videoURL = document.getElementsByName('videoURL')[0];
	if(videoURL.value){
	  formData = new FormData();
	  formData.append('itemList[0].itemCode', document.getElementsByName('itemCode')[0].value);
	  formData.append('itemList[0].subOptionList[0].mainOptionCode', 'OP007');
	  formData.append('itemList[0].subOptionList[0].mainOptionName', '초대영상');
      formData.append('itemList[0].subOptionList[0].subOptionType', 'URL 입력');
      formData.append('itemList[0].subOptionList[0].subOptionValue', videoURL.value);
      
	  console.log(Array.from(formData.entries()));
	  serverCallByFetchAjax(formData, "/Api/InsertSubOptionStep1", "post", "resOptionSubData");
	}
}

function galleryImageData(){
	  let formData = new FormData();
	  let imgElements = document.querySelectorAll('.galleryImage');

	  if(imgElements.length > 0){
	    formData.append('itemList[0].itemCode', document.getElementsByName('itemCode')[0].value);
	    //formData.append('itemList[0].templateCode', document.getElementsByTagName('iframe')[0].src.slice(-8).toUpperCase());

	    for (let i = 0; i < imgElements.length; i++) {
	      const imgUrl = imgElements[i].src;
		  formData.append('itemList[0].subOptionList['+i+'].mainOptionCode', 'OP008');
		  formData.append('itemList[0].subOptionList['+i+'].mainOptionName', '이미지관리');
	      formData.append('itemList[0].subOptionList['+i+'].subOptionType', 'galleryImage'+(i+1));
	      formData.append('itemList[0].subOptionList['+i+'].subOptionValue', imgUrl);
	    }
	  console.log(document.getElementsByName('itemCode')[0].value);
	  console.log(Array.from(formData.entries()));
	  serverCallByFetchAjax(formData, "/Api/InsertGalleryImage", "post", "resGalleryImageData");
	  }
	}

  
function resGalleryImageData(serverData){
	console.log('resGalleryImageData');
	//console.log(serverData);
	//document.getElementsByClassName('row')[16].children[1].children[0].innerText = serverData.itemCode;
	//document.getElementsByClassName('row')[16].children[1].children[1].innerText = serverData.builtDate;
	//document.getElementsByClassName('row')[16].children[1].children[2].innerText = serverData.templateCode + " / " + serverData.templateName;
}

function createFile() {
    let iframe = document.getElementById('previewFrame');
    let formData = new FormData();
    let doc = iframe.contentDocument || iframe.contentWindow.document;
    let html = doc.documentElement.outerHTML;
    console.log(html); // 콘솔에 HTML 코드 출력
    formData.append("iframeHtml", html);
    formData.append("itemCode", document.getElementsByClassName('col-md-10')[8].children[0].innerText);
    serverCallByFetchAjax(formData, "/Api/CreateItemFile", "post", "resCreateFile");
}

// onload 이벤트 핸들러 등록
let iframe = document.getElementById('previewFrame');
iframe.addEventListener("load", function() {
    let button = document.getElementsByClassName('complateBtn')[0];
    button.addEventListener('click', function() {
        createFile();
    });
});

function resCreateFile(serverData){
	console.log("파일 생성 완료");
}

//<!-- 캘린더 옵션 -->
const offset = 1000 * 60 * 60 * 9;
//const koreaNow = new Date((new Date()).getTime() + offset);
document.getElementById('currentDate').value = new Date((new Date()).getTime() + offset).toISOString().substring(0, 10);
document.getElementById('currentTime').value = new Date((new Date()).getTime() + offset).toISOString().slice(11, 16);
$.datepicker.setDefaults({
  closeText: "닫기",
  prevText: "이전달",
  nextText: "다음달",
  currentText: "오늘",
  monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
    "7월", "8월", "9월", "10월", "11월", "12월"
  ],
  monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
    "7월", "8월", "9월", "10월", "11월", "12월"
  ],
  dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
  dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
  dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
  weekHeader: "주",
  dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
  firstDay: 0,
  isRTL: false,
  showMonthAfterYear: true,
  yearSuffix: "년"
})

$(".datepicker").datepicker({
  minDate: 0
})

function useable(){ //step1 > radio버튼 사용여부에 따른 표시처리
	let hostUseable2 = document.getElementById('hostUseable2');
	if(hostUseable2.checked==true){
		document.getElementsByClassName('contents')[0].hidden= true;
	}else{
		document.getElementsByClassName('contents')[0].hidden= false;
	}
	
	let etcUseable2 = document.getElementById('etcUseable2');
	if(etcUseable2.checked==true){
		document.getElementById('etcContents').hidden= true;
	}else{
		document.getElementById('etcContents').hidden= false;
	}
	
	let kakaoPayUseable2 = document.getElementById('kakaoPayUseable2');
	if(kakaoPayUseable2.checked==true){
		document.getElementById('kakaoPay').hidden= true;
	}else{
		document.getElementById('kakaoPay').hidden= false;
	}
	
	let accountPayUseable2 = document.getElementById('accountUseable2');
	if(accountUseable2.checked==true){
		document.getElementById('accountContents').hidden= true;
	}else{
		document.getElementById('accountContents').hidden= false;
	}
	
}

function useable2(){ //step2 > radio버튼 사용여부에 따른 표시처리
	let videoUseable2 = document.getElementById('videoUseable2');
	if(videoUseable2.checked==true){
		document.getElementById('videoContents').hidden= true;
	}else{
		document.getElementById('videoContents').hidden= false;
	}
	
	let imageUseable2 = document.getElementById('imageUseable2');
	if(imageUseable2.checked==true){
		document.getElementById('imageContents').hidden= true;
	}else{
		document.getElementById('imageContents').hidden= false;
	}
}

function etcAddOption() {
	  let opt1 = document.getElementById('optTitle1');
	  let opt2 = document.getElementById('optTitle2');
	  let opt3 = document.getElementById('optTitle3');
	  let opt4 = document.getElementById('optTitle4');
	  let opt1a = document.getElementById('optContents1');
	  let opt2a = document.getElementById('optContents2');
	  let opt3a = document.getElementById('optContents3');
	  let opt4a = document.getElementById('optContents4');
	  
	   if(opt1.hidden == true){
		  opt1.hidden = false;
		  opt1a.hidden = false;
		} else if(opt2.hidden == true){
		  opt2.hidden = false;
		  opt2a.hidden = false;
		} else if(opt3.hidden == true){
		  opt3.hidden = false;
		  opt3a.hidden = false;
		} else if(opt4.hidden == true){
		  opt4.hidden = false;
		  opt4a.hidden = false;
		  document.getElementById('etcAddBtn').hidden = true;
		}
	  
	}
	
function etcDelOption() {
	  let opt1 = document.getElementById('optTitle1');
	  let opt2 = document.getElementById('optTitle2');
	  let opt3 = document.getElementById('optTitle3');
	  let opt4 = document.getElementById('optTitle4');
	  let opt1a = document.getElementById('optContents1');
	  let opt2a = document.getElementById('optContents2');
	  let opt3a = document.getElementById('optContents3');
	  let opt4a = document.getElementById('optContents4');
	  
	   if(opt4.hidden == false){
		  opt4.hidden = true;
		  opt4a.hidden = true;
		  document.getElementById('etcAddBtn').hidden = false;
		} else if(opt3.hidden == false){
		  opt3.hidden = true;
		  opt3a.hidden = true;
		} else if(opt2.hidden == false){
		  opt2.hidden = true;
		  opt2a.hidden = true;
		} else if(opt1.hidden == false){
		  opt1.hidden = true;
		  opt1a.hidden = true;
		}
}

function accountType(num) {
	if(num == 1){
	  document.getElementById("accountType1").removeAttribute("hidden");
	}else if(num == 2){
	  document.getElementById("accountType2").removeAttribute("hidden");
	}else if(num == 3){
	  document.getElementById("accountType3").removeAttribute("hidden");
	}else if(num == 4){
	  document.getElementById("accountType4").removeAttribute("hidden");
	}else if(num == 5){
	  document.getElementById("accountType5").removeAttribute("hidden");
	}else{
	  document.getElementById("accountType6").removeAttribute("hidden");
	}
}

document.addEventListener("DOMContentLoaded", function() {
	  let select1 = document.getElementsByName('actSelect1')[0];
	  let input1 = document.getElementById("accountType1");
	  
	  let select2 = document.getElementsByName('actSelect2')[0];
	  let input2 = document.getElementById("accountType2");
	  
	  let select3 = document.getElementsByName('actSelect3')[0];
	  let input3 = document.getElementById("accountType3");
	  
	  let select4 = document.getElementsByName('actSelect4')[0];
	  let input4 = document.getElementById("accountType4");
	  
	  let select5 = document.getElementsByName('actSelect5')[0];
	  let input5 = document.getElementById("accountType5");
	  
	  let select6 = document.getElementsByName('actSelect6')[0];
	  let input6 = document.getElementById("accountType6");
	  
	  const directOption = [
	    {type: select1, value: input1},
	    {type: select2, value: input2},
	    {type: select3, value: input3},
	    {type: select4, value: input4},
	    {type: select5, value: input5},
	    {type: select6, value: input6}
	  ];

	  for(let i = 0; i < directOption.length; i++) {
	    directOption[i].type.addEventListener("change", function() {
	      if (directOption[i].type.value !== "직접입력") {
	        directOption[i].value.setAttribute("hidden", "");
	      } else {
	        accountType(i+1);
	      }
	    });
	  }
	});

//호스트 정보 직접입력
function honjuDirect(num){
	if(num == 1){
		document.getElementById('hostType').removeAttribute('hidden');
	}
}

window.addEventListener("load", function() {
	  let select1 = document.getElementsByClassName('hostType')[0];
	  let input1 = document.getElementById("hostType");

	  let directOption = [
	    {type: select1, value: input1}
	  ];

	  let disabledOption = [
		 {name: document.getElementsByName('hostName')[0], phone: document.getElementsByName('hostPhoneNumber')[0], checkBox: document.getElementById('hostCheckBox')}
	  ];

	  for(let i = 0; i < directOption.length; i++) {
	    directOption[i].type.addEventListener("change", function() {
	      if (directOption[i].type.value !== "직접입력") {
	        directOption[i].value.setAttribute("hidden", "");
	        directOption[i].type.style.width='130px';
	      } else {
	        directOption[i].type.style.width='115px';
	        honjuDirect(i+1);
	      }
	      if (directOption[i].type.value !== "입력안함") {
	    	  disabledOption[i].name.style.backgroundColor="";
	    	  disabledOption[i].phone.style.backgroundColor="";
	    	  disabledOption[i].checkBox.style.backgroundColor="";
	    	  disabledOption[i].name.disabled = false;
	    	  disabledOption[i].phone.disabled = false;
	    	  disabledOption[i].checkBox.disabled = false;
	      } else {
	    	  disabledOption[i].name.style.backgroundColor="rgba(195, 195, 210, 0.5)";
	    	  disabledOption[i].phone.style.backgroundColor="rgba(195, 195, 210, 0.5)";
	    	  disabledOption[i].checkBox.style.backgroundColor="rgba(195, 195, 210, 0.5)";
	    	  disabledOption[i].name.disabled = true;
	    	  disabledOption[i].phone.disabled = true;
	    	  disabledOption[i].checkBox.disabled = true;
	      }
	    });
	  }
	});

function accountAddOption() {
	  let opt5 = document.getElementById('optTitle5');
	  let opt6 = document.getElementById('optTitle6');
	  let opt7 = document.getElementById('optTitle7');
	  let opt8 = document.getElementById('optTitle8');
	  let opt5a = document.getElementById('optContents5');
	  let opt6a = document.getElementById('optContents6');
	  let opt7a = document.getElementById('optContents7');
	  let opt8a = document.getElementById('optContents8');
	   
	   if(opt5.hidden == true){
		  opt5.hidden = false;
		  opt5a.hidden = false;
		} else if(opt6.hidden == true){
		  opt6.hidden = false;
		  opt6a.hidden = false;
		} else if(opt7.hidden == true){
		  opt7.hidden = false;
		  opt7a.hidden = false;
		} else if(opt8.hidden == true){
		  opt8.hidden = false;
		  opt8a.hidden = false;
		  document.getElementById('accountAddBtn').hidden = true;
		}
	  
	}

function accountDelOption() {
	  let opt5 = document.getElementById('optTitle5');
	  let opt6 = document.getElementById('optTitle6');
	  let opt7 = document.getElementById('optTitle7');
	  let opt8 = document.getElementById('optTitle8');
	  let opt5a = document.getElementById('optContents5');
	  let opt6a = document.getElementById('optContents6');
	  let opt7a = document.getElementById('optContents7');
	  let opt8a = document.getElementById('optContents8');
	  
	   if(opt8.hidden == false){
			  opt8.hidden = true;
			  opt8a.hidden = true;
			  document.getElementById('accountAddBtn').hidden = false;
			} else if(opt7.hidden == false){
			  opt7.hidden = true;
			  opt7a.hidden = true;
			} else if(opt6.hidden == false){
			  opt6.hidden = true;
			  opt6a.hidden = true;
			} else if(opt5.hidden == false){
			  opt5.hidden = true;
			  opt5a.hidden = true;
			}
}

function checkboxValueChange(){ //국제전화 사용여부에 따른 표시처리
	let hostCheckBox = document.getElementsByName('hostCheckBox');
	let hostCheckInput = document.getElementsByName('hostCheckInput')[0];
	let isHostChecked1 = hostCheckBox.checked;

	if(isHostChecked1){
		hostCheckInput.readOnly= false;
		hostCheckInput.style.backgroundColor='';
	}else{
		hostCheckInput.readOnly= true;
		hostCheckInput.style.backgroundColor='rgba(195, 195, 210, 0.5)';
	}
}

//Kakao Map
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 우편번호api 팝업창
function postCode() {
    new daum.Postcode({
        oncomplete: function(data) {

        	var addr = ''; // 주소 변수
         	// 사용자가 선택한 주소 값을 인풋란에 채워주기
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType) { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
	 		// 주소 정보를 해당 필드에 넣는다.
    		document.getElementsByClassName("search-input")[0].value = addr;
    		//주소로 좌표를 검색합니다
    		geocoder.addressSearch(addr, function(result, status) {

    		// 정상적으로 검색이 완료됐으면 
    		 if (status === kakao.maps.services.Status.OK) {
    			 console.log('test');

    		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    		    // 결과값으로 받은 위치를 마커로 표시합니다
    		    var marker = new kakao.maps.Marker({
    		        map: map,
    		        position: coords
    		    });

    		    // 인포윈도우로 장소에 대한 설명을 표시합니다
    		    //var infowindow = new kakao.maps.InfoWindow({
    		        //content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    		    //});
    		    //infowindow.open(map, marker);

    		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    		    map.setCenter(coords);
    		} 
    		});    
        }

    }).open();
}

function modalOpen(idx){
	if(idx==0){
		const youtubeModal = document.getElementById('youtubeModal');
		let myModalInstance = new bootstrap.Modal(youtubeModal);

		myModalInstance.show();
	}else if(idx==1){
		const vimeoModal = document.getElementById('vimeoModal');
		let myModalInstance = new bootstrap.Modal(vimeoModal);

		myModalInstance.show();
	}else if(idx==2){
		const feelmakerModal = document.getElementById('feelmakerModal');
		let myModalInstance = new bootstrap.Modal(feelmakerModal);

		myModalInstance.show();
	}
}

Dropzone.autoDiscover = false;
var dropzonePreviewNode = document.querySelector('#dropzone-preview-list');
dropzonePreviewNode.id = '';
var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

const dropzone = new Dropzone(".dropzone", {
  url: "https://httpbin.org/post", // 파일을 업로드할 서버 주소 url.
  method: "post", // 기본 post로 request 감. put으로도 할수있음

  previewTemplate: previewTemplate, // 만일 기본 테마를 사용하지않고 커스텀 업로드 테마를 사용하고 싶다면
  previewsContainer: '#dropzone-preview', // 드롭존 영역을 .dropzone이 아닌 다른 엘리먼트에서 하고싶을때
});

</script>
</html>