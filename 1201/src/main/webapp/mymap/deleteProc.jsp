<%@page import="java.sql.*"%>
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
	Connection conn = null;
	
	String url = "jdbc:mysql://3.36.124.173:3306/sw_db?serverTimezone=UTC";
	String user = "sw";
	String password = "aktwlq2021";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);

	String userId = (String)session.getAttribute("userId");
	String name = request.getParameter("name");
	
	PreparedStatement pstat = null;
	int result = 0;
	
	String sql = "delete from mymap where userId=? and name=? ";

	pstat = conn.prepareStatement(sql);
	pstat.setString(1, userId);
	pstat.setString(2, name);
	
	result = pstat.executeUpdate(); //
		
	request.setAttribute("result", result);
		
	pstat.close();
	conn.close();

	request.setAttribute("result", result);
		

	pstat.close();
	conn.close();
%>
<jsp:forward page="deleteResult.jsp"></jsp:forward>
</body>
</html>
</body>
</html>