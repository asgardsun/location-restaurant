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
	
	request.setCharacterEncoding("utf-8");
	
	String userId = (String)session.getAttribute("userId");
	String name = request.getParameter("name");
	String place = request.getParameter("place");
	String menu = request.getParameter("menu");
	String reason = request.getParameter("reason");
	double lat = Double.parseDouble(request.getParameter("lat"));
	double lng = Double.parseDouble(request.getParameter("lng"));
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	String sql1 = "select * from mymap where userId=? and place=? ";
	String sql2 = "insert into mymap values (?,?,?,?,?,?,?)";
	
	int nameCheck = 0;
	int result = 0;
	
	// 동일한 주소가 있는지 체크
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, userId);
	pstat.setString(2, place);
	rs = pstat.executeQuery();
	
	if(rs.next()){
		// 동일한 주소가 있는 경우
		nameCheck = 1;
	} else {
		// insert
		pstat = conn.prepareStatement(sql2);
		pstat.setString(1, userId);
		pstat.setString(2, name);
		pstat.setString(3, place);
		pstat.setString(4, menu);
		pstat.setString(5, reason);
		pstat.setDouble(6, lat);
		pstat.setDouble(7, lng);
		
		//쿼리 실행
		result = pstat.executeUpdate();
	}
	
	request.setAttribute("nameCheck", nameCheck);
	request.setAttribute("result", result);
	
	rs.close();
	pstat.close();
	conn.close();
%>
<jsp:forward page="inputMapResult.jsp"></jsp:forward>
</body>
</html>