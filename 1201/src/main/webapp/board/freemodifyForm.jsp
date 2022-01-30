<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<thead>
	<tr>
		<td><jsp:include page="/menu.jsp" flush="false" /></td>
	</tr>
</thead>
<script type="text/javascript">
$(function(){
	$("a[name='fileDeleteBtn']").on("click", function() {
		$(this).parent().remove();
		var d = $(this).data("uuid");
		$.ajax({
			url: "fileDelete",
			data: {"uuid" : d},
			type: "post",
			dataType: "json",
			success: function(result){
				if(result){
					alert("file 삭제 성공");
				}else{
					alert("file ajax() 삭제 실패");
				}
			},
			error: function(){
				alert("file ajax() 삭제 오류");
			}
		});
	});
});

</script>
<br>
	<div align="center">
		<h1 style="font-weight: bold;">게시글 수정</h1>
	</div>
<div class="container">
	<div style="border-top: 2px solid black;"></div>		
	<div class="form-group">
	<form action="modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
			<input type="hidden" name="num" value="${fboard.num}">
		<table class="table">
			<tr>	
				<th>제목</th>
				<td><input class="form-control col-md-6" type="text" name="title" value="${fboard.title}"></td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" rows="20" name="content">${fboard.content}</textarea>
				</td>
				</tr>
		<tr>
			<th></th>
				<td>
						<c:choose>
							<c:when test="${empty freeImgList}">
								<p><input type="file" name="file" multiple="multiple"></p>
							</c:when>
								<c:otherwise> 
									<c:forEach items="${freeImgList}" var="freeImg">
										<div>
											${freeImg.originName}
											<a href="#this" name="fileDeleteBtn" class="btn" data-uuid="${freeImg.uuid}">삭제</a>	
										</div>									
	        						</c:forEach>
	        						<!-- 파일 추가하기 -->
	        						<div>
	        						<input type="file" name="file" multiple="multiple">
	        						</div>
								</c:otherwise>
						</c:choose>
			</td>
		</tr>	
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value = "수정">
						<input type="reset"  value = "다시작성">
						<input type="button" value ="목록" onclick="location.href='freeboard'">
					</td>
				</tr>
		</table>
	</form>
	</div>
</div>
	<jsp:include page="/rightmenu.jsp" flush="false" />	
