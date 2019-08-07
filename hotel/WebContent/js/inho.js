function validate() {
       var re =  /[a-z0-9가-힣]{2,12}/; // 닉네임 적합한지 검사할 정규식
       var pass = /([^\s\w]|[A-z0-9]){8,16}/; // 패스워드 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       var re3 = /^[0-9]{9,11}$/; // 닉네임 적합한지 검사할 정규식
       // 이메일이 적합한지 검사할 정규식
       
       var password = document.getElementById("password");
       var email = document.getElementById("email");
       var nickname = document.getElementById("nickname");
       var phone = document.getElementById("phone");
      

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }
       
       if(!check(pass,password,"패스워드는 8~16자 영문 대 소문자, 숫자, 특수문자 사용")) {
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

var xmlReq; // 전역변수 지정
//Ajax 객체 생성 과정
function createAjax() {
	xmlReq = new XMLHttpRequest();
}

//Ajax 객체를 이용한 데이터 전송 과정
function ajaxIdSend() {
	createAjax();
	var email = document.getElementById("email").value;
	xmlReq.onreadystatechange = callBack;
	xmlReq.open("GET", "memberjsp/checkId.jsp?email="+email, true);
	xmlReq.send(null);
	//send가 끝나고나면 비동기식이기 때문에 프로그램이 계속 진행
}

function ajaxNickSend() {
	createAjax();
	var nickname = document.getElementById("nickname").value;
	xmlReq.onreadystatechange = callBack;
	xmlReq.open("GET", "memberjsp/checkNickname.jsp?nickname="+nickname, true);
	xmlReq.send(null);
	//send가 끝나고나면 비동기식이기 때문에 프로그램이 계속 진행
}

//콜백
function callBack() {
	if(xmlReq.readyState == 4) {
		if(xmlReq.status == 200) {
			printIdData();
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
	
	var idNode = rootNode.getElementsByTagName("email");
	var idValue = idNode.item(0).firstChild.nodeValue;
	var idTag = document.getElementById("idTxt");
	
	if (rootValue == "true") {
		rootTag.innerHTML = "사용 가능한 이메일";
	} else {
		rootTag.innerHTML = "중복된 이메일";
	}
}

function printNickData() {
	var result = xmlReq.responseXML;
	
	var rootNode = result.documentElement;
	var rootValue = rootNode.firstChild.nodeValue;
	var rootTag = document.getElementById("resultNick");
	
	var nickNode = rootNode.getElementsByTagName("nickname");
	var nickValue = nickNode.item(0).firstChild.nodeValue;
	var nickTag = document.getElementById("idTxt");
	
	if (rootValue == "true") {
		rootTag.innerHTML = "사용 가능한 닉네임";
	} else {
		rootTag.innerHTML = "중복된 닉네임";
	}
}