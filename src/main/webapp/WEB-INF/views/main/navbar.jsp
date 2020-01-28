<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="/pro/resources/js/skel.min.js"></script>
<script src="/pro/resources/js/util.js"></script>
<script src="/pro/resources/js/main.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/pro/resources/css/main.css?ver=1" />
<script>
	function poll() {
		$.ajax({
			url : "/pro/alert_check",
			success : function(data) {
				$("#alert_count").text(data);
			},
			error : function() {
				alert("에러입니다. 운영진에 문의해주세요.");
			},
		});
	}
	$(function() {
		if($("#hidden_id" != "")) {
			poll();	
		}
		$('#login_button').click(function() {
			location.href = '/pro/login';
		});
		
		$('#logout_button').click(function() {
			location.href = '/pro/logout';
		});
		$('#mypage_button').click(function() {
			location.href = '/pro/mypage?MEMBER_ID=${id}';
		});
		$('#account_button').click(function() {
			$("#alert_count").text('');
			$("#account_body").append("<div class='spinner-border text-info'></div>");
			$.ajax({
				url : "/pro/alert_list",
				success : function(data) {
					$("#account_body").empty();
					output = "";
					if(data.alert_count > 0) {
						$(data.alert_list).each(function() {
								output += "<tr><td>"+this.member_NAME+"님이 #"
									   + this.alert_REF_ID;
								if(this.alert_CATEGORY == 0) {
									output += " 게시물에 답변을 달았습니다.";
								} else if(this.alert_CATEGORY == 1) {
									output += " 게시물에 댓글을 달았습니다.";
								} else if(this.alert_CATEGORY == 2) {
									output += " 게시물에 추천을 했습니다.";
								} else if(this.alert_CATEGORY == 3) {
									output += " 게시물에 추천을 취소했습니다.";
								}
								output+="<span>"+this.alert_DATE+"</span></td></tr>"
						});
					} else {
						output += "<tr><td>기록된 활동이 없습니다.</td></tr>";
					}
					$("#account_body").append(output);
				},
				error : function() {
					alert("에러입니다. 운영진에 문의해주세요.");
				}
			});
		})
		$('#searchform').submit(function(){
			if($('input[type=search]').val()==''){
				alert('검색어를 입력해주세요');
				return false;
			}
		});
	})
</script>
<style>

.navbar-toggler {
	width : 60px;
	height : 40px;
}
	.nav-wrap {
		height : 60px !important;
	}
@media screen and (min-width: 576px){
	.navbar {
		height : 60px !important;
	}
}

</style>
<div class="nav-wrap">
<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
	<a class="navbar-brand" href="/pro">PFD</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 커뮤니티 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/pro/profile/collection">프로필</a> 
              		<a class="dropdown-item" href="/pro/portfolio/collection">포트폴리오</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=0">자유게시판</a>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=1">스터디</a>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=2">Q&amp;A</a>
				</div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action ="search" method ="get" id="searchform">
			<input class="form-control mr-sm-2" type="search" name="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
			<c:if test="${!empty id}">
				<c:choose>
					<c:when test="${power=='1'}">
						<button id="admin_button" type="button"> <!-- 관리자 -->
							<img src="/pro/resources/Image/icon/person.svg" alt="admin" width="32" height="32">
						</button>
					</c:when>
				</c:choose>
				<button id="account_button" class = "btn" type="button" data-toggle="modal" data-target="#account_modal">
					<img src="/pro/resources/Image/icon/person-fill.svg" alt="account" width="32" height="32"><span id = "alert_count"></span>
				</button><!-- 로그인 중 -->
			</c:if>
			<c:if test="${empty id}">
				<button id = "login_button" class="btn" type="button">
					<img src="/pro/resources/Image/icon/person.svg" alt="login" width="32" height="32">
				</button>
			</c:if>
			
		</form>
	</div>
</nav>
</div>
<div class="modal fade" id="account_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-scrollable" role="document" style="float: right;">
    <div class="modal-content">
      <div class="modal-header">
     	<input type="hidden" id="hidden_id" value ="${id}">
        <h3 class="modal-title" id="exampleModalLabel">${nickname}</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<table class="table table-hover">
      		<tbody id ="account_body">
      		
      		</tbody>
      	</table>
      </div>
      <div class="modal-footer">
        <button id = "mypage_button" type="button" class="btn btn-primary">마이페이지</button>
        <button id = "logout_button" type="button" class="btn btn-secondary">로그아웃</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>