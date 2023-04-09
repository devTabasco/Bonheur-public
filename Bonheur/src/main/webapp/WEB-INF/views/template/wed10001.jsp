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
	
	if(document.getElementsByClassName("gallery")[0].children.length == 1){
	writeKakaoMap('신라호텔 메모리즈힐');
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
		background-image: url("https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/wed10001.png");
	}
	
	/* 모달 스타일 */
	.modal {
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  width: 80vw;
	  background-color: white;
	  z-index: 20; /* 배경보다 높은 z-index값 */
	  padding: 3vw 5vw;
	}
		
</style>
<body onload="imagesProcessing();">
    <div class="container">
        <div class="box main">
        	<div class="host-name">
        		<h1>정현우 & 한가인</h1>
        	</div>
        	<div class="title">
        		<h1>현우와 가인이의 결혼식에<br>여러분을 초대합니다!</h1>
        	</div>
        </div>
        <div class="box greetMsg">
            <div>서로를 바라보며 다져온 사랑<br>
                이제 한 곳을 바라보며<br>
                평생 함께하려 합니다<br>
                우리의 길을 축복해주세요</div>
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
            <h1>Gallery</h1>
        </div>
        <div class="box movie">
            <h1>Movie</h1>
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
					<h6>기타 안내</h6>
					<p>기타 안내 문구가 들어가는 부분입니다.</p>
				</div>
			</div>
        </div>
        <div class="box money-gift">
            <h1>신랑 & 신부에게 마음을 전하기</h1>
            <p>축하의 의미를 담아 축의금을 전달해보세요.</p>
            <div class="kakao-transfer" onClick="/"></div>
            <div class="account-number" onClick="openModal()"></div>
			<!-- 모달 내용 -->
			<div class="modal" id="modal" style="display:none">
			  <button onclick="closeModal()">닫기</button>
			</div>
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
		               <input type="button" value="등록하기" onClick="messageRegistration()"></input>
		           </div>
	            </div>
        	  	<div id="exGuestBook">
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
	        </div>
        <div class="share-link">
            <a href="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(window.location.href))"><i class="fa-brands fa-facebook"></i></a>
            <a href="javascript:window.location.href='kakaotalk://sendurl?url='+encodeURIComponent(window.location.href)"><img src="../../../resources/images/kakao-svg.svg"></a>
            <a href="javascript:void(navigator.share({url:location.href}))"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
        </div>
        <div class="logo"><a>Bonheur</a></div>
    </div>
</body>
<script>
function openModal() {
	  var modal = document.getElementById('modal');
	  var modalBackground = document.getElementById('modal-background');
	  modal.style.display = 'block';
	  modalBackground.style.display = 'block';
	}
	
function closeModal() {
	  var modal = document.getElementById('modal');
	  var modalBackground = document.getElementById('modal-background');
	  modal.style.display = 'none';
	  modalBackground.style.display = 'none';
	}

function messageRegistration(){
	let guestName = document.getElementById('guestName').value;
	let message = document.getElementById('message').value;
	let exGuestBook = document.getElementById('exGuestBook');
	const offset = 1000 * 60 * 60 * 9;
	let currentDate = new Date((new Date()).getTime() + offset).toISOString().substring(0, 10);
	let currentTime = new Date((new Date()).getTime() + offset).toISOString().slice(11, 16);
	if(guestName && message){
		exGuestBook.hidden = true;
		let guestText = document.createElement('div');
		let guestTextRow = document.createElement('div');
		let guestTextRow2 = document.createElement('div');
		let guestNameSpan = document.createElement('span');
		let messageDateSpan = document.createElement('span');
		let guestMessageSpan = document.createElement('span');
		
		guestText.setAttribute('class', 'guest-text');
		guestTextRow.setAttribute('class', 'guest-text-row');
		guestTextRow2.setAttribute('class', 'guest-text-row');
		guestText.appendChild(guestTextRow);
		guestTextRow.appendChild(guestNameSpan);
		guestNameSpan.innerText= guestName;
		guestTextRow.appendChild(messageDateSpan);
		messageDateSpan.innerText= currentDate+"  "+currentTime;
		guestText.appendChild(guestTextRow2);
		guestTextRow2.appendChild(guestMessageSpan);
		guestMessageSpan.innerText= message;
		
		document.body.appendChild(guestText);
		
        const element = document.getElementsByClassName('guest-book-databox')[0];
        element.insertAdjacentElement('afterend', guestText);
	}
}

//카카오지도 검색 키워드 입력
	// 전역 변수로 카카오맵 객체를 선언합니다.
var map;

//카카오맵을 그리는 함수입니다.
function writeKakaoMap(targetData) {

    // 새로운 카카오맵 객체를 생성합니다.
    var inputData = [targetData];

    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.54699, 127.09598),
            level: 4
        };
    map = new kakao.maps.Map(mapContainer, mapOption);
    var count = 0;
    var ps = new kakao.maps.services.Places();
    var bounds = new kakao.maps.LatLngBounds();

    // 기존에 그려진 마커 객체를 저장할 변수
    var marker;

    if (inputData != null) {
        kewwordSearch(inputData[count]);
    }

    function kewwordSearch(keword) {
        ps.keywordSearch(keword, placesSearchCB);
        count = count + 1;
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 기존에 그려진 마커 객체가 있으면 삭제합니다.
            if (marker) {
                marker.setMap(null);
            }

            // 새로운 위치에 마커를 그려줍니다.
            marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(data[0].y, data[0].x),
            });

            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
            if (count < inputData.length) {
                kewwordSearch(inputData[count]);
            } else if (count == inputData.length) {
                setBounds();
            }
        }
    }

    function setBounds() {
        map.setBounds(bounds, 90, 30, 10, 30);
    }
}


const target = document.querySelector('.location-info-flex > div:nth-child(1) > p:nth-of-type(1)');

//observer 생성
const observer = new MutationObserver(mutations => {
mutations.forEach(mutation => {
 if (mutation.type === 'childList') {
	 const str = target.innerText;
	 const lastSpaceIndex = str.lastIndexOf(' '); // 마지막 공백의 인덱스를 찾음
	 const result = str.substring(0, lastSpaceIndex); // 처음부터 마지막 공백 전까지의 부분 문자열을 반환
  	 writeKakaoMap(result);
 }
});
});

//observer 설정
const config = { childList: true, subtree: true };
observer.observe(target, config);


</script>
</html>