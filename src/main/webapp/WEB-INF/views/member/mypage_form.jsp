<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>MyPage-${MEMBER.MEMBER_NAME}</title>
<style>
article {
	width: 70%;
	height: 80%;
	float: right; 
	padding: 25px;
}
aside {
	width: 30%;
	height: 80%;
	float: left; 
	padding: 25px;
}
section {
	width : 100%;
	height : 730px;
}
.user_info {
	display : inline-block;
}
.center-block {
	display : flex;
	justify-content:center; /* 가운데 정렬 */
}
.user_info_score {
	text-align: center;
}
.avatar {
	width : 100px;
	border-radius : 30px;
}
.avatar_wrapper {
	text-align: center;
}
@media screen and (max-width:840px) {
	aside, article, footer, section {
		display: contents;
	}
	
	#date_span {
		display : inline-block;
	}
}
</style>
<script>
	$(function() {
		var pass_toggle = 0;
		$("#password_change_btn").click(function() {
				var pass_check = "<div class='form-group'>"
							+ "<label for='MEMBER_PASSWORD'>비밀번호</label>"
							+ "<input type='password' class='form-control' name='MEMBER_PASSWORD' id='MEMBER_PASSWORD'></div>"
							+ "<div class='form-group'>"
							+ "<label for='MEMBER_PASSWORD_CHECK'>변경 비밀번호</label>"
							+ "<input id='MEMBER_PASSWORD_CHECK' type='password' name='MEMBER_PASSWORD_CHECK'></div>";
				$("#info_set").append(pass_check);
				$("#password_change_btn").css("display","none");
				pass_toggle = 1;
		});
		$("#edit_form").submit(function() {
			if($.trim($("#MEMBER_NAME").val()) == "") {
				alert("닉네임을 입력하세요.");
				$("#MEMBER_NAME").focus();
				return false;
			}
			if(pass_toggle == 1) {
				var password_pattern = /^\w{6,15}$/;
				if (!password_pattern.test($('#MEMBER_PASSWORD').val())) {
					alert("비밀번호를 6자리~15자리로 맞춰주세요.(문자, 숫자, _ )");
					$('#MEMBER_PASSWORD').focus();
					return false;
				}
				if (!password_pattern.test($('#MEMBER_PASSWORD_CHECK').val())) {
					alert("비밀번호를 6자리~15자리로 맞춰주세요.(문자, 숫자, _ )");
					$('#MEMBER_PASSWORD_CHECK').focus();
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
	<section>
		<aside>
			<div class="list-group">
				<a href="/pro/mypage?MEMBER_ID=${MEMBER.MEMBER_ID}" class="list-group-item list-group-item-action">최근 활동</a> 
				<c:if test="${MEMBER.MEMBER_ID == id}">
					<a href="/pro/mypage/info?MEMBER_ID=${MEMBER.MEMBER_ID}" class="list-group-item list-group-item-action">정보 수정</a>
				</c:if> 
				<a href="/pro/profile?idch=${MEMBER.MEMBER_ID}" class="list-group-item list-group-item-action">프로필</a>
			</div>
		</aside>
	<article>
		<div>
			<div class="avatar_wrapper">
				<c:if test="${!empty profile_img}">
					<img src="/pro/resources/upload/${profile_img}" alt="avatar" class="avatar">
				</c:if>
				<c:if test="${empty profile_img}">
					<img src="/pro/resources/Image/icon/default_user.png" alt="avatar" class="avatar">
				</c:if>
			</div>
			<div class="container">
				<div class="user_nick">
					<h3>${MEMBER.MEMBER_NAME}</h3><h5>${MEMBER.MEMBER_DATE}</h5>
				</div>
				<div class="user_infos">
					<div class="user_info">
						<div class="user_info_label">
							활동점수
						</div>
						<div class="user_info_score">
							${MEMBER.MEMBER_ACT}
						</div>
					</div>
					<c:if test="${MEMBER.MEMBER_ID == id}">
					<div class="user_info">
						<div class="user_info_label">
							포인트
						</div>
						<div class="user_info_score">
							${MEMBER.MEMBER_POINT}
						</div>
					</div>
					</c:if>
					
				</div>
		
		
				<c:choose>
				<c:when test="${menu eq '정보수정'}">
				  <div>
					<form action="/pro/member_edit" id="edit_form" name="edit_form" method="post">
						<fieldset id="info_set">
							<input type="hidden" name ="MEMBER_ID" value="${MEMBER.MEMBER_ID}">
							<div class="form-group">
								<label for="MEMBER_NAME">닉네임</label>
								<input type="text" name = "MEMBER_NAME" class="form-control" id="MEMBER_NAME" value="${MEMBER.MEMBER_NAME}">
							</div>
						</fieldset>
						<button type="submit" class="btn" style="background : rgb(83, 133, 193); color:white;">수정</button>
							<button id="password_change_btn" class="btn btn-secondary" type="button">비밀번호 변경</button>
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#withdraw">회원탈퇴</button>
					</form>
				  </div>
					
				</c:when>
				<c:when test="${menu eq '최근활동'}">
					<table class= "table table-hover">
					<tbody>
					<c:if test="${list_count==0}">
						<tr><td>기록된 활동이 없습니다.</td></tr>
					</c:if>
					<!-- 기록이 있을 경우 -->
					<c:if test="${list_count > 0}">
						<c:forEach var ="log" items="${member_log_list}">
							<tr>
								<td>									
									<c:choose>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '0'}">
										<a href="/pro/board_view_action?board_id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;게시물을 작성하였습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '1'}">
										<a href="/pro/board_view_action?board_id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;게시물에  댓글을 남겼습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '2'}">
										<a href="/pro/log_to_profile?id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;포트폴리오를 작성하였습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '3'}">
										<a href="/pro/log_to_profile?id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;포트폴리오에 피드백을 남겼습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '4'}">
										<a href="/pro/board_view_action?board_id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;게시물을 추천 하였습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '5'}">
										<a href="/pro/board_view_action?board_id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;게시물을 추천 취소하였습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '6'}">
										<a href="/pro/log_to_profile?id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;포트폴리오를 추천하였습니다.</a>
									</c:when>
									<c:when test="${log.MEMBER_LOG_CATEGORY eq '7'}">
										<a href="/pro/log_to_profile?id=${log.MEMBER_REF_ID}">#${log.MEMBER_REF_ID}&nbsp;포트폴리오를 추천 취소하였습니다.</a>
									</c:when>
									<c:otherwise>
										<h3>분류가 없음</h3>
									</c:otherwise>
									</c:choose>
									<span id = "date_span">&nbsp;${log.MEMBER_LOG_DATE}</span>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
					</table>
					<c:if test="${list_count > 0}">
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
									href="/pro/mypage?page=${page-1}&MEMBER_ID=${MEMBER.MEMBER_ID}" class="page-link">이전</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${start_page}" end="${end_page}">
								<c:if test="${a == page}">
									<li class="page-item"><a class="page-link" href="#">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page}">
									<li class="page-item"><a href="/pro/mypage?page=${a}&MEMBER_ID=${MEMBER.MEMBER_ID}"
										class="page-link">${a}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= max_page }">
								<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page < max_page }">
								<li class="page-item"><a
									href="/pro/mypage?page=${page+1}&MEMBER_ID=${MEMBER.MEMBER_ID}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<h3>test3</h3>
				</c:otherwise>
				</c:choose>
			
			</div>
		</div>
	</article>
	</section>
<jsp:include page="../main/footer.jsp" />
<div class="modal fade" id="withdraw">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원 탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       	 <form action="/pro/member_withdraw" name="withdraw_modal" method="post">
       	  <input type="hidden" value="${MEMBER.MEMBER_ID}" name="MEMBER_ID">
          <div class="form-group">
			<label for="">비밀번호를 입력하세요.</label>
			<input type="password" name = "MEMBER_PASSWORD" class="form-control" id="MEMBER_PASSWORD">
			</div>
			<button type="submit" class="btn btn-danger">탈퇴</button> 
			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		 </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>