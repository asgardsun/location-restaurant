<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	@import url("/resources/style/style2.css");
</style>
<script type="text/javascript">
	function check() {
		if(!register.userId.value){
			alert("아아디를을 입력하세요")
			register.userId.focus();
			return false;
		}
		if(!register.userName.value){
			alert("이름을 입력하세요")
			register.userName.focus();
			return false;
		}
		if(!register.userEmail.value){
			alert("이메일을 입력하세요")
			register.userEmail.focus();
			return false;
		}
		if(!register.userNick.value){
			alert("닉네임을 입력하세요.")
			register.userNick.focus();
			return false;
		}
	   	var p1 = document.getElementById('pw1').value;
	   	var p2 = document.getElementById('pw2').value;
	   	var pwRegExp = /^[a-zA-z0-9]{4,12}$/;
		if(p1 != p2){
			alert("비밀번호가 일치 하지 않습니다.");
			return false;
		}
	   	if(!pwRegExp.test(p1)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            register.userPw.value = "";
            register.userPwConfirm.value = "";
            register.userPw.focus();
            return false;
        }
		
	}
</script>
<body>
<form action="memberJoin.jsp" method="POST" class="memberForm" onsubmit="return check()" name = "register"> 
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="userId" type="text" class="basic" placeholder="아이디"/>
      </div>
      <div class="textForm">
        <input name="userPw" type="password" class="basic" placeholder="비밀번호" id ="pw1">
      </div>
       <div class="textForm">
        <input name="userPwConfirm" type="password" class="basic" placeholder="비밀번호는 영문 대소문자와 숫자 4~12자리" id ="pw2">
      </div>
      <div class="textForm">
        <input name="userName" type="text" class="basic" placeholder="이름">
      </div>
       <div class="textForm">
        <input name="userEmail" type="email" class="basic" placeholder="이메일">
      </div>
      <div class="textForm">
        <input name="userNick" type="text" class="basic" placeholder="닉네임">
      </div>
      <div class= "textForm">
      <label class="basic">성별</label> <input type="radio" name = "userGender" value="M" id = "남자">
      <label for = "남자" class="basic">남자</label>
      <input type="radio" name = "userGender" value="F" id = "여자">
      <label for = "여자" class="basic">여자</label>
      </div>
		<div class ="textForm">
      		<label for="bithdate" class="basic">생년월일</label>
			<input type="date" id="Birthdate" class="basic" name="userBirthdate">
        </div>
      <input type="submit" class="btn" value="회원 가입"/>

    </form>
</body>
</html>