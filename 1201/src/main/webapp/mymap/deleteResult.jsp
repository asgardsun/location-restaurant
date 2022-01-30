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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("맛집 정보 삭제 성공");
			window.opener.location.reload();
		    window.close();

		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("맛집 정보 삭제 실패. 관리자에게 문의하세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>