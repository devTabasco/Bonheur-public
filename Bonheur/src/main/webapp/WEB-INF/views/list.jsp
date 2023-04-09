<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Template List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/layout.css">
    <script src="../../resources/js/pageController.js"></script>
    <script src="../../resources/js/common.js"></script>
    <link rel="stylesheet" type="text/css" id="changeStyle" href="resources/css/styleGuide.css" />
</head>
<style>
	.list-phone{
    	border:none;
    	width: 280px;
        height: 512px;
        margin: 0 auto;
        padding: 0;
        position:relative;
    }
    .category-area{
        display:flex;
        align-items:center; /* 방향이 row 기준: 세로 중앙 정렬*/
        height:10vh;
        padding: 0 3%;
    }
    .category-btn{
        display: inline-block;
    }

    .category-btn > button{
        margin-left: 5px;
    }

    .list-left{
        padding: 0;
        height: 80vh;
        display:flex;
        align-items:center; /* 방향이 row 기준: 세로 중앙 정렬*/
        justify-content: center;
    }

    .phone-area > h1{
        font-size: 16px;
        color: #6C757D;
        margin-top: 5%;
    }

    .phone-area > p{
        font-size: 20px;
        color: #6C757D;
        padding: 0;
        margin: 1% 0 3% 0;
    }

    .template-list-item{
        width: 100%;
        border: 1px solid #B0B6BA;
        box-sizing: border-box;
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
        margin: 15% auto;
        border-radius: 10px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
      }

      .tag{
      	font-family: 'Noto Sans KR', sans-serif;
        display: inline-block;
        margin-top: 5%;
        margin-right: 3%;
        font-size: 16px;
      }
      
      .template-list-item-text{
      	padding: 0 3%
      }

      .template-list-item-text > h1{
        color: #6C757D;
        display: inline-block;
        margin-top: 3%;
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 1.1rem;
        margin-right: 5%;
      }

      .template-list-item-text > p{
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 0.9rem;  
        color: #6C757D;
        padding: 0;
        margin: 0;
        display: inline-block;
      }
      
      .template-list-box{
      	padding-bottom: 3%;
      	cursor:pointer;
      }
      
      .previewFrame{
      	position: absolute;
	    width: 100%;
	    height: 100%;
	    border-radius: 50px;
    	border: solid 10px #292929;
      }

</style>
<script>
	//function getTemplateList(){
	//	let formData = new FormData();
	//	serverCallByFetchAjax(formData, 'getTemplateList', 'post', 'viewTemplateList');	
	//}
	
	function viewTemplateList(){
		console.log(${templateList});
		let serverData = ${templateList};
		
		for(let i = 0; i<serverData.length;i++){
			let url = "https://bonheur-storage.s3.ap-northeast-2.amazonaws.com/resources/images/"+serverData[i].templateDetailCode.toLowerCase()+".png";
			createTemplateData(url, serverData[i].templateDetailCode, serverData[i].templateDetailName, serverData[i].templateDetailContents, i);
		
			if(i==0){
				document.getElementsByClassName('phone-area')[0].children[1].innerText = serverData[i].templateDetailCode;
				document.getElementsByClassName('phone-area')[0].children[2].innerText = serverData[i].templateDetailName;
				document.getElementsByTagName('iframe')[0].src = "/template/"+serverData[0].templateDetailCode.toLowerCase();
			}
		}
	}
		
	function createTemplateData(image, templateCode, templateName, tagData, index){
		
			let row = document.getElementsByClassName('row')[0];
			
			let col = document.createElement('div');
			col.setAttribute("class","col-lg-4 template-list-box");
			col.setAttribute("onClick","changeIframeSrc('"+templateCode+"','"+templateName+"',"+ index+")")
			
			let templateListItem = document.createElement('div');
			templateListItem.setAttribute("class","template-list-item");
			
			let templateImage = document.createElement('div');
			templateImage.setAttribute("class","template-ex-img");
			templateImage.style.backgroundImage='url("'+image+'")'
			
			let templateListItemText = document.createElement('div');
			templateListItemText.setAttribute("class","template-list-item-text");
			
			let tag = document.createElement('div');
			tag.setAttribute('class','tag');
			tag.innerText = '#'+tagData;
			
			let h1 = document.createElement('h1');
			h1.innerText = templateName;
			let p = document.createElement('p');
			p.innerText = templateCode;
			
			templateListItemText.appendChild(tag);
			templateListItemText.appendChild(document.createElement('br'));
			templateListItemText.appendChild(h1);
			templateListItemText.appendChild(p);
			
			templateListItem.appendChild(templateImage);
			
			col.appendChild(templateListItem);
			col.appendChild(templateListItemText);
			
			row.appendChild(col);
	}
	
	function changeIframeSrc(templateCode,templateName, index){
		document.getElementById('previewFrame').src = "/template/"+templateCode.toLowerCase();
		document.getElementsByClassName('phone-area')[0].children[1].innerText = templateCode;
		document.getElementsByClassName('phone-area')[0].children[2].innerText = templateName;
	}
	
	function tagController(index){
		const target = document.getElementsByClassName('category-btn')[0].children;
		if(index==0){
			target[0].setAttribute('class','btn btn-primary btn-xs kor');
			target[1].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[2].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[3].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[4].setAttribute('class','btn btn-outline-primary btn-xs kor');
			itemHiddenByTag(target[index].innerText);
		}else if(index==1){
			target[0].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[1].setAttribute('class','btn btn-primary btn-xs kor');
			target[2].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[3].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[4].setAttribute('class','btn btn-outline-primary btn-xs kor');
			itemHiddenByTag(target[index].innerText);
		}else if(index==2){
			target[0].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[1].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[2].setAttribute('class','btn btn-primary btn-xs kor');
			target[3].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[4].setAttribute('class','btn btn-outline-primary btn-xs kor');
			itemHiddenByTag(target[index].innerText);
		}else if(index==3){
			target[0].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[1].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[2].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[3].setAttribute('class','btn btn-primary btn-xs kor');
			target[4].setAttribute('class','btn btn-outline-primary btn-xs kor');
			itemHiddenByTag(target[index].innerText);
		}else if(index==4){
			target[0].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[1].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[2].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[3].setAttribute('class','btn btn-outline-primary btn-xs kor');
			target[4].setAttribute('class','btn btn-primary btn-xs kor');
			itemHiddenByTag(target[index].innerText);
		}
	}
	
	function itemHiddenByTag(tagName){
		let row = document.getElementsByClassName('row')[0];
		if(tagName=='전체'){
			for(let i=0;i<row.children.length;i++){
				row.children[i].hidden=false;
			}
		}else{
			for(let i=0;i<row.children.length;i++){
				if(row.children[i].children[1].children[0].innerText.toLowerCase() == "#"+tagName.toLowerCase()){
					row.children[i].hidden=false;
				}else{
					row.children[i].hidden=true;
				}
			}
		}
	}
	
	function moveDetailPage(){
		const templateCode = document.getElementsByClassName('phone-area')[0].children[1].innerText;
		let clientData = [["templateDetailCode",templateCode]];
		serverCallByRequest("/View/Detail","post",clientData);
	}
