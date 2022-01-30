<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/myMapFormStyle.css">
</head>
<body>
	<jsp:include page="/menu.jsp" flush="false" />
	<jsp:include page="/rightmenu.jsp" flush="false" />
	<hr>
	<%String userId = (String)session.getAttribute("userId"); %>
	<c:choose>
		<c:when test="${empty userId}">
		<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href="/login/login.jsp";
			</script>
		</c:when>
	</c:choose>
	<div id="text">
		[ 나만의 맛집 지도 만들기 ]
		
	</div>
	<div id="text2">
		맛집을 등록하고 나만의 맛집 지도에서 확인해보세요!
	</div>
	<div id="d_table">
	<form action="/mymap/inputMapProc.jsp" method="post" name="mapform" onsubmit="return formCheck()">
	<table>
		<tr id="tr_indi"></tr>
		<tr>
			<td id="td_text">맛집이름</td>
			<td id="td_input"><input type="text"  id="input" name="name" autofocus="autofocus"></td>
		</tr>
		<tr>
			<td id="td_text">주소</td>
			<td id="td_input"><input type="text" id="juso" name="place" placeholder="주소를 입력하고 확인 버튼을 눌러주세요."> <button type="button" id="check">확인</button></td>
		</tr>
		<tr>
			<td colspan="2" id="td_map"><div id="map"></div></td>
		</tr>
		<tr>
			<td id="td_text">추천메뉴</td>
			<td id="td_input"><input type="text" id="input" name="menu"></td>
		</tr>
		<tr>
			<td id="td_text">한 줄 평</td>
			<td id="td_input"><input type="text" id="input" name="reason"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">등록</button> &ensp; <button type="button" onclick="location.href='/mymap/queryMap.jsp'">지도 보기</button></td>
		</tr>
		<tr id="tr_indi"></tr>
	</table>
	<input type="hidden" id='lat' name="lat">
	<input type="hidden" id='lng' name="lng">
</form>
</div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4724baf92cc5e59fe296277b2f3896&libraries=services"></script>
	<script type="text/javascript" src="/resources/js/jusoCheck.js"></script>
</body>
</html>