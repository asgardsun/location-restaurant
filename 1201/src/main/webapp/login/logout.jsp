<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	if(session.getAttribute("userId") == null){ %>
		<script type="text/javascript">
		alert("로그인상태가 아닙니다.");
		location.href = '../index.jsp';
		</script>
	<% } 
	else{ 
		session.invalidate(); %>
		<script type="text/javascript">
		alert("로그아웃했습니다.");
		location.href = '../index.jsp';
		</script>
	<% } %>
	
</body>
</html>