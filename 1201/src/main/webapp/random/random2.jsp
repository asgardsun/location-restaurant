<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">{
	  #wrap2 {
     width:500px; 
     position:relative;
     left:50%; 
     margin-left:-250px; 
     background:#f39800;
     height:20px;}

}
</style>
</head>
<body>	
	<jsp:include page="/menu.jsp" flush="false"/>
	<jsp:include page="/rightmenu.jsp" flush="false"/>
	<table width = "100%" border = "1" cellpadding = "0" cellspacing = "0">
	
	<form action="result.jsp" method="post">
	<tbody>
	<tr>
	<td colspan="2" align="center" height="100" style="font-size : 30px ; " background="../image/back.png;"><p style="color: white">음식 랜덤 추천에 오신것을 환영합니다.!!!</td>
	</tr>
	<tr>
	<td align="center">음식 종류 선택 : </td>
	<td align="center"><label><input type="radio" id="input1" name="where" value="chinese">중식</label>
	<label><input type="radio" id="input1" name="where" value="Japanese">일식</label>
	<label><input type="radio" id="input1" name="where" value="meat">고기</label>
	<label><input type="radio" id="input1" name="where" value="snack">분식</label>
	<label><input type="radio" id="input1" name="where" value="chicken">치킨</label>
	<label><input type="radio" id="input1" name="where" value="korea">한식</label>
	<label><input type="radio" id="input1" name="where" value="ramen">라면</label></td>
	</tr>
	<tr>
	<td align="center">식사 유형 선택 : </td>
	<td align="center"><label><input type="radio" id="input1" name="where2" value="sole">혼자</label>
	<label><input type="radio" id="input1" name="where2" value="lover">연인</label>
	<label><input type="radio" id="input1" name="where2" value="family">가족</label></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="추천 하기!!"></td>
	</tr>
	</tbody>
	
	

	</form>
	</table>
	<jsp:include page="/foot.jsp" flush="false"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>