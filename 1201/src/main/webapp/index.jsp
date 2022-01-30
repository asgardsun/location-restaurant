<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예시</title>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/index.css">
<style type="text/css">
	.jumbotron {
		background-image: url("./resources/image/mainImg.png");
		background-size: cover;
		text-shadow: black 0.2em, 0.2em 0.2em;
		color: white;
		height: 250px;
		margin-top: 25px;
	}
	.img{
		
	}
	.txt{
		text-align : center;
		height: 90px;
	}
	.span_text{
		font-size:50px;
		font-weight: bold;
		color : black;
	}
	.sear{
		height:60px;
	}
	.span_text2{
		font-size:20px;
		font-weight: bold;
		color : black;
	}
	#input1{
		width : 300px;
		height : 50px;
		background-color : banana;
		border : 3px solid black;
		border-radius:5px;
	}
	#input2{
		width : 100px;
		height : 80px;
		background-color : gold;
		border : 3px solid black;
		border-radius : 5px;
	}
</style>
</head>
<body>
	<table style="width: 100%">
	<thead>
	<tr>
		<td><jsp:include page="/menu.jsp" flush="false"/></td>
	</tr>
	</thead>
	
	<tbody>
	<tr>
		<td>
			<div class="container">
		<div class="jumbotron">
			<div class="txt">
			<span class="span_text">위치기반 맛집 추천 웹 사이트</span>
			</div>
			<div class="sear">
			<form action="location/search.jsp" method="post">
				<div class="search">
					<input id="input1" type="text" name="searchWord" style="color: black; font-size:12pt;"
						placeholder="검색어 입력">
					<input id="input2" type="submit"  onsubmit="where(); return false;" value="검색"
						style="width: 98px; height: 50px; background-color: white; color: black;"/>
				</div>
			</form>
			</div>
		</div>
		<div style="margin-top: 20px; margin-bottom: 20px;">
			<span class="span_text2">바로가기</span>
		</div>
		<div class="img">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col">
				<a href="random/random.jsp"><img src="./resources/image/random.png" width="540px"
					height="179px"></a>
				<div style="height:30px"></div>	
			</div>
			<div class="col">
				<a href="/location/search.jsp"><img src="./resources/image/search.png" width="540px"
					height="179px"></a>
			</div>
			<div class="col">
				<a href="/location/localRest.jsp"><img src="./resources/image/map.png" width="540px"
					height="179px"></a>
			</div>
			<div class="col">
				<a href="/board/freeboard"><img src="./resources/image/board.png" width="540px"
					height="179px"></a>
			</div>
		</div>
		</div>
		<hr>

	</div>
		</td>
	</tr>
	</tbody>
	
	<tfoot>
	<tr>	
		<td>
			<jsp:include page="/foot.jsp" flush="false"/>
		</td>
	</tr>
	</tfoot>
	</table>
		<jsp:include page="/rightmenu.jsp" flush="false"/>
</body>
</html>