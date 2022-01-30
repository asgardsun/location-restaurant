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
	//체크박스 값(맛집이름) 가져오기
	String value = request.getParameter("cbx");
	out.print(value);
	
	//DB연동
	Connection conn = null;

	String url = "jdbc:mysql://3.36.124.173:3306/sw_db?serverTimezone=UTC";
	String user = "sw";
	String password = "aktwlq2021";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	request.setCharacterEncoding("utf-8");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
		
	String s_userId = (String)session.getAttribute("userId");
	String sql = "select * from mymap where userId=? and name=? ";
	
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, s_userId);
	pstat.setString(2, value);
	rs = pstat.executeQuery();
	
	int result = 0;
	
	if(rs.next()){
		result = 1;
		//request.setAttribute("userId", rs.getString("userId"));
		request.setAttribute("name", rs.getString("name"));
		request.setAttribute("place", rs.getString("place"));
		request.setAttribute("menu", rs.getString("menu"));
		request.setAttribute("reason", rs.getString("reason"));
		request.setAttribute("lat", rs.getDouble("lat"));
		request.setAttribute("lng", rs.getDouble("lng"));
	}
	
	request.setAttribute("result", result);
	
	rs.close();
	pstat.close();
	conn.close();
%>
<jsp:forward page="updeForm.jsp"></jsp:forward>
</body>
</html>