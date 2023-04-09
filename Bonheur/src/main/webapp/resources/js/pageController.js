/**
 * 
 */
 
 function login(){
	serverCallByRequest("Login", "get", "");
}
 
 function openSearchBar(){
    const isHidden = document.getElementsByClassName('nav-container')[0].children[7].hidden;
    if(isHidden != ''){
      document.getElementsByClassName('nav-container')[0].children[1].style.marginLeft = '27%';
      document.getElementsByClassName('nav-container')[0].children[7].hidden = '';
    }else{
      document.getElementsByClassName('nav-container')[0].children[1].style.marginLeft = '40%';
      document.getElementsByClassName('nav-container')[0].children[7].hidden = true;
    }
  }
  
function pageReturn(pageNum){
	if(pageNum==0){
		serverCallByRequest("/Wedding", "post", "");
	}else if(pageNum==1){
		serverCallByRequest("/ThxCard", "post", "");
	}else if(pageNum==2){
		serverCallByRequest("/FirstBirth", "post", "");
	}else if(pageNum==3){
		serverCallByRequest("/ExtraCard", "post", "");
	}else if(pageNum==4){
		serverCallByRequest("/View/MyPage", "post", "");
	}
}

function openModal(modalNum){
	if(modalNum==0){
		let target = document.getElementsByClassName("modal-box-sm")[0];
		if(target.hidden){
			target.hidden = false;
			tokenCheck();
		}else{
			target.hidden = true;
		}
	}
}

function footerPageContoller(index){
		if(index==0){
			//서비스 소개
			serverCallByRequest("introduce","post","");
		}else if(index==1){
			//룰
			serverCallByRequest("rule","post","");
		}else if(index==2){
			//정책
			serverCallByRequest("infoPolicy","post","");
		}
}
