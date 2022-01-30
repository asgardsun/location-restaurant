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
		<c:when test="${nameCheck > 0}">
			<script type="text/javascript">
				alert("이미 등록된 맛집 입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("맛집 등록 성공");
				history.go(-1);
				//location.href = ".jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("맛집 등록 실패. 다시 입력해주세요.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>