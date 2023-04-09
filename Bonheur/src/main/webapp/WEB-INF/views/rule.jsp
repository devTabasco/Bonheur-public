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
<h2>이용약관</h2>
<hr style="color: #0069D9">

<br /><strong>제1조(목적)</strong><br />
<p>본 회원약관은 보네르(이하 '갑'라 한다)가 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.</p><br />

<strong>제2조 (약관의 효력)</strong><br />
1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.<br />
2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br />
3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.<br /><br />

<strong>제3조 (약관 이외의 준칙)</strong><br />
이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.<br /><br />

<strong>제4조 (이용계약의 체결)</strong><br />
회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.<br /><br />

<strong>제5조 (용어의 정의)</strong><br />
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br />
1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자<br />
2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합<br />
3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합<br /><br />

<strong>제6조 (이용신청)</strong><br />
1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.<br />
2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.<br /><br />

<strong>제7조 (회원가입의 승낙)</strong><br />
'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.<br /><br />

<strong>제8조(회원가입 신청거절 및 강제 탈퇴)</strong><br />
1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.<br />
2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.<br />
<br />
<strong>제9조 (서비스 제공의 중지)</strong><br />
'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다<br />
1.설비의 보수 등을 위하여 부득이한 경우<br />
2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우<br />
3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.<br /><br />

<strong>제10조 ('갑'의 의무)</strong><br />
1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.<br />
2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.<br /><br />

<strong>제11조 (개인정보보호)</strong><br />
1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. <br /><br />
2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다.<br />
 ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  <br />
 ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우<br />
 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우<br />
 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br /><br />
3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.<br /><br />

<strong>제12조 (회원의 의무)</strong><br />
1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.<br />
2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br />
3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.<br />
4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.<br />
5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. <br /><br />
  ①다른 회원의 아이디(ID)를 부정 사용하는 행위<br />
  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br />
  ③선량한 풍속, 기타 사회질서를 해하는 행위<br />
  ④타인의 명예를 훼손하거나 모욕하는 행위<br />
  ⑤타인의 지적재산권 등의 권리를 침해하는 행위<br />
  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위<br />
  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위<br />
  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위<br />
  ⑨기타 관계법령에 위배되는 행위<br />
  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위<br /><br />

<strong>제13조 (게시물 또는 내용물의 삭제)</strong><br />
'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.<br /><br />

<strong>제14조 (게시물에 대한 권리·의무)</strong><br />
게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.<br /><br />

<strong>제15조 (양도금지)</strong><br />
회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br />
<br />

<strong>제16조 (계약해지 및 이용제한)</strong><br />
1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.<br />
2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.<br />
<br />

<strong>제17조 (면책·배상)</strong><br />
1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.<br />
2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. <br />
3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br />
4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.<br />
<br />

<strong>제18조 (분쟁의 해결)</strong><br />
1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br />
2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.<br /><br />


<strong>부  칙</strong><br />
제 1 조 (시행일) 이 약관은 2023년 03월 01일부터 시행한다.<br /> <br />
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