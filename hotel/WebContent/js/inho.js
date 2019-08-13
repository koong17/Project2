$(document).ready(function() {
	$('#headerheight').height(window.innerHeight-176);
	console.log(window.innerHeight-176);
});


function emailvalidate() {
	var email = document.getElementById("email").value;
	var re=/^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
	var emailTag = document.getElementById("emailTag");
	var result = false;
	if (!re.test(email)) {
		emailTag.innerHTML = "적합하지 않은 이메일 형식입니다.";
		result = false;
	} else {
		emailTag.innerHTML = "";
		result = true;
	}
	return result;
}

function passwordvalidate() {
	var password = document.getElementById("password").value;
	var re = /([^\s\w]|[A-z0-9]){8,16}/; // 패스워드 적합한지 검사할 정규식
	var passwordTag = document.getElementById("passwordTag");
	if (!re.test(password)) {
		passwordTag.innerHTML = "패스워드는 8~16자 사용 가능합니다.";
	} else {
		passwordTag.innerHTML = "";
	}
}

function password2validate() {
	var password2 = document.getElementById("password2").value;
	var re = /([^\s\w]|[A-z0-9]){8,16}/; // 패스워드 적합한지 검사할 정규식
	var password2Tag = document.getElementById("password2Tag");
	if (!re.test(password2)) {
		password2Tag.innerHTML = "패스워드는 8~16자 사용 가능합니다.";
	} else {
		password2Tag.innerHTML = "";
	}
}

function nicknamevalidate() {
	var nickname = document.getElementById("nickname").value;
	var re =  /^[a-z0-9가-힣]{2,12}$/; // 닉네임 적합한지 검사할 정규식
	var nicknameTag = document.getElementById("nicknameTag");
	var result = false;
	if (!re.test(nickname)) {
		nicknameTag.innerHTML = "닉네임은 2~12자이며, 특수문자 제외";
		result = false;
	} else {
		nicknameTag.innerHTML = "";
		result = true;
	}
	return result;
}


function phonevalidate() {
	var phone = document.getElementById("phone");
	var re = /^[0-9]{9,11}$/; // 전화번호 적합한지 검사할 정규식
	var phoneTag = document.getElementById("phoneTag");
	if (!re.test(phone.value)) {
		phoneTag.innerHTML = "전화번호는 9~11자 숫자만 가능합니다. ex)01012345678";
	} else {
		phoneTag.innerHTML = "";
	}
}

function validate() {
       var re =  /^[a-z0-9가-힣]{2,12}$/; // 닉네임 적합한지 검사할 정규식
       var pass = /([^\s\w]|[A-z0-9]){8,16}/; // 패스워드 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/; // 이메일이 적합한지 검사할 정규식
       var re3 = /^[0-9]{9,11}$/; // 전화번호 적합한지 검사할 정규식
       
       
       var password = document.getElementById("password");
       var email = document.getElementById("email");
       var nickname = document.getElementById("nickname");
       var phone = document.getElementById("phone");
      

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }
       
       if(!check(pass,password,"패스워드는 8~16자 사용 가능합니다.")) {
           return false;
       }

       if(!check(re,nickname,"닉네임은 2~12자이며, 특수문자 제외")) {
           return false;
       }
       
       if(!check(re3, phone, "전화번호는 9~11자 숫자만 가능합니다.")) {
           return false;
       }
       
       alert("회원가입이 완료되었습니다.");
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}


function updatevalidate() {
	var re =  /[a-z0-9가-힣]{2,12}/; // 닉네임 적합한지 검사할 정규식
	var re3 = /^[0-9]{9,11}$/; // 전화번호 적합한지 검사할 정규식
 
    var nickname = document.getElementById("nickname");
    var phone = document.getElementById("phone");

   
    if(!check(re,nickname,"닉네임은 2~12자이며, 특수문자 제외")) {
        return false;
    }
    
    if(!check(re3, phone, "전화번호는 9~11자 숫자만 가능합니다.")) {
        return false;
    }
    
    alert("회원수정이 완료되었습니다.");
}

function passvalidate() {
    var re =  /[a-z0-9가-힣]{2,12}/;
    
    var password = document.getElementById("password");
    var password2 = document.getElementById("password2");

    if(!check(re,password,"패스워드는 8~16자 사용 가능합니다.")) {
        return false;
    }
    
    if(!check(re,password2,"패스워드는 8~16자 사용 가능합니다.")) {
        return false;
    }
}

var xmlReq; // 전역변수 지정
//Ajax 객체 생성 과정
function createAjax() {
	xmlReq = new XMLHttpRequest();
}

//Ajax 객체를 이용한 데이터 전송 과정
function ajaxIdSend() {
	var check = emailvalidate();
	if(check ) {
		createAjax();
		var email = document.getElementById("email").value;
		xmlReq.onreadystatechange = callBack;
		xmlReq.open("GET", "memberjsp/checkId.jsp?email="+email, true);
		xmlReq.send(null); //send가 끝나고나면 비동기식이기 때문에 프로그램이 계속 진행
	} else { 
		var rootTag = document.getElementById("resultId");
		rootTag.innerHTML = "";
	}
	
}

function ajaxNickSend() {
	var check = nicknamevalidate();
	if(check) {
		createAjax();
		var nickname = document.getElementById("nickname").value;
		xmlReq.onreadystatechange = callBack2;
		xmlReq.open("GET", "memberjsp/checkNickname.jsp?nickname="+nickname, true);
		xmlReq.send(null);
		//send가 끝나고나면 비동기식이기 때문에 프로그램이 계속 진행
	} else {
		rootTag = document.getElementById("resultNick");
		rootTag.innerHTML = "";
	}
}

//콜백
function callBack() {
	if(xmlReq.readyState == 4) {
		if(xmlReq.status == 200) {
			printIdData();
		}
	}
}

function callBack2() {
	if(xmlReq.readyState == 4) {
		if(xmlReq.status == 200) {
			printNickData();
		}
	}
}

//결과 출력 과정
function printIdData() {
	var result = xmlReq.responseXML;
	
	var rootNode = result.documentElement;
	var rootValue = rootNode.firstChild.nodeValue;
	var rootTag = document.getElementById("resultId");
	
	if (rootValue == "true") {
		rootTag.innerHTML = "사용 가능한 이메일";
	} else {
		rootTag.innerHTML = "<font color='RED'>중복된 이메일</font>";
	}
}

function printNickData() {
	var result = xmlReq.responseXML;
	
	var rootNode = result.documentElement;
	var rootValue = rootNode.firstChild.nodeValue;
	var rootTag = document.getElementById("resultNick");
	
	if (rootValue == "true") {
		rootTag.innerHTML = "사용 가능한 닉네임";
	} else {
		rootTag.innerHTML = "<font color='RED'>중복된 닉네임</font>";
	}
}

function kakaologout() {
	/*Kakao.Auth.logout();*/
	Kakao.Auth.logout({
		callback: function(){
			alert('callback');
		}
	});
}


function kakaologinform(){
	Kakao.Auth.loginForm({
		success: function(authObj){
			alert(authObj);
		},
		fail: function(errorObj) {
			alert(errorObj);
		}
	});
}
