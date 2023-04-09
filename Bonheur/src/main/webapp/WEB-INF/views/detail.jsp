<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Detail.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <script src="../../resources/js/common.js"></script>
    <script src="../../resources/js/pageController.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/layout.css">
    <link rel="stylesheet" type="text/css" id="changeStyle" href="resources/css/styleGuide.css" />
</head>
<style>
    .phone-box{
        display:flex;
        align-items:center; /* 방향이 row 기준: 세로 중앙 정렬*/
        height: 90vh;
        width: 55%;
        background-color: #eaeaee;
        float: left;
    }

    .list-phone{
        border:none;
    	width: 280px;
        height: 512px;
        margin: 0 auto;
        padding: 0;
        position:relative;
    }
    .template-description{
        height: 90vh;
        width: 45%;
        background-color: white;
        float: left;
        padding: 5%;
    }

    .template-description > p{
        font-size: 16px;
        color: #6C757D;
        padding: 0;
        margin: 0;
        display: inline-block;
        font-family: 'Roboto', sans-serif;
    }

    .template-description > h1{
        font-size: 20px;
        color: #6C757D;
        display: inline-block;
        margin-top: 10px;
        padding: 0;
        height: 0;
        font-family: 'Roboto', sans-serif;
    }

    .template-description > .bi{
        float: right;
        font-size: 20px;
        margin-top: 5px;
    }

    .col-lg-3 > h2{
        font-size: 16px;
        color: #6C757D;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .col-lg-9 > h3{
        font-size: 16px;
        color: #6C757D;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .detail-row > .col-lg-9{
        padding: 0 10%;
    }

    .detail-row{
        padding: 0 3%;
        margin-bottom: 5%;
    }
    
    .previewFrame{
      	position: absolute;
	    width: 100%;
	    height: 100%;
	    border-radius: 50px;
    	border: solid 10px #292929;
     }
     
     .bi{
     	cursor:pointer;
     }

</style>
<script type="text/javascript">

	function qrCodeGenerator(templateCode){
	    let qrcode = new QRCode(document.getElementsByClassName("qr-box")[0], {
	        text: "http://192.168.0.36/template/"+templateCode.toLowerCase(),
	        width: 100,
	        height: 100,
	        colorDark : "#000000",
	        colorLight : "#ffffff",
	        correctLevel : QRCode.CorrectLevel.H //qr코드 오류복원능력임 (L->M->Q->H)
	    });
	}
	
	function viewDetail(){
    	console.log(${templateDetailInfo});
    	let templateInfo = ${templateDetailInfo};
    	document.getElementsByClassName('template-description')[0].children[0].innerText = templateInfo[0].templateDetailCode;
    	document.getElementsByClassName('template-description')[0].children[2].innerText = templateInfo[0].templateDetailName;
    	
    	let detailContents = document.getElementsByClassName('detail-row')[3].children[1]
    	
    	for(let i=0; i<templateInfo.length; i++){
    		let h3 = document.createElement('h3');
    		h3.innerText = '- ' + templateInfo[i].templateDetailContents;
    		if(templateInfo[i].templateTagCode.substring(0,2) != "TG") detailContents.appendChild(h3);
    	}
    	
    	document.getElementsByTagName('iframe')[0].src = "/template/"+templateInfo[0].templateDetailCode.toLowerCase();
    	
    	qrCodeGenerator(templateInfo[0].templateDetailCode);
    	getWishInfo(document.getElementsByClassName('template-description')[0].children[0].innerText);
    }
	
	function getWishInfo(wishCode){
		let formData = new FormData();
		formData.append('wishList[0].templateCode', wishCode);
		serverCallByFetchAjax(formData, "/Api/getWishInfo", 'post', "wishListCallBack")
	}
	
	function addWishList(){
		let heart = document.getElementsByClassName('bi bi-suit-heart b')[0];
		if(heart != null){
			if(sessionStorage.JWT){
				let formData = new FormData();
				formData.append('wishList[0].templateCode', document.getElementsByClassName('template-description')[0].children[0].innerText);
				serverCallByFetchAjax(formData, "/Api/AddWishList", 'post', "wishListCallBack")
			}else{
				console.log('로그인 후 이용해주세요.');
			}
		}else{
			let formData = new FormData();
			formData.append('wishList[0].templateCode', document.getElementsByClassName('template-description')[0].children[0].innerText);
			serverCallByFetchAjax(formData, "/Api/DeleteWishList", 'post', "wishListCallBack")
		}
	}
	
	function wishListCallBack(serverData){
		if(serverData.message == 'addTrue' || serverData.message == 'dup'){
			document.getElementsByClassName('bi bi-suit-heart b')[0].setAttribute('class','bi bi-suit-heart-fill b');
		}else if(serverData.message == 'delTrue' || serverData.message == 'usable'){
			document.getElementsByClassName('bi bi-suit-heart-fill b')[0].setAttribute('class','bi bi-suit-heart b');			
		}
	}
	
	function moveProduce(){
		let clientData = [];
		let templateCode = document.getElementsByClassName('template-description')[0].children[0].innerText;
		clientData.push(["wishList[0].templateCode",document.getElementsByClassName('template-description')[0].children[0].innerText]);
		
		if(templateCode.substring(0,3).toUpperCase() == 'WED'){
			serverCallByRequest("/produceWedding","post",clientData);			
		}else if(templateCode.substring(0,3).toUpperCase() == 'THX'){
			serverCallByRequest("/produceThxCard","post",clientData);			
		}else if(templateCode.substring(0,3).toUpperCase() == 'BIR'){
			serverCallByRequest("/produceFirstBirth","post",clientData);			
		}else{
			serverCallByRequest("/produceExtraCard","post",clientData);			
		}
	}
</script>
<body onload="viewDetail()">
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
    <div id="contents" style="background-color: white; height: 70vh;">
        <div class="phone-box">
            <div class="phone list-phone"><div class="M-line" style="z-index:1"></div>
            	<iframe scrolling="yes" id="previewFrame" class="previewFrame"></iframe>
            </div>
        </div>
        <div class="template-description">
            <p>Template Code</p>
            <br>
            <h1>Template Name</h1>
            <div class="bi bi-suit-heart b" onClick="addWishList()"></div>
            <hr>
            <div class="row detail-row">
                <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                <div class="col-lg-3" style="padding:0;">
                    <h2>제작기간</h2>
                </div>
                <div class="col-lg-9">
                    <h3>즉시</h3>
                </div>
            </div>
            <div class="row detail-row">
                <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                <div class="col-lg-3" style="padding:0;">
                    <h2>사용기간</h2>
                </div>
                <div class="col-lg-9">
                    <h3>제작 후 1년 간 유지</h3>
                </div>
            </div>
            <div class="row detail-row">
                <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                <div class="col-lg-3" style="padding:0;">
                    <h2>미리보기</h2>
                </div>
                <div class="col-lg-9">
                    <div class="qr-box" style="display: inline-block"></div>
                </div>
            </div>
            <div class="row detail-row">
                <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
                <div class="col-lg-3" style="padding:0;">
                    <h2>무료 제공 기능</h2>
                </div>
                <div class="col-lg-9">
                </div>
            </div>
            <button type="button" class="btn btn-primary btn-produce-md kor" style="margin-top: 5%; width: 100%;" onClick="moveProduce()">제작하기</button>
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
</html>