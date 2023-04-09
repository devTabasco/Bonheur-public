  
        function basicInfo(){
        //function createDiv(objId, className, funcName, innerText, width, isInline)
        //function createText(type, contents, isInline)
        //function createInputBox(type, name, value, placeholder, guideNum)
        //function createButton(innerText, funcName, guideNum)
        //function createRadioBtn(innerText,  guideNum, isInline)
        //function createRadio(Num, id, name, className, innerText)
        let box2 = createDiv("","innerContents","","","");

        let row2 = createDiv("","row","","","");
        let col3 = createDiv("","col-md-2","","");
        let col4 = createDiv("","col-md-10","","");

        let row3 = createDiv("","row","","","");
        let col5 = createDiv("","col-md-2","","");
        let col6 = createDiv("","col-md-10","","");

        let row4 = createDiv("","row","","","");
        let col7 = createDiv("","col-md-2","","");
        let col8 = createDiv("","col-md-10","","");

        let row5 = createDiv("","row","","","");
        let col9 = createDiv("","col-md-2","","");
        let col10 = createDiv("","col-md-10","","");
        
        let row6 = createDiv("","row","","","");
        let col11 = createDiv("","col-md-6","","");
        let col12 = createDiv("","col-md-6","","");

        let subTitleBox2 = createDiv("","sub-title-box","","");
        let subContentsBox2 = createDiv("","sub-contents-box","","");
                
        let title2 = createText(1,"기본정보",false)
        let hr2 = createHr();

        let sub4 = createText(2,"초대장 url",false);
        let con41 = createText(3,"https://www.bonheur.com/m/",false);
        let con42 = createInputBox("text","invitationURL","","",2);
        con42.style.margin='0 0 0 15px';
        col3.appendChild(sub4);
        col4.appendChild(con41);
        col4.appendChild(con42);
        col4.style.display = 'flex';
        row2.appendChild(col3);
        row2.appendChild(col4);
        row2.style.marginBottom="30px";

        let sub5 = createText(2,"초대장 제목",false);
        let con5 = createInputBox("text","invitationTitle","","정기총회 및 신년 인사회에 초대합니다.",3);
        con5.setAttribute("onblur", "updateInvitationTitle()");
        col5.appendChild(sub5);
        col6.appendChild(con5);
        row3.appendChild(col5);
        row3.appendChild(col6);
        row3.style.marginBottom="30px";
        
        let conM = createDiv("greetSampleModal", "modal fade", "", "", "", "");
        conM.setAttribute("tabindex",-1);
        conM.setAttribute("aria-labelledby", "exampleModalLabel");
        conM.setAttribute("aria-hidden", "true");
        let conM2 = createDiv("", "modal-dialog", "", "", "");
        let conM3 = createDiv("", "modal-content", "", "", "");
        let conM4 = createDiv("", "modal-header", "", "", "");
        let h1 = createText(2,"인사말",false);
        h1.setAttribute("class", "modal-title fs-5");
        h1.setAttribute("id", "exampleModalLabel");
        h1.innerText="인사말";
        let btn = createButton("", "", "");
        btn.setAttribute("type", "button");
        btn.setAttribute("class", "btn-close");
        btn.setAttribute("data-bs-dismiss", "modal");
        btn.setAttribute("aria-label", "Close");
        conM4.appendChild(h1);
        conM4.appendChild(btn);
        let conM5 = createDiv("", "modal-body", "", "", "");
        let p1 = createText(2,"인사말을 선택해주세요",false);
        conM5.appendChild(p1);
        
        let ex1 = createDiv("", "greetSample", "", "금년 한해를 결산하고 2023년 새롭게 출발하는 정기총회 및 신년인사회를 개최합니다. 바쁘신 중에도 부디 참석하시어 자리를 빛내주시기 바라며, 새해를 맞아 늘 건승하시길 기원합니다.", "","");
        let br1 = document.createElement("br");
        ex1.appendChild(br1);
        let btn2 = createButton("선택하기","changeTextArea(1)", 7);
        btn2.style.marginLeft="350px";
        ex1.appendChild(btn2);
        
        let ex2 = createDiv("", "greetSample", "", "친애하는 여러분, [이름]입니다. 오늘은 저희의 [행사명]을 위해 여러분을 초대하게 되어 매우 기쁩니다. 이 자리에서 여러분과 함께하게 된다는 것이 정말 큰 영광입니다. 함께 즐거운 시간을 보내기를 기대합니다.", "","");
        br1 = document.createElement("br");
        ex2.appendChild(br1);
        btn2 = createButton("선택하기","changeTextArea(2)", 7);
        btn2.style.marginLeft="350px";
        ex2.appendChild(btn2);        
        let ex3 = createDiv("", "greetSample", "", "안녕하세요, [행사명]를 준비하게 된 [이름]입니다. 오늘은 저희의 소중한 시간을 함께 나눌 수 있는 기회가 있어 매우 기쁩니다. 여러분의 참석으로 인해 이 행사가 더욱 의미 있는 시간이 되기를 기대합니다.", "","");
        br1 = document.createElement("br");
        ex3.appendChild(br1);
        btn2 = createButton("선택하기","changeTextArea(3)", 7);
        btn2.style.marginLeft="350px";
        ex3.appendChild(btn2);
        
        let ex4 = createDiv("", "greetSample", "", "친애하는 여러분, 오늘은 저희 [이름]의 [행사명]에 초대하게 되어 매우 기쁩니다. 여러분들과 함께하는 이 순간은 항상 저에게 특별한 순간이 됩니다. 이 자리에서 여러분과 함께 새로운 추억을 만들어가길 기대합니다.", "","");
        br1 = document.createElement("br");
        ex4.appendChild(br1);
        btn2 = createButton("선택하기","changeTextArea(4)", 7);
        btn2.style.marginLeft="350px";
        ex4.appendChild(btn2);
        
        let ex5 = createDiv("", "greetSample", "", "안녕하세요, [행사명]에 참석하시는 여러분들께 진심으로 감사의 말씀을 드리고 싶습니다. 오늘은 저희의 소중한 시간을 함께 나누는 특별한 날입니다. 여러분들과 함께하는 이 순간을 정말 소중하게 여깁니다.", "","");
        br1 = document.createElement("br");
        ex5.appendChild(br1);
        btn2 = createButton("선택하기","changeTextArea(5)", 7);
        btn2.style.marginLeft="350px";
        ex5.appendChild(btn2);
        
        conM5.appendChild(ex1);
        conM5.appendChild(ex2);
        conM5.appendChild(ex3);
        conM5.appendChild(ex4);
        conM5.appendChild(ex5);
        let conM6 = createDiv("", "modal-footer", "", "", "");
        
        conM.appendChild(conM2);
        conM2.appendChild(conM3);
        conM3.appendChild(conM4);
        conM3.appendChild(conM5);
        conM3.appendChild(conM6);

        let sub6 = createText(2,"인사말",false);
        let con6 = createButton("인사말 샘플 선택","", 9);
        con6.style.display="block";
        con6.style.marginBottom="15px";
        let con7 = document.createElement("textarea");
        con7.setAttribute("class", "input-box input-box-b");
        con7.setAttribute("name", "greetingMessage");
        con7.setAttribute("onblur","updateInvitationTitle()");
        con7.setAttribute("id", "greetTextarea");
        con7.innerHTML = "금년 한해를 결산하고 2023년 새롭게 출발하는 정기총회 및 신년인사회를 개최합니다. 바쁘신 중에도 부디 참석하시어 자리를 빛내주시기 바라며, 새해를 맞아 늘 건승하시길 기원합니다.";
        col7.appendChild(sub6);
        col8.appendChild(con6);
        col8.appendChild(con7);
        row4.appendChild(col7);
        row4.appendChild(col8);
        row4.appendChild(conM);
        row4.style.marginBottom="30px";

        let sub7 = createText(2,"방명록 기능",false);
        let con8 = createRadio(2, "guestbookUseable", "guestbookUseable", "margin10", ["사용함","사용안함"]);
        con8.style.margin='0 0 0 auto';
        col9.appendChild(sub7);
        col10.appendChild(con8);
        row5.appendChild(col9);
        row5.appendChild(col10);
        row5.style.marginBottom="30px";

        let con9 = createDiv("","","","","");
        let sub8 = createText(2,"썸네일 이미지",false);
        sub8.style.marginRight="20px";
        let sub9 = createText(2,"대표 이미지",false);
        sub9.style.marginRight="20px";
        
        let form = document.createElement("form");
        form.setAttribute("id", "thumbNail");
        let input = createInputBox("file", "thumbNailImage", "", "", "");
        input.setAttribute("id", "input-file")
        input.style.display="none";
        input.setAttribute("onchange", "readURL(this,"+ 10 +" );")
        let con10 = createDiv("","","","","");
        con10.setAttribute("id", "preview")
        con10.setAttribute("class", "preview1")
        let btn3 = createButton("", "", "");
        btn3.setAttribute("type", "button");
        btn3.setAttribute("onclick", "readURL(this,"+10+");");
        btn3.classList.add("btn-close", "img-x");
        btn3.setAttribute("aria-label", "Close");
        btn3.style.marginLeft="120px";
        btn3.style.marginTop="5px";
        btn3.style.display="none";
        con10.appendChild(btn3);
        let label = document.createElement("label");
        label.setAttribute("class", "input-file-button");
        label.setAttribute("for", "input-file");
        let p = createText("", "업로드", "");
        label.appendChild(p);
        label.style.lineHight="30px";
        
        form.appendChild(input);
        form.appendChild(con10);
        form.appendChild(label);
        
        let form2 = document.createElement("form");
        form2.setAttribute("id", "main");
        let input2 = createInputBox("file", "mainImage", "", "", "");
        input2.setAttribute("id", "input-file2")
        input2.style.display="none";
        input2.setAttribute("onchange", "readURL(this,"+11+");")
        let con11 = createDiv("","","","","");
        con11.setAttribute("id", "preview")
        con11.setAttribute("class", "preview2")
        let btn4 = createButton("", "", "");
        btn4.setAttribute("type", "button");
        btn4.setAttribute("onclick", "readURL(this,"+11+");");
        btn4.classList.add("btn-close", "img-x");
        btn4.setAttribute("aria-label", "Close");
        btn4.style.marginLeft="120px";
        btn4.style.marginTop="5px";
        btn4.style.display="none";
        con11.appendChild(btn4);
        let label2 = document.createElement("label");
        label2.setAttribute("class", "input-file-button");
        label2.setAttribute("for", "input-file2");
        let p2 = createText("", "업로드", "");
        label2.appendChild(p2);
        label2.style.lineHight="30px";
        
        form2.appendChild(input2);
        form2.appendChild(con11);
        form2.appendChild(label2);
        
        col11.appendChild(sub8);
        col11.appendChild(form);
        col12.appendChild(sub9);
        col12.appendChild(form2);
        
        col11.style.display="flex";
        col12.style.display="flex";
        
        con9.appendChild(col11);
        con9.appendChild(col12);
        con9.style.display="flex";

        box2.appendChild(title2);
        box2.appendChild(hr2);
        
        row2.appendChild(col3);
        row2.appendChild(col4);
        row3.appendChild(col5);
        row3.appendChild(col6);
        row4.appendChild(col7);
        row4.appendChild(col8);
        row5.appendChild(col9);
        row5.appendChild(col10);
        row6.appendChild(col11);
        row6.appendChild(col12);
        
        box2.appendChild(row2);
        box2.appendChild(row3);
        box2.appendChild(row4);
        box2.appendChild(row5);
        box2.appendChild(row6);
        box2.appendChild(subTitleBox2);
        box2.appendChild(subContentsBox2);

        document.body.appendChild(box2);

        const element = document.getElementById('step1');
        //부모.insertBefor(어떤걸?, 어디앞에(//contents-right 마지막 요소)) 
        element.insertBefore(box2, document.getElementById('step1').children[1]);
}

		/* 기본정보 이미지 업로드 */
		function readURL(input, index) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					let urlLink = e.target.result;
					//document.getElementById('preview').src = e.target.result;
					if(index == 10){
						document.getElementsByName('thumbNailImage')[1].value = urlLink;
						document.getElementsByClassName('preview1')[0].style.backgroundImage = "url('" + urlLink + "')";
					}else{
						document.getElementsByName('mainImage')[1].value = urlLink;
						document.getElementsByClassName('preview2')[0].style.backgroundImage = "url('" + urlLink + "')";						
					}
				};
					if(index == 10){
						reader.readAsDataURL(input.files[0]);
						document.getElementsByTagName('form')[0].reset();
						document.getElementsByClassName('img-x')[0].style.display = "block";
					}else{
						reader.readAsDataURL(input.files[0]);
						document.getElementsByTagName('form')[0].reset();
						document.getElementsByClassName('img-x')[1].style.display = "block";
					}
		
			} else {
				if(index == 10){
					document.getElementsByClassName('preview1')[0].style.backgroundImage = "";
					document.getElementsByClassName('img-x')[0].style.display = "none"

				}else{
					document.getElementsByClassName('preview2')[0].style.backgroundImage = "";
					document.getElementsByClassName('img-x')[1].style.display = "none"
				}
			}
		}

        function changeTextArea(idx) {
  			const element = document.getElementById('greetTextarea');
  			if(idx == 1) {
				element.innerHTML = "금년 한해를 결산하고 2023년 새롭게 출발하는 정기총회 및 신년인사회를 개최합니다. 바쁘신 중에도 부디 참석하시어 자리를 빛내주시기 바라며, 새해를 맞아 늘 건승하시길 기원합니다.";
			}else if(idx == 2) {
				element.innerHTML = "친애하는 여러분, [이름]입니다. 오늘은 저희의 [행사명]을 위해 여러분을 초대하게 되어 매우 기쁩니다. 이 자리에서 여러분과 함께하게 된다는 것이 정말 큰 영광입니다. 함께 즐거운 시간을 보내기를 기대합니다.";
			}else if(idx == 3) {
				element.innerHTML = "안녕하세요, [행사명]를 준비하게 된 [이름]입니다. 오늘은 저희의 소중한 시간을 함께 나눌 수 있는 기회가 있어 매우 기쁩니다. 여러분의 참석으로 인해 이 행사가 더욱 의미 있는 시간이 되기를 기대합니다";
			}else if(idx == 4) {
				element.innerHTML = "친애하는 여러분, 오늘은 저희 [이름]의 [행사명]에 초대하게 되어 매우 기쁩니다. 여러분들과 함께하는 이 순간은 항상 저에게 특별한 순간이 됩니다. 이 자리에서 여러분과 함께 새로운 추억을 만들어가길 기대합니다.";
			}else if(idx == 5) {
				element.innerHTML = "안녕하세요, [행사명]에 참석하시는 여러분들께 진심으로 감사의 말씀을 드리고 싶습니다. 오늘은 저희의 소중한 시간을 함께 나누는 특별한 날입니다. 여러분들과 함께하는 이 순간을 정말 소중하게 여깁니다.";
			}
		}

