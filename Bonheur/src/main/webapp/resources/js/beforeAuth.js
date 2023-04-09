/**
 * 
 */
 
 function accessCtl(){
	const memberEmail = document.getElementsByName('memberEmail')[0];
	const memberPassword = document.getElementsByName('memberPassword')[0];
	
	//for(let idx=0; idx<userData.length; idx++){
	//	isSubmit = lengthCheck(userData[idx])
	//	if(!isSubmit)	{
	//		userData[idx].value = "";
	//		userData[idx].setAttribute("placeholder", message[idx][0]);
	//		userData[idx].focus();
	//		break;
	//	}
	//}
	
	//if(isSubmit){
		let formData = new FormData();
	//	for(let idx=0;idx<userData.length; idx++){
			formData.append(memberEmail.name, memberEmail.value);
			formData.append(memberPassword.name, memberPassword.value);
	//	}
		serverCallByFetchAjax(formData, 'IssuanceJWT', 'post', 'afterAuth');
	//}
}

/* JWT를 전달 받았을 경우 JWT로 로그인 요청 */
function afterAuth(jsonData){
	console.log(jsonData);
	//console.log(sessionStorage.JWT);
	let isReaccess = false;
	if(sessionStorage.JWT){
		if(jsonData == true){
			const clientData = [["BonheurJWT", sessionStorage.JWT]];
			console.log(clientData);
			serverCallByRequest('View/Access', 'post', clientData);
			console.log(sessionStorage.JWT);
		}else{
			sessionStorage.removeItem('JWT');
			isReaccess = true;
		}
	}else isReaccess = true;
	
	/* 재 로그인이 필요한 경우 */
	if(isReaccess){
		//for(let idx=0; idx<userData.length; idx++){
			//userData[idx].value = '';		
			document.getElementsByName('memberEmail')[0].value = '';
			document.getElementsByName('memberPassword')[0].value = '';
		//}
		//userData[idx].focus();
	}
	
}