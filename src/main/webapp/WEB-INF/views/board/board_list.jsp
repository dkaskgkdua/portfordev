<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>커뮤니티</title>
<script>
	$(function() {
		if($("#BOARD_CATEGORY").val()=="0") {
			$('#h3_category').text("자유게시판");
		} else if($("#BOARD_CATEGORY").val()=="1"){
			$('#h3_category').text("스터디");
		} else {
			$('#h3_category').text("Q&A");
		}	
		$("#search_select").val("${search_select}").prop("selected", true);
		$("#search_text").val("${search_text}");
	});
</script>
<style>
	#search_select {
		width : 28%;
	}
	#search_text {
		margin-left : 5px;
		width : 50%;
	}
	#search_btn {
		margin-left : 5px;
		width : 18%;
	}
	
	.center-block {
		display : flex;
		justify-content:center; /* 가운데 정렬 */
	}
	#search_form {
		display: inline-block;
		justify-content:center;
		width : 100%;
	}
	#add_board_button {
		background : #53acf1 !important;
		color : white !important;
	}
	.container {
		min-height : 1000px;
		height : 80%;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h3 id ="h3_category" class="float-left"></h3> 
		<a href ="/pro/board_write?BOARD_CATEGORY=${BOARD_CATEGORY}" id="add_board_button" 
			class="write btn float-right">글쓰기</a>
		<form id = "search_form" action="board_list">
				<select name="search_select" size="1" id="search_select" class = "float-left">
					<option value="0">작성자</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
				</select>
				<input type="hidden" id="BOARD_CATEGORY" name ="BOARD_CATEGORY" value="${BOARD_CATEGORY}">
				<input type="hidden" id="sort" name = "sort" value="${sort}">
				<input type="text" id="search_text" name="search_text" placeholder="검색할 내용을 입력하세요." class="float-left">
				<button type="submit" id="search_btn" class="float-left" style="color:white">검색</button>
			</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th class ="d-none d-lg-table-cell" width="7%"><div>번호</div></th>
					<th width="45%"><div>제목</div></th>
					<th width="15%"><div>작성자</div></th>
					<th class ="d-none d-sm-table-cell" width="13%">
						<div>
							<a href="board_list?page=${a}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=DATE">작성일</a>
						</div>
					</th>
					<th class ="d-none d-sm-table-cell" width="10%">
						<div>
							<a href="board_list?page=${a}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=READCOUNT">조회</a>
						</div>
					</th>
					<th class ="d-none d-sm-table-cell" width="10%">
						<div>
							<a href="board_list?page=${a}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=RECO">추천</a>
						</div>
					</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="num" value="${list_count-(page-1)*15}" />

				<!--  게시글이 없는 경우 -->
				<c:if test="${list_count == 0 }">
					<tr>
						<td colspan="6" style="text-align: center">등록된 글이 없습니다.</td>
					</tr>
				</c:if>

				<%-- 게시글이 있는 경우 --%>
				<c:if test="${list_count > 0 }">
					<c:forEach var="b" items="${board_list}">
						<tr>
							<td class = "d-none d-lg-table-cell">
								<c:out value="${num}" /> 
								<c:set var="num" value="${num-1}" />
							</td>
							<td>
								<div>
									<c:if test="${b.BOARD_RE_LEV != 0}">
										<!-- 답글인 경우 -->
										<c:forEach var="a" begin="0" end="${b.BOARD_RE_LEV*2}"
											step="1">&nbsp;
						 				</c:forEach>
										<img src='resources/Image/AnswerLine.gif'>
									</c:if>
									<c:if test="${b.BOARD_RE_LEV ==0}">
										<!-- 원문인 경우 -->
						 				&nbsp;
						 			</c:if>
									<a href="/pro/board_view_action?board_id=${b.BOARD_ID}">
										${b.BOARD_SUBJECT}&nbsp;<span class="board_comment">&#91;${b.BOARD_COMMENT}&#93;</span>
									</a>
								</div>
							</td>
							<td>
								<div>
									<a href="/pro/mypage?MEMBER_ID=${b.MEMBER_ID}">${b.MEMBER_NAME}
										<span style ="font-size:10pt">
											<img src="resources/Image/icon/award.svg" alt="act" width="14" height="14">${b.MEMBER_ACT}
										</span>
									</a>
								</div>
							</td>
							<td class = "d-none d-sm-table-cell">
								<div>${b.BOARD_DATE}</div>
							</td>
							<td class = "d-none d-sm-table-cell">
								<div>${b.BOARD_READCOUNT}</div>
							</td>
							<td class = "d-none d-sm-table-cell">
								<div>${b.BOARD_RECO}</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>

		

		<c:if test="${list_count > 0 }">
			
			
			<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page <= 1 }">
								<li class="page-item"><a class="page-link" href="#">이전&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="board_list?page=${page-1}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=${sort}" class="page-link">이전</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${start_page}" end="${end_page}">
								<c:if test="${a == page }">
									<li class="page-item"><a class="page-link" href="#">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<li class="page-item"><a href="board_list?page=${a}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=${sort}"
										class="page-link">${a }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= max_page }">
								<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page < max_page }">
								<li class="page-item"><a
									href="board_list?page=${page+1}&search_select=${search_select}&search_text=${search_text}&BOARD_CATEGORY=${BOARD_CATEGORY}&sort=${sort}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>