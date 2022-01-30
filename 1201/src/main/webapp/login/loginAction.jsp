<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="members.UserDAO" %>
	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="member" class="members.Members" scope="page"/>
<jsp:setProperty property="*" name="member"/>

<%
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	
	
	if(userId != null){ %>
	<script type="text/javascript">
		alert('이미 로그인이 되었습니다.');
		location.href = "../index.jsp";
	</script>
		
	<%}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(member.getUserId(), member.getUserPw());
	if(result == 1){ 
	session.setAttribute("userId", member.getUserId());
	
	%>
	<script type="text/javascript">
	location.href = "../index.jsp";
	</script>

	<%}
	if(result == 0){ %>
		<script>
		alert("비밀번호가 틀립니다.");
		history.go(-1);
		</script>
	<% } 
	if(result == -1){ %>
		<script>
		alert("일치하는 아이디가 없습니다.");
		history.go(-1);
		</script>
	<% }
	if(result == -2){ %>
		<script>
		alert("데이터베이스에 오류가 발생했습니다.");
		history.go(-1);
		</script>
	<% }
%>
<body>
</body>
</html>