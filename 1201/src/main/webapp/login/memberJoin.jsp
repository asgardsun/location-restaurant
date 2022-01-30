<%@page import="java.io.PrintWriter"%>
<%@page import="members.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="members.Members" scope="request"/>
<jsp:setProperty property="*" name="member"/>
	<%
	String userPwConfirm = request.getParameter("userPwConfirm");
	if(userPwConfirm.equals(member.getUserPw())){
		if(member.getClass() == null ||
				member.getUserName() == null ||
				member.getUserNick() == null ||
				member.getUserPw()== null ||
				member.getUserId() == null||
				member.getUserEmail()== null ||
				member.getUserBirthdate() == null){
				%>
				<script type="text/javascript">
				alert("가입정보 사항에 빠진것이 있습니다.")
				history.go(-1);
				</script>	
				<% } else {
					UserDAO user = new UserDAO();
					String nickCheck = member.getUserNick();
					String e_mailCheck = member.getUserEmail();
					if(true == user.checkNick(nickCheck)){	%>
						<script>
						alert("닉네임이 중복 됩니다.");
						history.go(-1);
						</script>
					<%	return; 
					}
					if(true == user.checkEmail(e_mailCheck)){ %>
						<script>
						alert("이메일이 중복됩니다.");
						history.go(-1);
						</script>
					<%}
					else{
						int result = user.join(member);
						if(result == -1){ %>
						<script>
						alert("ID가 중복 됩니다.");
						history.go(-1);
						</script>
						<%} else{
							session.setAttribute("userId", member.getUserId());
							%>
							<script type="text/javascript">
							location.href = "EamilCheck.jsp";
							</script> 
						<%}
						} 
					} 
	}else{ %>
	<script type="text/javascript">
		alert("비밀번호가 일치 하지 않습니다.");
		history.go(-1);
	</script>
	
	<% }%>
		
			

</body>
</html>