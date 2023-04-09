<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 뷰포트 설정 -->
    <title>Mobile Responsive Page</title>
    <link rel="stylesheet" href="../../../resources/css/templateLayout.css">
    <link rel="stylesheet" href="../../../resources/css/greetingCard.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa7a2e9f7e56abef76c7bfab61fb9873&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script src="https://kit.fontawesome.com/e468e5c856.js" crossorigin="anonymous"></script>
<script>
function imagesProcessing(){
	let gallery = document.getElementsByClassName("gallery")[0];
	
	for(let i=1;i<=9;i++){
		let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/terry"+i+".jpeg";
		if(i>6) url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/terry"+(i-6)+".jpeg"
		if(isValidUrl(url)){
			let images = document.createElement('div');
			images.setAttribute('class','gallery-image');
			images.style.backgroundImage="url("+url+")";
			gallery.appendChild(images);
		}
	}
}
	
function isValidUrl(url) {
	  try {
	    new URL(url);
	    return true;
	  } catch (error) {
	    return false;
	  }
}

</script>
<style>
	.main{
		background-image: url("https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/etc10001.png");
		background-color: white;
	}
</style>
<body onload="imagesProcessing()">
    <div class="container">
        <div class="box main">
        	<div class="host-name">
        		<h1>주최 보네르</h1>
        	</div>
        	<div class="title">
        		<h1>정기총회 및 신년 인사회에<br> 초대합니다.</h1>
        	</div>
        </div>
        <div class="box greetMsg">
            <div>금년 한해를 결산하고 2023년 새롭게 출발하는<br>
                정기총회 및 신년인사회를 개최합니다.<br>
                바쁘신 중에도 부디 참석하시어<br> 
                자리를 빛내주시기 바라며,<br>
                새해를 맞아 늘 건승하시길 기원합니다.</div>
        </div>
        <div class="box contact">
            <div>
                <p>신랑에게 연락하기</p>
                <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
            </div>
            <div>
                <p>신부에게 연락하기</p>
                <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
            </div>
        </div>
        <div class="box contact2">
            <div>
                <div class="guardian">
                    <p>신랑측 혼주</p>
                    <p>아버지 : 혼주1 이름</p>
                    <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                    <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
                    <p>어머니 : 혼주2 이름</p>
                    <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                    <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
                </div>
            </div>
            <div>
                <div class="guardian">
                    <p>신부측 혼주</p>
                    <p>아버지 : 혼주1 이름</p>
                    <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                    <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
                    <p>어머니 : 혼주2 이름</p>
                    <a href="tel:010-1234-5678"><i class="fa-solid fa-phone"></i></a>
                    <a href="sms:010-1234-5678"><i class="fa-solid fa-comment-sms"></i></a>
                </div>
            </div>
        </div>
        <div class="box gallery">
            <p>Gallery</p>
        </div>
        <div class="box movie">
            <p>Movie</p>
            <video width="90%" controls>
                <source src="https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/video/terry.mp4" type="video/mp4">
            </video>
        </div>
        <div class="box location">
            <h1>Location</h1>
			<div id="map"></div>
			<div class="location-info">
				<div class="location-info-flex">
					<div>
						<h2>신라호텔 메모리즈힐</h2>
						<p>서울 중구 동호로 249</p>
						<p>02-2233-3131</p>
					</div>
					<div>
					<a href="tel:02-2233-3131"><i class="fa-solid fa-phone"></i></a>
					</div>
				</div>
				<div class="location-subInfo">
					<h6>버스 안내</h6>
					<p>버스 안내 문구가 들어가는 부분입니다.</p>
					<h6>자가용 안내</h6>
					<p>자가용 안내 문구가 들어가는 부분입니다.</p>
					<h6>지하철 안내</h6>
					<p>지하철 안내 문구가 들어가는 부분입니다.</p>
					<h6>주차 안내</h6>
					<p>주차 안내 문구가 들어가는 부분입니다.</p>
					<h6>피로연 안내</h6>
					<p>피로연 안내 문구가 들어가는 부분입니다.</p>
				</div>
			</div>
        </div>
        <div class="box money-gift">
            <h1>신랑 & 신부에게 마음을 전하기</h1>
            <p>축하의 의미를 담아 축의금을 전달해보세요.</p>
            <div class="kakao-transfer" onClick="/"></div>
            <div class="account-number" onClick="/"></div>
        </div>
        <div class="box guest-book">
            <h1>GUEST BOOK</h1>
            <div class="guest-book-databox">
            <div class="guest-book-row">
                <div>이름 : </div>
            <input type="text" id="guestName" name="guestName" placeholder="이름을 입력하세요." required>
            </div>
            <div class="guest-book-row">
                <div>메시지 : </div>
                <input type="text" id="message" name="guestMessage" placeholder="축하 메시지를 입력하세요." required></input>
            </div>
            <div class="guest-book-row">
                <input type="button" value="등록하기" onClick="#"></input>
            </div>
            </div>
            <div class="guest-text">
                <div class="guest-text-row">
                    <span>홍길동</span>
                    <span>2022.02.22 13:43</span>
                </div>
                <div class="guest-text-row">
                    <span>결혼 축하해! 행복하게 잘 살아!</span>
                </div>
            </div>
        </div>
        <div class="share-link">
            <a href="https://naver.com"><i class="fa-brands fa-facebook"></i></a>
            <a href="https://naver.com"><img src="../../../resources/images/kakao-svg.svg"></a>
            <a href="https://naver.com"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
        </div>
        <div class="logo"><a>Bonheur</a></div>
    </div>
</body>
<script>
//카카오지도 검색 키워드 입력
var inputData = ['신라호텔 메모리즈힐'];

var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.54699, 127.09598),
        level: 4
    };
var map = new kakao.maps.Map(mapContainer, mapOption);
var count = 0;
var ps = new kakao.maps.services.Places();
var bounds = new kakao.maps.LatLngBounds();

if (inputData != null) {
    kewwordSearch(inputData[count]);
}

function kewwordSearch(keword) {
    ps.keywordSearch(keword, placesSearchCB);
    count = count + 1;
}

function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        displayMarker(data[0]);
        bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        if (count < inputData.length) {
            kewwordSearch(inputData[count]);
        } else if (count == inputData.length) {
            setBounds();
        }
    }
}

function displayMarker(place) {
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x),
    });
    kakao.maps.event.addListener(marker, 'click', function () {
        var position = this.getPosition();
        var url = 'https://map.kakao.com/link/map/' + place.id;
        window.open(url, '_blank');
    });
}

function setBounds() {
    map.setBounds(bounds, 90, 30, 10, 30);
}
</script>
</html>