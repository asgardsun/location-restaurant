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
<style type="text/css">
	footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:110px;   
    background:#ccc;

}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	UserDAO userDAO = new UserDAO();
	String email = request.getParameter("userEmail");
	String name = request.getParameter("userName");
	String result = userDAO.returnId(email, name);
	if(result == null){
		out.println(result);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('일치하는 정보가 없습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	String host = "http://localhost:8181/login/";
	String from = "202044003@itc.ac.kr";
	String to = userDAO.getEamil(result);
	String subject = "맛집을 사이트 아이디를 찾기 위한 이메일 입니다.";
	String content = "회원님에 아이디는 " + result + "입니다." + 
			"<a href = '" + host + "login.jsp'>로그인 화면 바로 가기 </a>";
	//out.print(to);
	
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.ssl.protocols", "TLSv1.2");
	
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try {
		Authenticator auth = new NaverMail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
	} catch(Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
		<table style="width: 100%">
	<thead>
	<tr >
		<td><jsp:include page="/menu.jsp" flush="false"/></td>
	</tr>
	</thead>
	
	<tbody>
	<tr>
	<td>
		<section class="container mt-3" style="max-width: 560px;">
		<div class="alert alert-success mt-4" role="alert">
			회원님에 이메일로 아이디를 보냈습니다. 회원가입시 입력했던 이메일에 들어사셔 확인해주세요.
		</div>
	</section>
	</td>
	</tr>
	
	</tbody>
	
	<tfoot>
	<tr>
	<td colspan="2">
		<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center; font-size: 15px;">
					<h5>Copyringht &copy; 2017</h5>
				</div>
				<div class="col-sm-3" style="font-size: 15px">
					<h4>팀원 소개</h4>
					<p>김승겸 배예진 한재근</p>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center; font-size: 15px">내비게이션</h4>
					<div class="list-group">
						<a href="#" class="list-group-item" style="font-size: 15px;">소개</a>
					</div>
				</div>

			</div>
	</footer>
	</td>
	</tr>
	</tfoot>
	</table>
		<jsp:include page="/rightmenu.jsp" flush="false"/>
</body>
</html>















