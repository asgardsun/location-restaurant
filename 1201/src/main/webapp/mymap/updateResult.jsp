<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${check > 0}">
			<script type="text/javascript">
				alert("이미 같은 주소로 등록된 맛집이 있습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("맛집 수정 성공");
				window.opener.location.reload();
				history.go(-1);
				//location.href = ".jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("맛집 수정 실패. 다시 입력해주세요.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>