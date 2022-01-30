<%@page import="members.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	@import url("/resources/style/style3.css");
</style>
<body>
<form action="searchIdAction.jsp" method="POST" class="memberForm">
                                                                                       
      <h2>ID 찾기</h2>
      <div class="textForm">
        <input name="userName" type="text" class="basic" placeholder="이름">
      </div>
       <div class="textForm">
        <input name="userEmail" type="text" class="basic" placeholder="이메일">
      </div>
      <input type="submit" class="btn" value="찾기"/>
    </form>
</body>
</html>