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
	UserDAO userDAO = new UserDAO();
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	else{
		out.print(userId);
		return;
	}
	boolean emailChecked = userDAO.getUserEamilChecked(userId);
	if(emailChecked == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�̹� ������ �ϼ̽��ϴ�.');");
		script.println("location.href = '../index.jsp';");
		script.println("</script>");
		return;
	}
	String host = "http://localhost:8181/login/";
	String from = "202044003@itc.ac.kr";
	String to = userDAO.getEamil(userId);
	String subject = "������ ����ϱ� ���� �̸��� �����Դϴ�.";
	String content = "���� ��ũ�� �����Ͽ� �̸��� ������ �����ϼ���." +
			"<a href = '" + host + "emailCheckAction.jsp?code=" + to + "'>�̸��� �����ϱ�</a>";
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
		script.println("alert('������ �߻��߽��ϴ�.');");
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
			�̸��� �ּ� ���� ������ ���۵Ǿ����ϴ�. ȸ�����Խ� �Է��ߴ� �̸��Ͽ� ���ż� �������ּ���.
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
					<h4>���� �Ұ�</h4>
					<p>��°� �迹�� �����</p>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center; font-size: 15px">������̼�</h4>
					<div class="list-group">
						<a href="#" class="list-group-item" style="font-size: 15px;">�Ұ�</a>
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