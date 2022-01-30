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
	
	String sql1 = "select * from map_local_rest ";
	pstat = conn.prepareStatement(sql1);
	rs = pstat.executeQuery();
	
	final ArrayList<HashMap<String, String>> locMap = new ArrayList<HashMap<String,String>>();
	
	while(rs.next()){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", rs.getString("type"));
		map.put("name", rs.getString("name"));
		map.put("contact", rs.getString("contact"));
		map.put("lat", rs.getString("lat"));
		map.put("lng", rs.getString("lng"));
		map.put("place", rs.getString("place"));
		map.put("main_menu", rs.getString("main_menu"));
		
		locMap.add(map);
	}
	
	Gson gson = new Gson();
	String json = gson.toJson(locMap);
	response.setContentType("application/json");
	response.setCharacterEncoding("utf-8");
	response.getWriter().write(json);
	
	rs.close();
	pstat.close();
	conn.close();
%>