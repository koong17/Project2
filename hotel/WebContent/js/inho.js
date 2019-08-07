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