function hostInfo(){
        //function createDiv(objId, className, funcName, innerText, width, isInline)
        //function createText(type, contents, isInline)
        //function createInputBox(type, name, value, placeholder, guideNum)
        //function createButton(innerText, guideNum)
        //function createRadioBtn(innerText,  guideNum, isInline)
        //function createRadio(Num, id, name, className, innerText)
        let box = createDiv("","innerContents","","","","");
        let contents = createDiv("","contents","","","","");
        let row1 = createDiv("","row","","","","");
        let col8 = createDiv("","col-md-8","","","","");
        let col4 = createDiv("","col-md-4","","","","");
        let subContentsBox = createDiv("","sub-contents-box","","");

        let title = createText(1,"호스트 정보",true);
        title.style.marginBottom='0';
        let hr = createHr();
        let radioBtn = createRadio(2, "hostUseable", "hostUseable", "margin10", ["사용함","사용안함"]);
        radioBtn.style.margin='0 0 0 auto';
        
        let sel1 = document.createElement('select');
        sel1.setAttribute("class", "form-select hostType");
        sel1.setAttribute("aria-label", "Default select example");
        sel1.setAttribute("onchange", "disableSelect()");
        let opt1 = document.createElement('option');
        opt1.setAttribute("selected", "selected");
        opt1.innerText='주최';
        let opt2 = document.createElement('option');
        opt2.setAttribute("value", "주최자");
        opt2.innerText='주최자';
        let opt3 = document.createElement('option');
        opt3.setAttribute("value", "직접입력");
        opt3.innerText='직접입력';
        let opt4 = document.createElement('option');
        opt4.setAttribute("value", "입력안함");
        opt4.innerText='입력안함';
        let inp1 = document.createElement('input');
        inp1.setAttribute("id", "hostType");
        inp1.setAttribute("class", "input-box input-box-st");
        inp1.setAttribute("placeholder", "관계");
        inp1.setAttribute("hidden", "");
        inp1.style.width="70px";
        inp1.style.marginRight="10px";
        
        sel1.appendChild(opt1);
        sel1.appendChild(opt2);
        sel1.appendChild(opt3);
        sel1.appendChild(opt4);
        sel1.style.height='35px';
        
        let con1 = createInputBox("text","hostName","","이름",2);
        con1.setAttribute("onblur","updateInvitationTitle()");
        let con3 = createInputBox("text","hostCheckInput","+82","",5);
        con3.style.backgroundColor='rgba(195, 195, 210, 0.5)';
        con3.readOnly='true';
        let con5 = createInputBox("text","hostPhoneNumber",""," '"+"-"+"'"+"없이 번호만 입력하세요",2);
        con5.setAttribute("onblur","updateInvitationTitle()");
        
        sel1.style.marginRight='10px';
        con1.style.marginRight='15px';
        con3.style.marginRight='15px';
        con5.style.marginRight='15px';
        
        let checkBox = createDiv("hostCheck","form-check","","","","");
        let checkInput = createInputBox("checkbox","","","","");
        checkInput.setAttribute("class", "form-check-input");
        checkInput.setAttribute("id", "hostCheckBox");
        checkInput.setAttribute("name", "hostCheckBox");
        checkInput.setAttribute("onchange", "checkboxValueChange()");
        let label = document.createElement("label");
        label.setAttribute("class", "form-check-label");
        label.setAttribute("for", "hostCheckBox");
        label.innerHTML="<b>국제전화</b>";
        
        checkBox.appendChild(checkInput);
        checkBox.appendChild(label);
        checkInput.style.marginTop='1em';
        
        let subBox1 = createDiv("","","","","","");

        subBox1.appendChild(sel1);
        subBox1.appendChild(inp1);
        subBox1.appendChild(con1);
        subBox1.appendChild(con3);
        subBox1.appendChild(con5);
        subBox1.appendChild(checkBox);
        subBox1.style.display='flex';
        subBox1.style.alignItems='center';
        subContentsBox.appendChild(subBox1);
        subContentsBox.style.lineHeight='3';
        subContentsBox.style.padding='0';
        
        col8.appendChild(title);
        col8.style.display='flex';
        col8.style.alignItems='center';
        col4.appendChild(radioBtn);
        col4.style.display='flex';
        col4.style.alignItems='center';
        row1.appendChild(col8);
        row1.appendChild(col4);
        box.appendChild(row1);
        box.appendChild(hr);
        
        contents.appendChild(subContentsBox);
        box.appendChild(contents);

        document.body.appendChild(box);

        const element = document.getElementById('step1');
        element.insertBefore(box, document.getElementById('step1').children[1]);
}

    function videoInfo(){
        //function createDiv(objId, className, funcName, innerText, width, isInline)
        //function createText(type, contents, isInline)
        //function createInputBox(type, name, value, placeholder, guideNum)
        //function createButton(innerText, guideNum)
        //function createRadioBtn(innerText,  guideNum, isInline)
        //function createRadio(Num, id, name, className, innerText)
        let box = createDiv("","innerContents","","","","");
        let row1 = createDiv("","row","","","","");
        let col8 = createDiv("","col-md-8","","","","");
        let col4 = createDiv("","col-md-4","","","","");

        let title = createText(1,"초대영상",true)
        title.style.marginBottom='0';
        let hr = createHr();
        let radioBtn = createRadio(2, "useable", "useable", "margin10", ["사용함","사용안함"]);
        radioBtn.style.margin='0 0 0 auto';
        let radioBtn2 = createRadio(3, "videoList", "video", "margin50", ["YouTube","Vimeo","FeelMaker"]);
        radioBtn2.style.marginBottom='16px';

        let sub1 = createText(2,"URL 입력",false);
        let subInputBox = createInputBox("text","url","","",3);
        let subButton = createButton("적용하기","", 2);
        subButton.style.width="100px";
        let smallBox = createDiv("","","","","","");
        smallBox.appendChild(sub1);
        smallBox.appendChild(subInputBox);
        smallBox.appendChild(subButton);
        smallBox.style.display='flex';
        smallBox.style.alignItems='center';
        smallBox.style.width='720px';
        smallBox.style.justifyContent='space-between';

        col8.appendChild(title);
        col8.style.display='flex';
        col8.style.alignItems='center';
        col4.appendChild(radioBtn);
        col4.style.display='flex';
        col4.style.alignItems='center';
        row1.appendChild(col8);
        row1.appendChild(col4);
        box.appendChild(row1);
        box.appendChild(hr);
        box.appendChild(radioBtn2);
        box.appendChild(smallBox);

        document.body.appendChild(box);

        const element = document.getElementById('contents-right');
        element.insertBefore(box, document.getElementById('contents-right').children[document.getElementById('contents-right').children.length-1]);

        /*
        box.onclick = function(){
                p = this.parentElement; //부모 HTML 태그요소
                p.removeChild(this); // 자신을 부모 태그로 부터 제거   
            }
        */
        }

        function produceInfo(){
            //function createDiv(objId, className, funcName, innerText, width, isInline)
            //function createText(type, contents, isInline)
            //function createInputBox(type, name, value, placeholder, guideNum)
            let box = createDiv("","innerContents","","","");
    
            let row1 = createDiv("","row","","","");
            let col4 = createDiv("","col-md-2","","");
            let col8 = createDiv("","col-md-10","","");
    
            let subTitleBox = createDiv("","sub-title-box","","");
    
            let subContentsBox = createDiv("","sub-contents-box","","");
                    
            let title = createText(1,"제작 완료",false)
            let hr = createHr();
    
            let sub1 = createText(2,"주문번호",false);
            let sub2 = createText(2,"주문일시",false);
            let sub3 = createText(2,"주문상품",false);
    
            subTitleBox.appendChild(sub1);
            subTitleBox.appendChild(sub2);
            subTitleBox.appendChild(sub3);
            subTitleBox.style.lineHeight='2';
    
            let con1 = createText(3,"orderCode",false);
            let con2 = createText(3,"orderDate",false);
            let con3 = createText(3,"templateCode / templateName",false);
    
            subContentsBox.appendChild(con1);
            subContentsBox.appendChild(con2);
            subContentsBox.appendChild(con3);
            subContentsBox.style.lineHeight='2';
    
            box.appendChild(title);
            box.appendChild(hr);
            col4.appendChild(subTitleBox);
            col8.appendChild(subContentsBox);
            row1.appendChild(col4);
            row1.appendChild(col8);
            box.appendChild(row1);
    
            document.body.appendChild(box);
    
            const element = document.getElementById('contents-right');
            //부모.insertBefor(어떤걸?, 어디앞에(//contents-right 마지막 요소)) 
            element.insertBefore(box, document.getElementById('contents-right').children[0]);
    
            box.onclick = function(){
                    p = this.parentElement; //부모 HTML 태그요소
                    p.removeChild(this); // 자신을 부모 태그로 부터 제거   
                }
            }
            
function deleteDiv() {
  const div = document.getElementById('template');
  div.remove();
}