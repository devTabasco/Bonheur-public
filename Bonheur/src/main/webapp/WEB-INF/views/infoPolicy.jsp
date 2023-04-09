<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>

<style>

</style>

<body class="kor">

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

 <div style="width: 100%; height: 50%; background-color: #ffe69c;">
 	
 </div>
 
<div style="width: 800px; margin: auto; padding-top: 100px; padding-bottom: 100px;">

<h2>개인정보 처리방침</h2><br />
보네르는 고객님들의 소중한 개인정보 보호를 위해 아래와 같은 방침을 수행하고 있습니다.<br />
<hr style="color: #0069D9;">

<br /><b>1. 개인정보의 처리 목적</b><br /><br />
<(주)보네르>(‘www.Bonheur.com’이하 ‘보네르’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br /><br />

고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등<br /><br />

<br /><b>2. 개인정보의 처리 및 보유 기간</b><br /><br />
1. ‘보네르’는 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br />
2. 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br />
- 고객 가입 및 관리 : 카카오싱크를 통한 회원가입 및 카카오채널을 통한 관리<br />
- 보유 기간 : 카카오채널 탈퇴 시, 즉시 삭제<br /><br />

<br /><b>3. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</b><br /><br />
정보주체는 ‘보네르’ 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br /><br />
1. 개인정보 열람요구<br />
2. 오류 등이 있을 경우 정정 요구<br />
3. 삭제요구<br />
4. 처리정지 요구<br /><br />

<br /><b>4. 처리하는 개인정보의 항목 작성</b><br /><br />
‘보네르’는 다음의 개인정보 항목을 처리하고 있습니다.<br /><br />

<‘보네르’에서 수집하는 개인정보 항목><br />
‘보네르’ 회원 가입 및 고객 문의 시, 제공 동의를 해주시는 개인정보 수집 항목입니다.<br /><br />

회원 가입 시(회원)<br />
- 필수항목 : 이름, 이메일, 전화번호, 성별, 연령대<br />
- 선택항목 : 생년월일<br />
- 수집목적 : 보네르 회원관리 및 마케팅 이용<br />
- 보유기간 : 회원 탈퇴 또는 동의철회 시 지체없이 파기<br /><br />
고객 문의 시(비회원)<br />
- 필수항목 : 문의종류, 이름, 휴대폰번호, 이메일, 문의사항<br />
- 수집목적 : 고객문의 및 상담요청에 대한 회신, 상담을 위한 서비스 이용기록 조회<br />
- 보유기간 : 문의 접수 후 2년 간 보관 (단, 관계 법령이 정한 시점까지 보존)<br /><br />

<카카오 개인정보 제3자 제공 동의><br />
아래는 ‘보네르’ 회원 가입 시(카카오 계정을 통한 간편 가입시) 제공 동의를 해주시는 자동 수집 항목입니다.<br /><br />

- 필수항목 : 프로필 정보(닉네임/프로필 사진), 카카오계정(이메일), 카카오계정(전화번호), 성별, 연령대, 카카오톡 채널 추가 상태 및 내역<br />
- 선택항목 : 생일, 출생연도<br />
- 수집목적 : 보네르 카카오채널을 통한 회원관리 및 마케팅 이용<br />
- 보유기간 : 카카오채널 탈퇴 또는 동의철회 시 지체없이 파기<br /><br />

‘보네르’는 만 14세 미만 아동의 개인정보를 보호하기 위하여 회원가입은 만14세 이상만 가능하도록 함으로써 아동의 개인정보를 수집하지 않습니다.<br /><br />

<br /><b>5. 개인정보의 파기</b><br /><br />
‘보네르’는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.’<br /><br />

파기절차<br />
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 
일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br /><br />
파기기한<br />
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 
그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br /><br />

<br /><b>6. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항</b><br /><br />
1. ‘보네르’는 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br />
2. 쿠키는 웹사이트를 운영하는데 이용되는 서버(https)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.<br /><br />
가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br />
나. 쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br />
다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br /><br />

<br /><b>7. 개인정보 보호책임자 작성</b><br /><br />
1. ‘보네르’는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br /><br />
개인정보 보호책임자<br />
성명 : 임창용<br />
직책 : 대표<br />
직급 : CEO<br />
연락처 : 1234-5678, dragon@gmail.com<br />
※ 개인정보 보호 담당부서로 연결됩니다.<br /><br />

개인정보 보호 담당부서<br />
부서명 : 마케팅팀<br />
담당자 : 윤지수<br />
연락처 :1004-8282, icia4@gmail.com<br /><br />

2. ‘보네르’의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다.
‘보네르’는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br /><br />

<br /><b>8. 개인정보 처리방침 변경</b><br /><br />
이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br /><br />

<br /><b>9. 개인정보의 안전성 확보 조치</b><br /><br />
‘보네르’는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br /><br />
1. 개인정보 취급 직원의 최소화 및 교육<br />
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br /><br />
2. 해킹 등에 대비한 기술적 대책<br />
‘보네르’는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.<br /><br />
3. 개인정보의 암호화<br />
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br /><br />
4. 접속기록의 보관 및 위변조 방지<br />
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.<br /><br />
5. 개인정보에 대한 접근 제한<br />
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br /><br />

<br /><b>10. 정보주체의 권익침해에 대한 구제방법</b><br /><br />
아래의 기관은 (주)Changyong Company 와는 별개의 기관으로서, ‘보네르’의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.<br /><br />

<br /><b>개인정보 침해신고센터 (한국인터넷진흥원 운영)</b><br />
- 소관업무 : 개인정보 침해사실 신고, 상담 신청<br />
- 홈페이지 : privacy.kisa.or.kr<br />
- 전화 : (국번없이) 118<br />
- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터<br /><br />

<b>개인정보 분쟁조정위원회</b><br />
- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br />
- 홈페이지 : www.kopico.go.kr<br />
- 전화 : (국번없이) 1833-6972<br />
- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층<br /><br />

<br /><b>대검찰청 사이버범죄수사단</b><br />
02-3480-3573 (www.spo.go.kr)<br /><br />

<b>경찰청 사이버안전국</b><br />
182 (http://cyberbureau.police.go.kr)<br /><br />

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
</body>
</html>