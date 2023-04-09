let jsonString = '';

function serverCallByRequest(jobCode, methodType, clientData){
	const form = createForm("", jobCode, methodType);
	
	if(clientData != '' && clientData != null){
		for(let idx=0;idx<clientData.length;idx++){
			form.appendChild(createInputBox('hidden', clientData[idx][0], clientData[idx][1], ''));
			console.log(clientData[idx][0] + " & " + clientData[idx][1]);
		}
	}
	if(sessionStorage.JWT) form.appendChild(createInputBox('hidden', "BonheurJWT", sessionStorage.JWT, ''));
	document.body.appendChild(form);
	form.submit();
}

function serverCallByFetchAjax(formData, jobCode, methodType, callBackFunc){
	
    if(sessionStorage.JWT) formData.append("BonheurJWT", sessionStorage.JWT);
	fetch(jobCode, {
  	method: methodType,
  	/*
    headers: {
    	'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams(formData)
    */
    body:formData
  }).then(res => {	
			if(res.headers.get("BonheurJWT") != null){
				let jwt = res.headers.get("BonheurJWT");
				if( jwt != '') {
					sessionStorage.setItem('JWT', jwt);
					//var xhr = new XMLHttpRequest();
					//xhr.open('GET', '/api/data', true);
					
					//xhr.onreadystatechange = function() {
					  //if (xhr.readyState === 4 && xhr.status === 200) {
					   // var responseData = xhr.responseText;
					    // 응답 헤더에 새로운 데이터 추가
					   // xhr.setRequestHeader('BonheurJWT', jwt);
					    //console.log(responseData);
						 // }
						//};
			
						//xhr.send();
				}
			}
			return res.json();
		})
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			window[callBackFunc]('error');
		})
}



function serverCallByFetchAjax22(formData, jobCode, methodType, callBackFunc){
	
	fetch(jobCode, {
  	method: methodType,
  	/*
    headers: {
    	'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams(formData)
    */
    body:formData
  }).then(res => {	
			if(res.headers.get("BonheurJWT") != null){
				const jwt = res.headers.get("BonheurJWT");
				if( jwt != '') sessionStorage.setItem('JWT', jwt);
			}
			return res.json();
		})
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			window[callBackFunc]('error');
		})
}

function serverCallByFetchAjaxUsingJson(jsonString, jobCode, methodType, callBackFunc){
	
	fetch(jobCode, {
  	method: methodType,
  	headers:{
			'Content-Type' : 'application/json'
		},
    body:jsonString
  }).then(response => response.json())
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			window[callBackFunc]('error');
		})
}

/* JWT 사용한 서버 요청 */
function serverCallByFetch(formData, jobCode, methodType, callBackFunc, header){
	
	fetch(jobCode, {
  	method: methodType,
    headers: header,
    body:formData
  }).then(res => {	
			if(res.headers.get("BonheurJWT") != null){
				const jwt = res.headers.get("BonheurJWT");
				if( jwt != '') sessionStorage.setItem('JWT', jwt);
			}
			return res.json();
		})
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => {
			console.log(error);
			window[callBackFunc]('error');
		})
}

/* FORM 생성 */
function createForm(name, action, method){
	const form = document.createElement("form");
	if(name != "") form.setAttribute("name", name);
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	return form;
}

function createText(type, contents, isInline){
    let text = document.createElement("p");
    if(type==1){
        text.setAttribute("id","title");
        text.setAttribute("class","kor Bold");
    }else if(type==2){
        text.setAttribute("id","sub-title");
        text.setAttribute("class","kor Bold");
    }else if(type==3){
        text.setAttribute("id","sub-title");
        text.setAttribute("class","kor Regular");
    }else if(type==4){
        text.setAttribute("id","title");
        text.setAttribute("class","eng Bold");
    }else if(type==5){
        text.setAttribute("id","sub-title");
        text.setAttribute("class","eng Bold");
    }else if(type==6){
        text.setAttribute("id","sub-title");
        text.setAttribute("class","eng Regular");
    }

    text.innerHTML = contents;

    if(isInline) text.style.display="inline-block";

    return text;
}

/* 서버로 전송할 데이터 길이의 유효성 판단 */
function lengthCheck(obj){
	
	const dataLength =[ ["memberName",2,5], ["memberPhone",10,11], ["memberPassword", 8, 20], ["newPassInput", 8, 20]];
	let result = false;
	
	for(let recordIdx=0; recordIdx<dataLength.length; recordIdx++){
		if(obj.getAttribute("name") == dataLength[recordIdx][0]){
			if(obj.value.length >= dataLength[recordIdx][1] && obj.value.length <= dataLength[recordIdx][2]){
				result = true;
			} 	
		}
	}

	return result;

}

