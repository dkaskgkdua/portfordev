<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../main/navbar.jsp" />
<meta charset="UTF-8">
<title>게시판 뷰</title>
<style>
span {
	width: 20px;
}
#no {
	display: none;
}
#count {
	position: relative;
	top: -10px;
	left: -10px;
	background: orange;
	color: white;
	border-radius: 30%;
}
.container {
	padding-top: 55px;
}
#content {
	width:100%
}
.title {
	font-size : 20pt;
	font-weight : bold;
}
</style>
<script>
	$(function() {
		if("${board_data.BOARD_CATEGORY}"=="0") {
			$('#h3_category').text("자유게시판");
		} else if("${board_data.BOARD_CATEGORY}"=="1"){
			$('#h3_category').text("스터디");
		} else {
			$('#h3_category').text("Q&A");
		}
		
		
		$("#write").click(function() {
			buttonText = $("#write").text();
			content = $("#content").val();
			$(".float-left").text('총 50자까지 가능합니다.');
			if (buttonText == "등록") { //추가 하는 경우
				url = "CommentAdd.bo";
				data = {
					"content" : content,
					"id" : $("#loginid").val(),
					"BOARD_RE_REF" : $("#BOARD_RE_REF").val()
				};
			} else { // 수정하는 경우
				url = "CommentUpdate.bo";
				data = {
					"num" : num,
					"content" : content
				};
				$("#write").text("등록");
			}
			$.ajax({
				type : "post",
				url : url,
				data : data,
				success : function(result) {
					$("#content").val('');
					if (result == 1) {
						getList();
					}
				}
			})
		})
		function getList() {
			$.ajax({
						type : "post",
						url : "CommentList.bo",
						data : {
							"BOARD_RE_REF" : $("#BOARD_RE_REF").val()
						},
						dataType : "json",
						success : function(rdata) {
							if (rdata.length > 0) {
								$("#comment table").show(); //문서 로딩될 때 숨긴게 나온다.
								$("#comment thead").show();
								$("#comment tbody").empty();
								$("#message").text('');
								output = '';
								$(rdata).each(function() {
													img = '';
													if ($("#loginid").val() == this.id) {
														img = "<img src='resources/Image/pencil2.png' width = '15px' class='update'>"
																+ "<img src='resources/Image/remove.png' width = '15px' class='remove'>"
																+ "<input type='hidden' value='" +this.num + "'>";
													}
													output += "<tr><td>"
															+ this.id
															+ "</td>";
													output += "<td>"
															+ this.content
															+ "</td>";
													output += "<td>"
															+ this.reg_date
															+ img
															+ "</td></tr>";
												});
								$("#comment tbody").append(output);
							} else {
								$("#message").text("등록된 댓글이 없다.");
								$("#comment thead").hide();
								$("#comment tbody").empty();
							}
							$("#count").text(rdata.length);
						}
					})
		}
		$(".start").click(function() {
			getList();
		});
		// 수정버튼 클릭경우(댓글)
		$("#comment").on('click', '.update', function() {
			before = $(this).parent().prev().text(); 
			$("#content").focus().val(before); 
			num = $(this).next().next().val(); 
			$("#write").text("수정완료"); 
			$(this).parent().parent().css('background', 'lightgray');
		});
		// 삭제버튼 클릭경우(댓글)
		$("#comment").on('click', '.remove', function() {
			var num = $(this).next().val();//댓글번호
			$.ajax({
				type : "post",
				url : "CommentDelete.bo",
				data : {
					"num" : num
				},
				success : function(result) {
					if (result == 1)
						getList();
				}
			})
		})
	})
</script>
</head>
<body>
	<input type="hidden" id="loginid" value="${id}" name="loginid">
	<div class="container">
		<h3 id ="h3_category" class="float-left"></h3> 	
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>
						<a href="/pro/profile?id=${board_data.MEMBER_ID}">${board_data.MEMBER_NAME}
							<span style ="font-size:10pt">
								<img src="resources/Image/icon/award.svg" alt="act" width="14" height="14">${board_data.MEMBER_ACT}
							</span>
							<br>
							<span style="font-size:9pt">${board_data.BOARD_DATE}에 작성됨</span>
						</a>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="title">
							<c:if test="${board_data.BOARD_RE_LEV !=0}">
								<c:forEach var="a" begin="0" end="${board_data.BOARD_RE_LEV}" step="1">
									[re]
								</c:forEach>
							</c:if>
							${board_data.BOARD_SUBJECT}
						</div>
						<hr>
						<div>${board_data.BOARD_CONTENT}</div>
					</td>
				</tr>
				<c:if test="${!empty board_file_list}">
				<tr>
					<td>
						<div>첨부파일</div>
						<div>
						<c:forEach var="files" items="${board_file_list}">
							<img src="resources/Image/down.png" width ="12px">
							<a href="BoardFileDown.bo?filename=${files.BOARD_FILE_ID}&original=${files.BOARD_FILE_ORIGINAL}">
								${files.BOARD_FILE_ORIGINAL}</a>
							&#32;/&#32;
						</c:forEach>
						</div>
					</td>
				</tr>
				</c:if>
			<tr>
				<td class="center">
					<button style="background:transparent"><img src="resources/Image/icon/heart.svg" width ="18px"> ${board_data.BOARD_RECO}</button>
					<button style="background:transparent"><img src="resources/Image/icon/eye.svg" width ="20px"> ${board_data.BOARD_READCOUNT}</button>
					<button class="btn btn-primary">답변</button>
					<c:if test="${board_data.MEMBER_ID == id}">
						<a href="BoardModifyView.bo?num=${board_data.BOARD_ID}">
							<button style="background:transparent"><img src="resources/Image/icon/pencil.svg" width ="25px"></button>
						</a>
						<a href="#">
							<button style="background:transparent" data-toggle="modal"
								data-target="#myModal"><img src="resources/Image/icon/trash.svg" width ="25px"></button>
						</a>
					</c:if> 
					<a href="/pro/board_list">
						<button class="btn btn-primary">목록</button>
					</a>
				</td>
			</tr>
			</tbody>
		</table>
		<div id="comment">
			<table class="table table_striped">
				<thead>
					<tr>
						<td>댓글 (${board_data.BOARD_COMMENT}개)</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty comment_list}">
					<c:forEach var="comments" items="${comment_list}">
					<tr>
						<td>
							${comments.MEMBER_NAME}
							<span style ="font-size:10pt">
								<img src="resources/Image/icon/award.svg" alt="act" width="14" height="14">${comments.MEMBER_ACT}
							</span>
							<br>
							${comments.BOARD_CO_DATE}
							<hr>
							${comments.BOARD_CO_CONTENT}
						</td>
					</tr>
					</c:forEach>
					</c:if>
					<tr>
						<td>
							<span style="color:gray">총 80자까지 가능합니다.</span>
							<textarea class="float-left" rows="2" name="content" id="content" maxLength="80"></textarea>
							<button type="button" id="write" class="btn btn-info float-right">등록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		<%-- delete 모달 --%>
	<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">


					<!-- Modal body -->
					<div class="modal-body">
						<form name="deleteForm" action="BoardDeleteAction.bo"
							method="post">
							<div class="form-group">
								<label for="pwd">비밀번호</label> 
								<input type="password"
									class="form-control" placeholder="Enter password"
									name="BOARD_PASS" id="board_pass">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
			</div>
		</div> 
	</div>
</body>
</html>