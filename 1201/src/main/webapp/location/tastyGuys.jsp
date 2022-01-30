<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/localStyle.css">
</head>
<body>
	<jsp:include page="/menu.jsp" flush="false" />
	<jsp:include page="/rightmenu.jsp" flush="false" />
	<hr>
	<div id="text">
		<span style="color:#909000; font-weight:bold;">
		|&ensp;<a id="links" href="/location/localRest.jsp">지자체 추천 맛집</a
		>&ensp;|&ensp;<a id="links" href="/location/tastyGuys.jsp" style="color:#660066">맛있는 녀석들</a
		>&ensp;|&ensp;<a id="links" href="/location/paiks.jsp">백종원의 3대천왕</a
		>&ensp;|&ensp;<a id="links" href="/location/wednes.jsp">수요미식회</a>&ensp;|</span>
	</div>
	
	
	
	<div id="wrap"><div id="map"></div></div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4724baf92cc5e59fe296277b2f3896&libraries=services"></script>
	<script type="text/javascript" src="${path}/resources/js/tastyMap.js"></script>
</body>
</html>