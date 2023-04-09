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
<script>
	function getTemplateInfo(){
		JWTCheck();
		let formData = new FormData();
		serverCallByFetchAjax(formData, 'getTemplateInfo', 'post', 'viewTemplateInfo');	
	}
	
	function JWTCheck(){
		let jwt = '${jwt}';
		if(jwt != ''){
			sessionStorage.setItem('JWT', jwt);
			console.log(jwt);
		}
	}
	
	function viewTemplateInfo(serverData){
		let templateInfo = ('${templateInfo}');
		templateInfo = templateInfo.replaceAll("TemplateDetailBean","");
		templateInfo = templateInfo.replaceAll("(","{");
		templateInfo = templateInfo.replaceAll(")","}");

		// 쌍따옴표로 감싸기 전의 문자열
		let jsonString = templateInfo;

		jsonString = jsonString.replaceAll("=",":")
								.replaceAll('templateDetailCode:','"templateDetailCode":"')
								.replaceAll(', ', '", ')
								.replaceAll('templateDetailName:','"templateDetailName":"')
								.replaceAll(', ', ', ')
								.replaceAll('templateTagCode:','"templateTagCode":"')
								.replaceAll(', ', ', ')
								.replaceAll('templateDetailContents:','"templateDetailContents":"')
								.replaceAll("}",'"}')
								.replaceAll('}"',"}");
		jsonString = JSON.parse(jsonString);
		console.log(jsonString);
		
		for(let i = 0; i<jsonString.length;i++){
			let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/"+jsonString[i].templateDetailCode.toLowerCase()+".png";
			createTemplateData(url, jsonString[i].templateDetailCode, jsonString[i].templateDetailName, jsonString[i].templateDetailContents=='best'?true:false);
		}
		
	}
		
	function createTemplateData(image, templateCode, templateName, isBest){
		
		let row = document.getElementsByClassName('row')[isBest?4:5];
		
		let col = document.createElement('div');
		col.setAttribute("class","col-5");
		
		let templateGuide = document.createElement('div');
		templateGuide.setAttribute("class","template-ex-guide");
		
		let templateImage = document.createElement('div');
		templateImage.setAttribute("class","template-ex-img");
		templateImage.style.backgroundImage='url("'+image+'")'
		
		let h1 = document.createElement('h1');
		h1.innerText = templateCode;
		let p = document.createElement('p');
		p.innerText = templateName;
		
		templateGuide.appendChild(templateImage);
		templateGuide.appendChild(h1);
		templateGuide.appendChild(p);
		col.appendChild(templateGuide);
		
		row.appendChild(col);
	}
</script>
<body onload="getTemplateInfo()">
  <div id="guideLine">
    <div id="nav" style="z-index: 2">
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
        <div> <!-- 캐러셀 -->
          <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true" style="width: 100%">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active" style="background-color: #FDEBED">
                  <div class="row carousel-row">
                    <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                    <div class="col-lg-6 col-left">
                    <div>
                      <h1 class="kor">특별한 우리의 결혼식,<br> 우리만의 특별한 청첩장을 만들어보세요.</h1>
                      <button type="button" class="btn btn-primary btn-produce-md kor" onClick="pageReturn(0)">템플릿 보러가기</button>
                    </div>
                    </div>
                    <div class="col-lg-6 col-right">
                    <div>
                      <img class="title-image" src="../../resources/images/wedding-invitation.png" alt="">
                    </div>
                    </div>
                  </div>
                </div>
                <div class="carousel-item" style="background-color: #ECECEC;">
                  <div class="row carousel-row">
                    <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                    <div class="col-lg-6 col-left">
                    <div>
                      <h1 class="kor">특별한 우리 부모님,<br>하나뿐인 초대장으로 축하를 시작하세요.</h1>
                      <button type="button" class="btn btn-primary btn-produce-md kor"  onClick="pageReturn(1)">템플릿 보러가기</button>
                    </div>
                    </div>
                    <div class="col-lg-6 col-right">
                        <div>
                      <img class="title-image" src="../../resources/images/seventyyear.png" alt="">
                    </div>
                    </div>
                  </div>
                </div>
                <div class="carousel-item" style="background-color: #FFFFE8;">
                  <div class="row carousel-row">
                    <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                    <div class="col-lg-6 col-left">
                        <div>
                      <h1 class="kor">특별한 우리의 첫 돌,<br>기억에 남을만한 초대장을 만들어보세요.</h1>
                      <button type="button" class="btn btn-primary btn-produce-md kor"  onClick="pageReturn(2)">템플릿 보러가기</button>
                    </div>
                    </div>
                    <div class="col-lg-6 col-right">
                        <div>
                      <img class="title-image" src="../../resources/images/firstyear.png" alt="">
                    </div>
                    </div>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
        </div>
        <!-- 장점 설명 -->
        <div>
          <div class="row">
            <div class="col-lg-4 advantages-guide">
                <img src="../../resources/images/kakao_mony_gift.png" alt="">
                <div class="advantages-text kor Regular">
                  <h1>카카오 송금기능</h1>
                  <p>축의금, 부의금 카카오 송금으로 편하게!</p>
                </div>
            </div>
            <div class="col-lg-4 advantages-guide">
              <img src="../../resources/images/unique_design.png" alt="">
              <div class="advantages-text kor Regular">
                <h1>내가 만든 초대장</h1>
                <p>세상에 하나뿐인 초대장을 만들어보세요!</p>
              </div>
            </div>
            <div class="col-lg-4 advantages-guide">
              <img src="../../resources/images/allfree.png" alt="">
              <div class="advantages-text kor Regular" >
                <h1>평생 무료</h1>
                <p>보네르는 평생 무료 서비스 제공!</p>
              </div>
            </div>
          </div>
        </div>
        <hr>
        <!-- best & new template -->
        <div class="template-ex-area">
          <h1 class="template-ex-title">BEST TEMPLATE</h1>
          <div class="row">
          	<!-- Dynamic Insert Best Template -->
          </div>
          <h1 class="template-ex-title">NEW TEMPLATE</h1>
          <div class="row">
          	<!-- Dynamic Insert New Template -->
          </div>
        </div>
        <!-- 고해상도 동영상 지원 -->
        <div class="video-area">
        </div>
        <!-- 고해상도 동영상 지원 -->
        <div class="kakao-transfer-area">
        </div>
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