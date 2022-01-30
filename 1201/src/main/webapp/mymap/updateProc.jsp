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
	String place = request.getParameter("place");
	String menu = request.getParameter("menu");
	String reason = request.getParameter("reason");
	double lat = Double.parseDouble(request.getParameter("lat"));
	double lng = Double.parseDouble(request.getParameter("lng"));
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	int check = 0;
	int result = 0;
	
	String sql1 = "select * from mymap where userId=? and place=? and name!=? "; //동일한 주소가 있는지 확인
	String sql2 = "update mymap set userId=?, name=?, place=?, menu=?, reason=?, lat=?, lng=? where userId=? and name=?";

	//update mymap set userId="ryan", name="수정", place="수정", menu="수정", reason="수정", lat=1, lng=1 where userId="ryan" and name="룰루랄라";
	
	// 동일한 주소 있는지 체크.(이름은 못 바꾸니까 체크대상 아님.)
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1, userId);
		pstat.setString(2, place);
		pstat.setString(3, name);
		rs = pstat.executeQuery();
		
		if(rs.next()){
			// 동일한 주소가 있는 경우
			check = 1;
		} else {
			// update
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, userId);
			pstat.setString(2, name);
			pstat.setString(3, place);
			pstat.setString(4, menu);
			pstat.setString(5, reason);
			pstat.setDouble(6, lat);
			pstat.setDouble(7, lng);
			pstat.setString(8, userId);
			pstat.setString(9, name);
			
			//쿼리 실행
			result = pstat.executeUpdate();
		}
		
		request.setAttribute("check", check);
		request.setAttribute("result", result);
		
		rs.close();
		pstat.close();
		conn.close();
%>
<jsp:forward page="updateResult.jsp"></jsp:forward>
</body>
</html>