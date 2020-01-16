<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
<link rel="stylesheet" href="resources/css/main.css?ver=1" />
<script>
	$(function() {
		$('#login_button').click(function() {
			location.href = '/pro/login';
		})
		
		$('#logout_button').click(function() {
			location.href = '/pro/logout';
		})
	})
</script>
<style>
#account_modal {
	width : 200px;
	justify-content : flex_end;
}
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
					<a class="dropdown-item" href="profile">포트폴리오</a> 
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=0">자유게시판</a>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=1">스터디</a>
					<a class="dropdown-item" href="/pro/board_list?BOARD_CATEGORY=2">Q&A</a>
				</div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action ="search" method ="get">
			<input class="form-control mr-sm-2 " type="search" name="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
			<c:if test="${!empty id}">
				<c:choose>
					<c:when test="${power=='1'}">
						<button id="admin_button" type="button">
							<img src="resources/Image/icon/person.svg" alt="admin" width="32" height="32">
						</button>
					</c:when>
				</c:choose>
				<button id="account_button" class = "btn" type="button" data-toggle="modal" data-target="#account_modal">
					<img src="resources/Image/icon/person-fill.svg" alt="account" width="32" height="32">
				</button>
			</c:if>
			<c:if test="${empty id}">
				<button id = "login_button" class="btn" type="button">
					<img src="resources/Image/icon/person.svg" alt="login" width="32" height="32">
				</button>
			</c:if>
			
		</form>
	</div>
</nav>
</div>
<div class="modal fade" id="account_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">정보수정</button>
        <button id = "logout_button"type="button" class="btn btn-secondary">로그아웃</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>