/* div 생성 */
function createDiv(objId, className, funcName, innerText, width, isInline){
	const div = document.createElement("div");
	if(objId != '') div.setAttribute("id", objId);
	if(className != '') div.setAttribute("class", className);
	if(funcName != '') div.setAttribute("onClick", funcName);
	if(innerText != '') div.innerText = innerText;
    if(width != '') div.setAttribute("width", width);
    if(isInline) div.style.display = "inline-block";
	return div;
}

/* Input Box 생성*/
function createInputBox(type, name, value, placeholder, guideNum){
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if(value != "") input.setAttribute("value", value);
	if(placeholder != "") input.setAttribute("placeholder", placeholder);
    if(guideNum != ""){
        if(guideNum == 1){
            input.setAttribute("class","input-box input-box-sm");
        }else if(guideNum == 2){
            input.setAttribute("class","input-box input-box-md");
        }else if(guideNum == 3){
            input.setAttribute("class","input-box input-box-lg");
        }else if(guideNum == 4){
            input.setAttribute("class","input-box input-box-st");
        }else if(guideNum == 5){
            input.setAttribute("class","input-box input-box-est");
        }
    }
	return input;
}

/* button 생성 */
function createButton(innerText, funcName, guideNum){
    const button = document.createElement("button");
    if(innerText != '') button.innerText = innerText;
    if(funcName != '') button.setAttribute("onClick", funcName);
    if(guideNum != ''){
        if(guideNum == 1){
            button.setAttribute("class","btn btn-outline-primary btn-produce-sm kor");
        }else if(guideNum == 2){
            button.setAttribute("class","btn btn-primary btn-produce-sm kor");
        }else if(guideNum == 3){
            button.setAttribute("class","btn btn-outline-primary btn-produce-md kor");
        }else if(guideNum == 4){
            button.setAttribute("class","btn btn-primary btn-produce-md kor");
        }else if(guideNum == 5){
            button.setAttribute("class","btn btn-primary btn-next kor");
        }else if(guideNum == 6){
            button.setAttribute("class","btn btn-outline-primary btn-move kor");
        }else if(guideNum == 7){
            button.setAttribute("class","btn btn-primary btn-xs kor");
        }else if(guideNum == 8){
            button.setAttribute("class","btn btn-outline-primary btn-xs kor");
        }else if(guideNum == 9){
            button.setAttribute("class","btn btn-primary");
            button.setAttribute("data-bs-toggle","modal");
            button.setAttribute("data-bs-target","#greetSampleModal");
        }
    }
	return button;
}

/* img 박스 생성 */
function createImgBox(alt, src, funcName, guideNum) {
    const img = document.createElement("img");
	if(alt != '') img.setAttribute("alt", alt);
    if(src != '') img.setAttribute("src", src);
	if(funcName != '') img.setAttribute("onClick", funcName);
    if(guideNum == 1){
        img.setAttribute("class","rounded img-box-1");
    }else if(guideNum == 2){
        img.setAttribute("class","rounded img-box-2");
    }else if(guideNum == 3){
        img.setAttribute("class","rounded img-box-3");
    }
	return img;

}

/* 라디오 버튼 생성 */
function createRadio(Num, id, name, className, innerText){
    const div = createDiv("","","","","",true);
    for(let i=0; i<Num; i++){
        const radio = createInputBox("radio",name,id+(i+1),"","");
        radio.setAttribute("id", id+(i+1));
        radio.setAttribute("class", "form-check-input margin10");
        radio.setAttribute("onchange", "useable()");
        if(i==0) radio.setAttribute("checked",true);
        const label = document.createElement("label");
        label.setAttribute("class", className+" form-check-label");
        //label.classList.add("form-check-label");
        label.setAttribute("for",id+(i+1));
        label.setAttribute("onchange", "useable()");
        label.innerText = innerText[i];
        div.appendChild(radio);
        div.appendChild(label);
    }
    return div;
}

function createHr(){
    let hr = document.createElement("hr");
    return hr;
}

function createMg(){
    let mg = document.createTextNode("  ");
    return mg;
}

function createBr(){
    let br = document.createElement("br");
    return br;
}

function tokenCheck(){
	if (sessionStorage.JWT){
		document.getElementsByName("in")[0].hidden = true;
		document.getElementsByName("out")[0].hidden = false;
	}else if (!sessionStorage.JWT){
		document.getElementsByName("in")[0].hidden = false;
		document.getElementsByName("out")[0].hidden = true;
	}
}
function logout(){
	sessionStorage.removeItem('JWT');
	serverCallByRequest("/Logout", "post", "");
}