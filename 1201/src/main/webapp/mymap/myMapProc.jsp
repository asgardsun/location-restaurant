<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;

	String url = "jdbc:mysql://3.36.124.173:3306/sw_db?serverTimezone=UTC";
	String user = "sw";
	String password = "aktwlq2021";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	request.setCharacterEncoding("utf-8");
	
	String userId = (String)session.getAttribute("userId");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	String sql1 = "select * from mymap where userId=? ";
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, userId);
	rs = pstat.executeQuery();
	
	final ArrayList<HashMap<String, String>> mymap = new ArrayList<HashMap<String,String>>();
	
	while(rs.next()){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", rs.getString("userId"));
		map.put("name", rs.getString("name"));
		map.put("place", rs.getString("place"));
		map.put("menu", rs.getString("menu"));
		map.put("reason", rs.getString("reason"));
		map.put("lat", rs.getString("lat"));
		map.put("lng", rs.getString("lng"));
		
		mymap.add(map);
	}
	
	Gson gson = new Gson();
	String json = gson.toJson(mymap);
	response.setContentType("application/json");
	response.setCharacterEncoding("utf-8");
	response.getWriter().write(json);
	
	rs.close();
	pstat.close();
	conn.close();
%>