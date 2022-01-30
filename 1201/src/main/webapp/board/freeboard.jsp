<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" type="text/css"
	href="/resources/css/style.css">
<thead>
	<tr>
		<td><jsp:include page="/menu.jsp" flush="false" /></td>
	</tr>
</thead>
<title>게시글목록</title>
<style type="text/css">
.container{
	margin: 0 20% 0 20%;
}
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
}
</style>
<hr>
<div class="container">
	<h3>홍보게시판</h3>
	<div id="table-responsive">
		<div class="buttondiv" style="margin-top: 10px; margin-bottonm: 10px;">
			<!-- 로그인이 안되있을 경우 글쓰는 권한 X -->
		<%
			String userId = null;
			if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		%>
		<button type ="button" class="btn btn-outline-secondary" onclick="location.href='register'">게시글 등록</button>
		<% }else {%>
		<%} %>
		</div>
		<div style="border-top: 2px solid black;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeboard}" var="fboard">
						<tr>
							<td>${fboard.num}</td>
							<td style="width: 50%;">
							<a href="freeboardView?num=${fboard.num}" class=".text-muted">${fboard.title}
									<span class="badge"><i class="fa fa-comment-o"></i>${fboard.replyCount}</span>
							</a></td>
							<td>${fboard.userid}</td>
							<td><fmt:formatDate value="${fboard.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${fboard.readCount}</td>
							<td>${fboard.recommCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
    		<div class="pageInfo_wrap" >
        		<div class="pageInfo_area">
       	 		</div>
   			</div>
		</div>
		
		<div class="search_area" style="text-align: center; border-top: 2px solid black;">
				<form id="searchForm" action="/board/freeboard" method="get">
					<select name="type">
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected': ''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected': ''}"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected': ''}"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected': ''}"/>>제목+내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'?'selected': ''}"/>>제목+작성자</option>
						<option value="TCW"
							<c:out value="${pageMaker.cri.type eq 'TCW'?'selected': ''}"/>>제목+내용+작성자</option>
					</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="<c:out value="${pageMaker.cri.keyword}"/>" /> 						
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' />
						<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class="btn btn-default">검색</button>
				</form>
		</div>
		<div style="border-top: 2px solid black;"></div>
		<br>
	</div>
	<ul class="pagination justify-content-center">
		<li class='${pageMaker.prev == true ? "page-item ":"page-item disabled"}'>
			<a class="page-link" href="freeboard?pageNum=${pageMaker.startPage-1}&type=${param.type}&keyword=${param.keyword}">이전</a></li>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class='${pageMaker.cri.pageNum == num ? "active" : "page-item"}'>
				<a class="page-link" href="freeboard?pageNum=${num}&type=${param.type}&keyword=${param.keyword}">[${num}]</a>
			</li>
		</c:forEach>
		<li class=' ${pageMaker.next == true ? "page-item":"page-item disabled"}'>
		<a class="page-link" href="freeboard?pageNum=${pageMaker.endPage +1}&type=${param.type}&keyword=${param.keyword}">다음</a>
		</li>
	</ul>
</div>
<jsp:include page="/rightmenu.jsp" flush="false" />
