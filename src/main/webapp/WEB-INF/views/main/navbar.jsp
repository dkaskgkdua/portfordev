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
<script type="text/javascript" src="/pro/resources/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="/pro/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/pro/resources/slick/slick-theme.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/pro/resources/css/main.css?ver=1" />
<link rel="stylesheet" href="/pro/resources/css/navbar.css?ver=1" />
<script>
	function poll() {
		$.ajax({
			url : "/pro/alert_check",
			success : function(data) {
				if(data > 0) {
					$("#alert_count").text(data);	
				} else {
					$("#alert_count").text('');
				}
				
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
							if(this.alert_CHECK == 0) {
								output += "<tr><td style='background : aliceblue;'>";
							} else {
								output += "<tr><td>";
							}
							if(this.alert_CATEGORY >= 0 && 4 > this.alert_CATEGORY) {
								output += "<a class='alert_a' href='/pro/board_view_action?board_id="+this.alert_REF_ID+"'>";
							} else {
								output += "<a class='alert_a' href='/pro/log_to_profile?id="+this.alert_REF_ID+"'>";
							}
							
							output += this.member_NAME+"님이 #"
								   + this.alert_REF_ID;
							if(this.alert_CATEGORY == 0) {
								output += " 게시물에 답변을 달았습니다.";
							} else if(this.alert_CATEGORY == 1) {
								output += " 게시물에 댓글을 달았습니다.";
							} else if(this.alert_CATEGORY == 2) {
								output += " 게시물에 추천을 했습니다.";
							} else if(this.alert_CATEGORY == 3) {
								output += " 게시물에 추천을 취소했습니다.";
							} else if(this.alert_CATEGORY == 4) {
								output += " 포트폴리오에 피드백을 달았습니다.";
							} else if(this.alert_CATEGORY == 5) {
								output += " 포트폴리오에 추천을 했습니다.";
							} else if(this.alert_CATEGORY == 6) {
								output += " 포트폴리오에 추천을 취소했습니다.";
							}
							output+="</a><span class='alert_date'>"+this.alert_DATE+"</span></td></tr>"
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
#alert_count {
	position : relative;
	top : -18px;
	left : -12px;
	color : red;
	border-radius : 50%;
	padding : 1px 4px;
	font-weight : bold;
}
.alert_a {
	color: black;
}
.alert_date {
	float : right;
	width : 60px;
}
.modal-nav {
	 height : 450px; 
	 }
.searchBtn{
	height: 36px;
    background: rgb(83, 133, 193);
    border-color:#FFF;
}
.searchBtn:hover{
	background: rgb(93, 143, 203);
	border-radius:5%;
	opacity:0.8;
	transition:0.3s;
	border-color:lightgrey;
}
#account_button {
	padding-right : 0px;
}
.navbar-toggler {
	width : 60px;
	height : 40px;
}
.nav-wrap {
	height : 60px !important;
}
@media screen and (max-width: 575px){
	.searchBar{
		width: calc(99% - 136px)!important;
		margin-right: 1%!important;
	}
	.navbar-nav {
    	flex-direction: inherit;
    	display:block;
	}
	.nav-link{
	    color: rgba(100,100,100)!important;
	    font-weight: 500;
	}
	.navbar-nav li{
		margin-left:1%;
	}
	.nav-divider{
		height: 0;
	    margin: .5rem 0;
	    overflow: hidden;
	    border-top: 1px solid #e9ecef;
	}
	.profile-nav1, .port-nav1, .news-nav1, .free-nav1, .study-nav1, .qna-nav1{
		display:inline-block;
	}
	.dropdown-toggle{
		display:none;
	}
}
@media screen and (min-width: 576px){
	.navbar {
		height : 60px !important;
	}
	.news-nav1, .free-nav1, .study-nav1, .qna-nav1, .nav-divider{
		display:none;
	}
}
@media screen and (min-width: 577px) and (max-width: 744px){
	.navbar-expand-sm .navbar-nav .nav-link {
     	padding-right: 0;
     }
     .profile-nav1{
     	display:none;
     }
     .profile-nav2{
     	display:block;
     }
}
@media screen and (min-width: 577px) and (max-width: 640px){
	.port-nav1{
		display:none;
	}
	.port-nav2{
		display:block;
	}
}
@media screen and (max-width: 480px){
	.searchBar{
		width: 100%!important;
		margin: 0!important;
	}
}
@media screen and (min-width: 745px){
	.navbar {
		height : 60px !important;
	}
	.port-nav2, .profile-nav2{
		display:none!important;
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
			<li class="nav-item profile-nav1">
				<a class="nav-link" href="/pro/profile/collection">프로필</a>
			</li>
			<li class="nav-item port-nav1">
			  	<a class="nav-link" href="/pro/portfolio/collection">포트폴리오</a>
			</li>
			<li class="nav-divider"/>
			<li class="nav-item news-nav1">
			  	<a class="nav-link" href="/pro/news">IT뉴스</a>
			</li>
			<li class="nav-item free-nav1">
			  	<a class="nav-link" href="/pro/board_list?BOARD_CATEGORY=0">자유게시판</a>
			</li>
			<li class="nav-item study-nav1">
			  	<a class="nav-link" href="/pro/board_list?BOARD_CATEGORY=1">스터디</a>
			</li>
			<li class="nav-item qna-nav1">
			  	<a class="nav-link" href="/pro/board_list?BOARD_CATEGORY=2">Q&amp;A</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle community-btn" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 커뮤니티 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item profile-nav2" href="/pro/profile/collection">프로필</a>
			  		<a class="dropdown-item port-nav2" href="/pro/portfolio/collection">포트폴리오</a>
					<a class="dropdown-item news-nav2" href="/pro/news">IT뉴스</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item free-nav2" href="/pro/board_list?BOARD_CATEGORY=0">자유게시판</a>
					<a class="dropdown-item study-nav2" href="/pro/board_list?BOARD_CATEGORY=1">스터디</a>
					<a class="dropdown-item qna-nav2" href="/pro/board_list?BOARD_CATEGORY=2">Q&amp;A</a>
				</div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action ="/pro/search" method ="get" id="searchform">
			<input class="form-control mr-sm-2 searchBar" type="search" name="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-info my-2 my-sm-0 searchBtn" style ="height:36px"type="submit">Search</button>
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
    <div class="modal-content modal-nav">
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
        <button id = "mypage_button" type="button" class="btn btn-info">Mypage</button>
        <button id = "logout_button" type="button" class="btn btn-secondary">Logout</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>