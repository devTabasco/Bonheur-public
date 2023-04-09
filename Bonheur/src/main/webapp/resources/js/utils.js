/**
 * 
 */
 
 function qrCode(){
	//id가 qrcode인 div가 있을 때
	let qrcode = new QRCode(document.getElementById("qrcode"), {
        text: "http://naver.com",
        width: 128,
        height: 128,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H //qr코드 오류복원능력임 (L->M->Q->H)
    });
}

