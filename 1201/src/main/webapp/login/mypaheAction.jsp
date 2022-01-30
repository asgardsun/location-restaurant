<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="members.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO dao = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("userId");
		String name = request.getParameter("userName");
		String pw = request.getParameter("userPw");
		if(pw.equals("")){
			pw = dao.returnPassword(id);
		}
		String gender = request.getParameter("userGender");
		String email = request.getParameter("userEmail");	
		boolean chekEamil;
		
		
		String exitEmail = dao.getEamil(id);
		if(true == dao.checkEmail(email, id)){ %>
		<script>
		alert("이메일이 중복됩니다.");
		history.go(-1);
		</script>
		<%}
		if(!exitEmail.equals(email)) chekEamil = false;
		else chekEamil = true;
		
		dao.updateForm(id, pw, name, email, gender, chekEamil);
		
		
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
			회원 정보가 업데이트 되었습니다.
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