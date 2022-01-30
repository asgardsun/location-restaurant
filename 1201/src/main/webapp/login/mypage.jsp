<%@page import="members.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<style>
	footer {
    	position:absolute;
    	bottom:0;
    	width:100%;
    	height:110px;   
    	background:#ccc;
	}

	td{
		font-size: 20px;
		padding-left: 30px;
	}
</style>
	<script type="text/javascript">
		var confirm = false;
		function pwTest() {
		      var p1 = document.getElementById('pw').value;
		      var p2 = document.getElementById('pw1').value;

		      var pwRegExp = /^[a-zA-z0-9]{4,12}$/;
		      //var pwRegExp =  /^.*(?=^.{5,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		      
		      
		      if(!p1){
		    	  alert("비밀번호가 없습니다.")
		    	  return false;
		      }
		      if(p1 != p2){
		          alert("비밀번호가 일치 하지 않습니다");
		          return false;
		      }else{
				  if(!pwRegExp.test(p1)) {
			            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			            register.userPw.value = "";
			            register.userPwConfirm.value = "";
			            register.userPw.focus();
			            return false;
			      }
		          alert("비밀번호가 일치합니다");
		          confirm = true;
		          return true;
		      }
		      

		      
		}
		function pwCheck(){
			if(!confirm){
		          alert("비밀번호을 입력해 주세요!");
		          return false;
			}
		}
		
	</script>

<%
	request.setCharacterEncoding("UTF-8");
	Members members = new Members();
	UserDAO DB = new UserDAO();
	String id = (String)session.getAttribute("userId");
	members = DB.userInform(id);	
%>
<body>
	<jsp:include page="/menu.jsp" flush="false"/>
	

	<form action="mypaheAction.jsp" method="post" onsubmit="return pwCheck()">
	<div class="container">
	<table style="width: 100%" class = "table">
	<thead>
	<tr>
	</tr>
	</thead>
	
	<tbody>

	<tr>
		<td colspan="2" style="padding-bottom: 25px; padding-left: 30px; padding-top: 10px"><div class="container">
		<h1 style="font-size: 50px">회원 정보 수정 양식</h1></div></td>
	</tr>
	<tr>
		<td style="padding-left: 30px" width="160px">아이디</td>
		<td style="margin-left: 30px"><%=members.getUserId() %></td>
	</tr>
	
	<tr>
		<td style="padding-left: 30px">비밀번호 입력  </td>
		<td><input type="password" placeholder="영문 대소문자와 숫자 4~12자리" size="25px" id = "pw"
		name="userPw">
		<input type="button" onclick="pwTest()" value="비밀번호 중복 확인">
		</td>
	</tr>
	
	<tr>
		<td style="padding-left: 30px">비밀번호 확인  </td>
		<td><input type="password" placeholder="비밀번호 재입력" size="25px" id = "pw1"></td>
	</tr>
	
	<tr>
		<td style="padding-left: 30px">이름  </td>
		<td><input type="text" value=<%=members.getUserName() %> size="25px" name="userName"></td>
	</tr>
	
	<tr>
		<td style="padding-left: 30px;">닉네임  </td>
		<td><%=members.getUserNick() %></td>
	</tr>
	
	<tr>
	<td style="padding-left: 30px;">이메일 </td>
		<td><input type="email" value= <%=members.getUserEmail()%> size="25px" name="userEmail"></td>
	</tr>
	
	<tr>
		<td style="padding-left: 30px;">성별  </td>
		<td><div class="form-group" style="text-align: left; margin: 0 auto;">
		<div class ="btn-group" data-toggle = "buttons" style="font-size: 20px; size: 20px">
		<label class="btn btn-primary active" style="font-size: 20px">
			<input type="radio"  name = "userGender" autocomplete="off" value="M" <% if(members.getUserGender().equals("M")){ %> checked="checked" <%} %> >
			남자
		</label>
		<label class="btn btn-primary active" style="font-size: 20px">
			<input type="radio"  name = "userGender" autocomplete="off" value="F" <% if(members.getUserGender().equals("F")){ %> checked="checked" <%} %>>
			여자
		</label>
		</div>
		</div></td>
	</tr>
	
	<tr>
		<td colspan="2" align="right">
		<button type="submit" class = "btn btn-primary" style="font-size: 20px" >수정하기</button>
		<button type="button" class = "btn btn-dark" onclick="location.href='/index.jsp';" style="font-size: 20px; background-color: block;">돌아가기</button>
	</tr>
	</tbody>


	</table>
	</div>
	</form>
	<jsp:include page="/rightmenu.jsp" flush="false"/>
</body>
</html>