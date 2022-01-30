<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="members.UserDAO" %>
<jsp:useBean id="member" class="members.Members" scope="page"/>
<jsp:setProperty property="*" name="member"/>
<title>게시물 등록</title>
	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(member.getUserId(), member.getUserPw());
	if(result == 1)
	session.setAttribute("userId", member.getUserId());
	
	%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/js/board.js"></script>
<script type="text/javascript">
$(function(){
	$("#writeForm").on("submit",function(){
		//만약에 필수요소가 제대로 채워지지 않았으면 return false;
		var result = boardCheck("writeForm");
		if(!result){		
			return false;
		}
	});
});
</script>
<thead>
	<tr>
		<td><jsp:include page="/menu.jsp" flush="false" /></td>
	</tr>
</thead>
	<div class="container">
		<h4>게시글 등록</h4>
		<div class="form-group">
		<form id="writeForm" action="register" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${userId}">
			<table class="table">
				<tr>
					<th>제목</th>
					<td><input class="form-control col-md-6" type="text" name="title" placeholder = "제목을 입력하세요"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" rows="20" name="content" style="resize: none;" placeholder = "내용을 입력하세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="file" name="file" multiple="multiple">
						<input type="submit" value = "등록">
						<input type="reset"  value = "다시작성">
						<input type="button" value ="목록" onclick="location.href='freeboard'">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="/rightmenu.jsp" flush="false" />	
