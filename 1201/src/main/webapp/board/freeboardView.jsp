<%@page import="members.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="member" class="members.Members" scope="page"/>
<jsp:setProperty property="*" name="member"/>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style.css">
<thead>
	<tr>
		<td><jsp:include page="/menu.jsp" flush="false" /></td>
	</tr>
</thead>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/js/reply.js"></script>
<script type="text/javascript">
//let
let gBno = '${fboard.num}',
	gBoardWriter = '${fboard.userid}',
	gRno = 0,
	gReplytext = null;
	$(function() {	//문서가 로딩되면 실행할 함수
		$("#Replyregister").on("#btnRegister",function(){
			//만약에 필수요소가 제대로 채워지지 않았으면 return false;
			var result = boardCheck("Replyregister");
			if(!result){		
				return false;
			}
		});
		//추천,비추천
		$('.like').click(function(e) {
			e.preventDefault();
			if("${fboard.free_like_status}"==0){
				alert("등록요청");
				location.replace('/board/like/add?num=${fboard.num}'); 
			}
			if("${fboard.free_like_status}"==1){
				alert("추천 삭제");
				location.replace('/board/like/modify?num=${fboard.num}&status=3'); 
			}
			if("${fboard.free_like_status}"==2){
				alert("이미 비추천을 누르셨습니다.");
				return false;
			}
			if("${fboard.free_like_status}"==3){
				alert("등록요청");
				location.replace('/board/like/modify?num=${fboard.num}&status=1'); 
			}
		});
		
		$('.unlike').click(function(e) {
			e.preventDefault();
			if("${fboard.free_like_status}"==0){
				alert("등록요청");
				location.replace('/board/unlike/add?num=${fboard.num}'); 
			}
			if("${fboard.free_like_status}"==1){
				alert("이미 추천을 누르셨습니다.");
				return false;
			}
			if("${fboard.free_like_status}"==2){
				alert("비추천 삭제");
				location.replace('/fboard/unlike/modify?seq=${fboard.num}&status=3'); 
			}
			if("${fboard.free_like_status}"==3){
				alert("등록요청");
				location.replace('/fboard/unlike/modify?seq=${fboard.num}&status=2'); 
			}
			
		});

			/*댓글 목록 그리기 */
		replyList(1);
		var num = ${fboard.num};
		$("#btnRegister").on("click",function(){
			//replyForm에 작성된 내용을 DB에 쓰기 후, 결과 받아와서 처리
			var data = $("#Replyregister").serialize();
			var replyer = $('#replyer');
			$.ajax({
				url : "${contextPath}/freereply/register?num="+num,
				data : data,
				type : "post",
				dataType : "json",
				success : function(result){
					if(result){
						//댓글 등록 성공
						alert("등록 완료");
						location.reload();
						//새로운 댓글 목록 그리기
					}else{
						//댓글 등록 실패
						alert("오류가 발생했습니다.계속 발생한다면 문의하세요.")
					}
				},
				error : function(){
					alert("예외발생")
					//예외 발생
				}
			});//ajax end
			   //boardView 요청을 진행 중.. 진행하지 못하도록 return false;
			return false;
		});//on submit end	
	});

	//댓글 총 수 불러오는 함수
	function getReplyCnt(){
		var fboardNum = '${fboard.num}';
		var replyCount;
		$.ajax({
				url: "reply/getReplyCnt",
				data: {"fboardNum" : fboardNum},
				type: "get",
				async: false,
				dataType: "json",
				success: function(result){
						var table = $("#replyTable");
						table.append($("<tr><th colspan='4'>댓글"+"</th></tr>"));
				},
				error:function(){
					alert("댓글 수 불러오기 에러")
				}
		});
		return replyCount;
	}
	
	function replyList(num){
			var table = $("#replyTable");			
			$("#replyTable tr:gt(0)").remove();
			var recommNum = ${fboard.num};
			getReplyCnt();
			$.ajax({
				url : "${contextPath}/freereply/all",
				data : {"fboardNum" : '${fboard.num}',"curPage":num},
				type : "get",
				dataType : "json",
				success : function(data){
					//data는 list
					var rnum = (Number(num) * 10) -9;
					var rPager = data.rPager;
					console.log(rPager);
					console.log(rPager.curPage);
					console.log(rPager.totalPage);
					if(rPager.curPage != 1){
						$("#left").attr("class", "page-item");
					}
					if(rPager.curPage == rPager.totalPage){
						$("#right").attr("class", "page-item disabled");
					}
					for(var i in data.replyTable){
					//등록일자 얻어오기
					var upDateDate = new Date(data.replyTable[i].upDateDate);
					var year = upDateDate.getFullYear();
					var month = upDateDate.getMonth()+1;
					month = month >= 10 ? month: '0'+month;
					var date = upDateDate.getDate();
					date = date >= 10 ? date: '0'+ date;
					var hour = upDateDate.getHours()+9;
					hour = hour >= 10 ? hour : '0'+hour;
					var minute = upDateDate.getMinutes();
					minute = minute >= 10 ? minute : '0'+minute;
					var finalDate = year+"-"+month+"-"+date+" "+hour+":"+minute;
					var content = data.replyTable[i].content;

					
//					var tr = $("<tr>");
//	 				var num = data.replyTable[i].free_reply_num;
//	 				var userid = data.replyTable[i].userid;
//	 				var content = data.replyTable[i].content;
				
					//수정폼
					var modiForm = $("<form></form");
					var modiText = $("<div id='modi"+i+"'class='collapse'><input type='hidden' name='num' value='"+data.replyTable[i].num+"'><input type='hidden' name='userid' value='"+data.replyTable[i].userid+"'><br><textarea class='form-control' name='content' rows='5'>"+ data.replyTable[i].content + "</textarea></div>");
					
					//삭제폼
					var delForm = $("<form></form>");
					var delText = $("<div id='del"+i+"' class='collapse'><input type='hidden' name='num' value='"+data.replyTable[i].num+"'></div>");
					
					
					//수정 확인버튼
					var rbtnModify = $("<button type='button' class='btn btn-link'>수정</button>");
					modiText.append(rbtnModify);
					modiForm.append(modiText);
					
					//삭제 확인버튼				
					var rbtnRemove = $("<button type='button' class='btn btn-link'>ok</button>");
					delText.append(rbtnRemove);
					delForm.append(delText);
					
					var tr = $("<tr>");					
					tr.append($("<td>" +rnum+ "</td>"));
					rnum++;
					tr.append($("<td><a href='#'>"+data.replyTable[i].userid+"</a><br>"+finalDate+"</td>"));
					tr.append($("<td>").text(content).append(modiForm));
					tr.append($("<td>").append(delForm));
					
					var modiBtn = $("<button type='button' class='btn btn-link btn-sm' data-toggle='collapse' data-target='#modi"+i+"'> 수정 </a>");
					var delBtn = $("<button type='button' class='btn btn-link btn-sm' data-toggle='collapse' data-target='#del"+i+"'> 삭제 </a>");
					//신고버튼
					//disabled 설정하기
										
//					var currId = table.closest("div").find("input[name='currId']").val();
//	 					alert(currId);
//					if(currId != data.replyTable[i].userid){
//						console.log("아이디 일치하지 않음");
//						modiBtn.css("display", "none");
//						delBtn.css("display", "none");
//					}else{
//						console.log("아이디 일치");
//						modiBtn.css("display", "true");
//						delBtn.css("display", "true");
//					}
					
					modiBtn.on("click", function(){
						var delBtn = $(this).next();
						if (delBtn.attr('disabled') == 'disabled') {
							delBtn.removeAttr('disabled');
						} else {
							delBtn.attr('disabled', 'true');
						}
					});
					delBtn.on("click", function(){
						var modiBtn = $(this).prev();
						if (modiBtn.attr('disabled') == 'disabled') {
							modiBtn.removeAttr('disabled');
						} else {
							modiBtn.attr('disabled', 'true');
						}
					});
				
			    //수정확인
				rbtnModify.on("click",function(){
					var d = $(this).closest("form").serialize();			
					$.ajax({
							url : "${contextPath}/freereply/modifyReply",
							type: "post",
							data : d,
							dataType:"json",
							success:function(result){
								if(result){
									alert("수정완료");
									replyList(num);
								}else{
									alert("수정실패");
								}	
							}			
					});
					return false;
				});
				//삭제확인
				rbtnRemove.on("click",function(){
					var d = $(this).closest("form").serialize();
					$.ajax({
						url : "${contextPath}/freereply/removeReply",
						type : "post",
						data : d,
						dataType:"json",
						success: function(result){
							if(result){
								alert("삭제완료");
								replyList(num);
							}else{
								alert("삭제실패");
							}
						}
					});
					return false;
				});								
				table.append(tr);
			}
		},
		error: function(){
			alert("list 오류");
		}		
		});
	}
	</script>
	<% 
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(member.getUserId(), member.getUserPw());
	if(result == 1)
	session.setAttribute("userId", member.getUserId());
	
	%>
	<br>
	<div align="center">
		<h1 style="font-weight: bold;">홍보 게시판</h1>
	</div>
	<fmt:formatDate value="${fboard.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
		<div class="container">
				<input type="button" class="btn btn-outline-secondary" value="목록" onclick="location.href='freeboard'">
				<!--  <input type="hidden" value="<sec:authentication property="principal.Username" var="id"/>">-->
				<c:if test="${userId eq fboard.userid}">			
					<input type="button"class="btn btn-outline-secondary" value="수정" onclick="location.href='modify?num=${fboard.num }'"> 
					<input type="button" class="btn btn-outline-secondary" value="삭제" onclick="location.href='remove?num=${fboard.num }'"> 
					<input type="button" class="btn btn-outline-secondary" value="새글쓰기" onclick="location.href='register'">
				</c:if>

	<div class="table-responsive">
		<table class="table">
			<tr>
				<th>제목</th>
				<td>${fboard.title}</td>
			</tr>
			<tr>
				<th>작성자</th>		
				<td class="article_writer">${fboard.userid}</td>
			</tr>
			<tr>
				<th>입력일</th>
				<td>${regDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${fboard.content}</td>
			</tr>
		<tr>
			<th>이미지</th>
				<td>
					<div>
						<c:choose>
							<c:when test="${empty freeImgList}">
								<p>첨부된 파일이 없습니다.</p>
							</c:when>
								<c:otherwise> 
									<c:forEach items="${freeImgList}" var="freeImg" varStatus="vs">
										<div>
											<img src="downloadThumb?uuid=${freeImg.uuid }" style="width: 65%; height: auto;">
											<br><br>
										</div>
	        						</c:forEach>
								</c:otherwise>
						</c:choose>
					</div>	
			</td>
		</tr>
		</table>
		</div>
	</div>
	<!-- 댓글 목록 div -->
	<div class="container">
		<table  class="table table-hover" id="replyTable">
		<c:if test="${userId eq fboard.userid}">
			<thead></thead>
		</c:if>
		</table>
	</div>
	<!-- 페이징 -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<li id="left" class="page-item disabled">
				<a class="page-link" href="javascript:replyList(1))">&laquo;</a>
			</li>
			<c:forEach var="num" begin="${rPager.blockBegin}" end="${rPager.totalPage}">
				<li class='${rPager.curPage == num ? "active" : "page-item"}'>
					<a class="page-link" href="javascript:replyList(${num})">[${num}]</a>
				</li>
			</c:forEach>
			<li id="right" class="page-item">
				<a class="page-link" href="javascript:replyList(${rPager.totalPage })">&raquo;</a>
			</li>
		</ul>
	</div>
	
	
	<div>
	<!-- 댓글등록 -->
	</div>
	<div class="container">
		<form id="Replyregister">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="boardNum" value="${fboard.num}">
			<table class="table">
				<tr>
					<td>
						<input type="hidden" id="replyer" name="userid" value="${userId}">
					</td>
					<th>내용</th>
					<td>
					<textarea rows="3" cols="100" name="content"></textarea>
						<input type="submit" value="등록" id="btnRegister">
					</td>
				</tr>
			</table>
		</form>
	</div>	
<jsp:include page="/rightmenu.jsp" flush="false" />		