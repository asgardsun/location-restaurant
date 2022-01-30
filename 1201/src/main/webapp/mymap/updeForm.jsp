<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/updeFormStyle.css">
</head>
<body>
<h3>맛집 수정 팝업</h3>
	<h4>수정시에는 반드시 주소 옆 확인 버튼을 눌러주세요.</h4>
	<c:if test="${result ==  0}">
		<script type="text/javascript">
			alert("다시 시도해주세요.(체크박스를 선택해주세요.)");
			window.close();
		</script>
	</c:if>
	<form action="updateProc.jsp" method="post" name="popform" onsubmit="return popCheck()">
	<c:if test="${result == 1 }">
		<table border="1">
			<tr>
				<td id="td_text">맛집이름</td><td>${name }<input type="hidden" id="input" name="name" value="${name }"></td>
			</tr>
			<tr>
				<td id="td_text">주소</td><td><input type="text" id="juso" name="place" value="${place }">&nbsp;<button type="button" id="check">확인</button></td>
			</tr>
			<tr>
			<td colspan="2" id="td_map"><div id="map"  id="input" style="width:100%; height:250px;"></div></td>
			</tr>
			<tr>
				<td id="td_text">메뉴</td><td><input type="text" id="input" name="menu" value="${menu }"></td>
			</tr>
			<tr>
				<td id="td_text">한줄평</td><td><input type="text" id="input" name="reason" value="${reason }"></td>
			</tr>
		</table>
		<input type="hidden" id='lat' name="lat"> <input type="hidden" id='lng' name="lng">
		<br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<button type="submit">수정</button>
		<button type="button"  onclick="window.close()">닫기</button>
	</c:if>
	</form>
</body>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4724baf92cc5e59fe296277b2f3896&libraries=services"></script>
<script type="text/javascript" src="/resources/js/jusoCheck.js"></script>
</html>