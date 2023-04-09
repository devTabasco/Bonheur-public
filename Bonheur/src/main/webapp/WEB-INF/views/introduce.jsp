<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bonheur Main</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script src="../../resources/js/pageController.js"></script>
    <script src="../../resources/js/common.js"></script>
    <link rel="stylesheet" href="../../resources/css/common.css">
    <link rel="stylesheet" href="../../resources/css/layout.css">
    <link rel="stylesheet" type="text/css" id="changeStyle" href="../../resources/css/styleGuide.css" />
</head>
<style>
/* Title Image */
.title-image{
  width: 50%;
  transform: rotate(25deg);
}
.carousel-row{
  height: 80vh;
  padding: 3% 15%;
}
.col-left{
  padding: 5%;
  display:flex;
  align-items:center; /* 방향이 row 기준: 세로 중앙 정렬*/
}

.col-right{
  padding-left: 15%;
  display:flex;
  align-items:center; /* 방향이 row 기준: 세로 중앙 정렬*/
}

.col-left > div > h1{
  line-height: 1.5;
}
.col-left > div > button{
  margin: 10% 3% 0 0;
}

.advantages-guide{
  background-color: white;
  text-align: center;
  padding: 5% 3%;
}

.advantages-guide > img{
  width: 80%;
}
.advantages-text{
  margin-top: 7%;
}
.advantages-text > h1{
  color: #58AAFF;
  font-size: 24px;
}

.advantages-text > p{
  color: #6C757D;
  font-size: 16px;
}

.col-5{
  width: 20%;
  padding: 0;
}

.template-ex-area{
  width: 100%;
  padding: 0 5% 5% 5%;
  margin: 0 auto;
}

.template-ex-guide{
  width: 90%;
  padding: 5% 3%;
  text-align: center;
  border: 1px solid #B0B6BA;
  border-radius: 10px;
  box-sizing: border-box;
}

.template-ex-guide > h1{
  font-size: 16px;
  color: #6C757D;
  margin-top: 10%;
}

.template-ex-guide > p{
  font-size: 20px;
  color: #6C757D;
  padding: 0;
  margin: 0;
}

.template-ex-img{
  width: 186px;
  height: 300px;
  padding: 0;
  margin: 0 auto;
  border-radius: 10px;
  background-size: cover;
}

.template-ex-title{
  text-align: center;
  color: #6C757D;
  margin: 5% 0;
}

.video-area{
  width: 100%;
  height: 80vh;
  background-image: url("../../../resources/images/hiqualVideo.png");
  background-size: cover;
  background-position: center;
}

.kakao-transfer-area{
  width: 100%;
  height: 40vh;
  background-image: url("../../../resources/images/kakaoPayAds.png");
  background-size: cover;
  background-position: center;
}

</style>

<body onload="getTemplateInfo()" class="kor">
  <div id="guideLine">
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
        
		<div style="width: 800px; margin: auto; padding-top: 100px; padding-bottom: 100px; text-align: center;">
        	<h1 style="color: #0069D9;">BonheurCard</h1>
			<hr style="color: #0069D9">

			<h3 style="padding-top: 50px; color: #58AAFF;">
				사람과 사람의 마음을 연결하는
			</h3><br>
			<h3 style="color: #58AAFF;">	
				대한민국 대표 청첩장의 특별함을 담았습니다.
			</h3>
		</div>
		
			<div style="display: flex; justify-content: flex-end; align-items: center;">
				<div style="margin-right: 200px; width: 650px">
					<h3>
						<b>간편 축의금 송금
						</b><br><br>
						   축의금도 언택트 시대,<br>
					       얼굴 붉히며 계좌번호 알려드리지 않아도 괜찮아요.<br>
						   카카오페이로 축의금을 받을 수 있습니다.
					</h3>
				</div>
				<div>
					<img src="../../resources/images/send.png" style="width: 500px; height: 500px; float: right;">
				</div>
			</div>
			
			<div style="display: flex; justify-content: flex-end; align-items: center;">
				<div style="margin-right: 200px; width: 650px;">
					<h3>
						<b>누구나 쉽게<br>
						   모바일 청첩장 만들기
						</b><br><br>
						   인생에 한 번 뿐인 소중한 날을 위해,<br>
						   정성 가득 담긴 모바일 청첩장을 만들어 보세요.
					</h3>
				</div>
				<div>
					<img src="../../resources/images/invitationcard.png" style="width: 500px; height: 500px; float: right;">
				</div>
			</div>
		
			<div style="display: flex; justify-content: flex-end; align-items: center;">
				<div style="margin-right: 200px; width: 650px;">
					<h3>
						<b>다양한 이벤트<br>
						   따로 쓰는 모바일 청첩장
						</b><br><br>
						   가족에겐 정중한 인사와 단정한 사진을,<br>
						   친구에겐 스스럼없는 인사와 가벼운 사진을.<br>
						   하객에 따라 다양하게 제작해 보세요.<br>
					</h3>
				</div>
				<div>
					<img src="../../resources/images/oneyear.png" style="width: 500px; height: 500px; float: right;">
				</div>
			</div>
		
			<div style="display: flex; justify-content: flex-end; align-items: center;">
				<div style="margin-right: 200px; width: 650px;">
					<h3>
						<b>이 모든 것이<br>
						   무료로 이용 가능
						</b><br><br>
						   무료라고 모두 퀄리티가 떨어지는 것은 아닙니다.<br>
						   평생의 추억을 보네르에서 만들어 보세요.
					</h3>
				</div>
				<div>
					<img src="../../resources/images/pic4.png" style="width: 500px; height: 500px; float: right;">
				</div>
			</div>
		<br>
		<br>
        <div id="footer">
            <div>
                <ul class="footer-container">
                    <li style="margin-left:5%"><div class="logo" style="line-height: 5vh;"><a class="logo" href="#" style="font-size: 20px;">Bonheur</a></div></li>
                    <li class="footer-item kor" style="margin-left:60%"><span onClick="footerPageContoller(0)">서비스 소개</span></li>
                    <li class="footer-item kor"><span onClick="footerPageContoller(1)">이용약관</span></li>
                    <li class="footer-item kor"><span onClick="footerPageContoller(2)">개인정보처리방침</span></li>
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
</body>
</html>