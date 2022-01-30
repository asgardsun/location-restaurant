<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  	<%@page import="javax.mail.*" %>
 	<%@page import="members.UserDAO" %>
 	<%@page import="java.io.PrintWriter" %>
 	<%@page import="util.NaverMail" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null){
		code = request.getParameter("code");
	}
	UserDAO userDAO = new UserDAO();
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	if(userId == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요.');");
		script.println("location.href = '../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userEmail = userDAO.getEamil(userId);
	boolean isRight = userEmail.equals(code) ? true : false;
	if(isRight){
		userDAO.userEamilCheckUdapte(userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공하셨습니다.');");
		script.println("location.href = '../index.jsp';");
		script.println("</script>");
		script.close();
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보가 일치하지 않습니다.');");
		script.println("location.href = '../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
</body>
</html>