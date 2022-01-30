<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/searchStyle.css">
</head>
<body>
	<jsp:include page="/menu.jsp" flush="false" />
	<jsp:include page="/rightmenu.jsp" flush="false" />
	<hr>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	String findWord;
	
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null){
		findWord = searchWord;
	} else{
		findWord = "맛집";
	}
	%>
	
	
	<div id="top_title">[현재 위치를 기준으로 맛집 찾기]</div>
	
	<div id="user_select">
		<div class="option">
				<form onsubmit="where_move(); return false;">
					검색 키워드 : <input type="text" value="<%=findWord%>"id="keyword" size="15"> &ensp;
					검색 반경을 선택해주세요 : 
					<label><input type="radio" name="distance" value="500"> 500M </label> 
					<label><input type="radio" name="distance" value="1000" checked> 1KM </label> 
					<label><input type="radio" name="distance" value="2000"> 2KM </label> &ensp;
					<button id="btn_search" type="submit">검색하기</button>
				</form>
		</div>
	</div>

	<div id="divPosition">
		<!-- 왼쪽 사이드 리스트 div -->
		<div id="menu_wrap" class="bg_white">
			<div style="font-family : nanumsquare;">검색된 가게의 목록입니다</div>
			<hr>
			<ul id="placesList" style="-webkit-padding-start: 0px;"></ul>
			<div id="pagination"></div>		
		</div>

		<div class="map_wrap">
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map"></div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4724baf92cc5e59fe296277b2f3896&libraries=services"></script>
	<script type="text/javascript" src="${path}/resources/js/search.js"></script>
</body>
</html>