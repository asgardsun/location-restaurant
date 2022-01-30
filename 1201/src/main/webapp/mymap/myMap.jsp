<%@page import="mymap.MyMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/myMapStyle.css">
</head>
<body>
	<jsp:include page="/menu.jsp" flush="false" />
	<jsp:include page="/rightmenu.jsp" flush="false" />
	<hr>
	<%
		String userId = (String) session.getAttribute("userId");
	%>
	<c:choose>
		<c:when test="${empty userId}">
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href = "/login/login.jsp";
			</script>
		</c:when>
	</c:choose>
	<div id="text">
		<span style="color: black; font-weight: bold;"> 나만의 맛집 지도 </span>
	</div>

	<div id="divPosition">
		<div id="wrap">
			<div id="map"></div>
		</div>

		<!--  <form action="/mymap/updeQuery.jsp" name="form"> -->
		<!--  <input type="submit" value="수정/삭제"> -->
		<div id=list>
			<form name="form">
				<div id="list_btn">
				<button type="button" onclick="location.href='/mymap/inputMapForm.jsp'"><b>등록</b></button>
				<button type="button" onClick="openUpdewin(this.form);"><b>수정</b></button>
				<button type="button" onClick="opendelwin(this.form);"><b>삭제</b></button>
				</div>
				
				
				<div id="table">
					<table border="1" id="place_table">
						<!--  <tr><td colspan="5">저장된 맛집 목록</td></tr> -->
						<tr bgcolor="#ffdab9">
							<th style="width:20%;">맛집이름</th>
							<th style="width:30%;">주소</th>
							<th style="width:15%;">메뉴</th>
							<th style="width:30%;">한줄평</th>
							<th style="width:5%;">선택</th>
						</tr>
						<%
							response.setContentType("text/html;charset=utf8");
						request.setCharacterEncoding("utf-8");

						ArrayList<MyMap> list = (ArrayList<MyMap>) request.getAttribute("list");
						%>

						<c:forEach var="mymap" items="${list }">
							<tr>
								<td>${mymap.getName() }</td>
								<td>${mymap.getPlace() }</td>
								<td>${mymap.getMenu() }</td>
								<td>${mymap.getReason() }</td>
								<td><input type="checkbox" name="cbx"
									value="${mymap.getName() }" onclick='checkOnlyOne(this)'>
									<input type="hidden" id='de_lat' name="de_lat"
									value="${mymap.lat }"> <input type="hidden" id='de_lng'
									name="de_lat" value="${mymap.lng }"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</form>
			
			
				<div id="result" style="height:200px">
				
				</div>
			
			
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4724baf92cc5e59fe296277b2f3896&libraries=services"></script>
	<script type="text/javascript" src="${path}/resources/js/myMap.js"></script>
</body>
</html>