<%@page import="mymap.MyMap"%>
<%@page import="java.util.ArrayList"%>
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
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	ArrayList<MyMap> list = new ArrayList<>(); // Emp 객체 형태로 ArrayList에 저장
	
	
	String s_userId = (String)session.getAttribute("userId");
	String sql = "select * from mymap where userId=?";
	
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, s_userId);
	rs = pstat.executeQuery();
	
	while(rs.next()){              // 쿼리 실행 결과 출력
		MyMap mymap = new MyMap();       // 리스트에 저장할 Emp 객체 생성
		mymap.setUserId(rs.getString(1));
		mymap.setName(rs.getString(2));
		mymap.setPlace(rs.getString(3));
		mymap.setMenu(rs.getString(4));
		mymap.setReason(rs.getString(5));
		mymap.setLat(rs.getDouble(6));
		mymap.setLng(rs.getDouble(7));
		
		list.add(mymap);              // 생성된 mymap 객체를 리스트에 저장
	}
	
	request.setAttribute("list", list);  // 리스트를 request 영역에 저장
	
	rs.close();
	pstat.close();
	conn.close();
	
	// 넘겨줄 페이지를 RequestDispatcher 객체에 넣고, 
	// forward 메소드를 이용하여 데이터 전달
	RequestDispatcher rd = request.getRequestDispatcher("myMap.jsp");
	rd.forward(request, response);
%>
</body>
</html>