</script>
<body onload="viewTemplateList()" >
    <div id="guideLine">
        <div id="nav">
            <div>
                <ul class="nav-container">
                    <li><div class="logo" style="line-height: 10vh;"><a class="logo" href="/">Bonheur</a></div></li>
                    <li class="nav-item kor nav-category" onClick="pageReturn(0)" style="margin-left:40%;">청첩장</li>
                	<li class="nav-item kor nav-category" onClick="pageReturn(1)">감사장</li>
                	<li class="nav-item kor nav-category" onClick="pageReturn(2)">돌잔치</li>
                	<li class="nav-item kor nav-category" onClick="pageReturn(3)">기타 초대장</li>
                    <li class="nav-item" style="margin-left:10%"><a><div class="bi bi-person-circle b" style="font-size: 30px;"></div></a></li>
                    <li class="nav-item" style="margin-left:20px"><a><div class="bi bi-bell b" style="font-size: 30px;"></div></a></li>
                    <li class="nav-item" hidden><input type="text" class="input-box input-box-sm" placeholder="원하는 템플릿을 검색해보세요."></li>
                    <li class="nav-item" style="margin-left:20px"><div class="bi bi-search b" style="font-size: 30px;" onclick="openSearchBar()"></div></li>
                </ul>
            </div>
        </div>
        <div id="contents-left" class=" list-left">
            <div class="phone-area">
            <div class="phone list-phone">
            	<div class="M-line" style="z-index:1"></div>
            	<iframe scrolling="yes" id="previewFrame" class="previewFrame"></iframe>
            </div>
            <h1 class="eng">Template Code</h1>
            <p class="eng">Template Name</p>
            <button type="button" class="btn btn-primary btn-produce-md kor" onClick="moveDetailPage()">제작하기</button>
            </div>
        </div>
        <div id="contents-right" style="height: 90vh; padding:0 1%">
            <div class="category-area"> <!-- 카테고리 선택 -->
                <div class="category-btn">
                    <button type="button" class="btn btn-primary btn-xs kor" onClick="tagController(0)">전체</button>
                    <button type="button" class="btn btn-outline-primary btn-xs kor" onClick="tagController(1)">New</button>
                    <button type="button" class="btn btn-outline-primary btn-xs kor" onClick="tagController(2)">Best</button>
                    <button type="button" class="btn btn-outline-primary btn-xs kor" onClick="tagController(3)">깔끔한</button>
                    <button type="button" class="btn btn-outline-primary btn-xs kor" onClick="tagController(4)">플라워</button>
                </div>
  
            </div>
            <div class="row">
                <!-- Large size에서만 2개(=12/6)의 column으로 보여주기 -->
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