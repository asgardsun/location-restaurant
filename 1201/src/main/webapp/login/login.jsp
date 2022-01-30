<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href = "${path}/resources/css/bootstrap.css">
<style type="text/css">

	
	body{
		display : flex;
		align-items: center;
		justify-content: center;
		/*background: url('Prjcet1029/bg.jfif') no-repeat center;  */
		background-size: cover;
		background: white;
	}
}
</style>
<style type="text/css">
	@import url("/resources/style/style.css");
</style>
</head>
<body>
<table border="1"style="width: 100%;">
<thead>
<tr>
	<td align="center" class = "menu"><jsp:include page="/menu.jsp" flush="false"/></td>
</tr>
</thead>

<tbody>
	<tr>
	<td>
	<section class = "login-form">
	<h1>로그인</h1>
	<form action="loginAction.jsp" method="post">
		<div class = "int-area">
			<input type = "text" name = "userId" id = "id"
			autocomplete="off" required>
			<label for = "id">ID</label>	
		</div>
		
		<div class = "int-area">
			<input type = "password" name = "userPw" id = "pw"
			autocomplete="off" required>
			<label for = "pw" style="">PASSWORD</label>
		</div>
		
		<div class = "btn-area">
			<button id="btn" 
			type="submit">LOGIN</button>
		</div>
		
		<div class = "regist-area">
			<button type="button" onclick="location.href='register.jsp'">회원 가입</button>
		</div>
	</form>
	
	<div class = "caption">
	
		<a href="searchId.jsp">아이디 찾기/</a>
		<a href = "searchPassword.jsp">비밀번호 찾기</a>
	</div>
	</section>
		
	</td>
	</tr>
	</tbody>
	
	<tfoot>
	<tr>
	<td>
		<jsp:include page="/foot.jsp" flush="false"/>
	</td>
	</tr>
	</tfoot>
</table>
	<script type="text/javascript">
	
	</script>

	<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>