<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Project Collection</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<link rel="stylesheet" href="resources/css/project_collection.css" />
		<link rel="stylesheet" href="resources/css/bootstrap-select.css" />
		<script src="resources/js/bootstrap-select.js"></script>
	</head>
	<body>
		<div class="clearfix">
			<div class="sort-list" style="margin-top: 0px;">
      			<div class="category-list">
					<div class="category-list-item">전체분야</div>
				</div>
				<div class="sort-condition">
					<select name="order" class="select" id="order" style="display: none;">
						<option value="pfd_rank">하이라이트</option>
						<option value="newest" selected>최신순</option>
						<option value="noted">추천순</option>
						<option value="viewed">조회순</option>
						<option value="comment_desc">댓글순</option>
						<option value="pick">PFD'S PICK</option>
					</select>
					<div class="btn-group bootstrap-select select">
						<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="order">
							<div class="filter-option pull-left">하이라이트</div>&nbsp;<div class="caret"></div>
						</button>
						<div class="dropdown-menu open" style="max-height: 855px; overflow: hidden; min-height: 77px;">
							<ul class="dropdown-menu inner selectpicker" role="menu" style="max-height: 853px; overflow-y: auto; min-height: 75px;">
								<li rel="0" class="selected"><a tabindex="0" class="" style=""><span class="text">하이라이트</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="1"><a tabindex="0" class="" style=""><span class="text">최신순</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="2"><a tabindex="0" class="" style=""><span class="text">추천순</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="3"><a tabindex="0" class="" style=""><span class="text">조회순</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="4"><a tabindex="0" class="" style=""><span class="text">댓글순</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="5"><a tabindex="0" class="" style=""><span class="text">PFD'S PICK</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
							</ul>
						</div>
					</div>
					<select name="from" class="select" id="from" style="display: none;">
						<option value="all" selected>전체기간</option>
						<option value="day">최근 24시간</option>
						<option value="week">최근 1주일</option>
						<option value="month">최근 1달</option>
						<option value="month3">최근 3달</option>
					</select>
					<div class="btn-group bootstrap-select select">
						<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="from">
							<div class="filter-option pull-left">전체기간</div>&nbsp;<div class="caret"></div>
						</button>
						<div class="dropdown-menu open" style="max-height: 855px; overflow: hidden; min-height: 77px;">
							<ul class="dropdown-menu inner selectpicker" role="menu" style="max-height: 853px; overflow-y: auto; min-height: 75px;">
								<li rel="0" class="selected"><a tabindex="0" class="" style=""><span class="text">전체기간</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="1"><a tabindex="0" class="" style=""><span class="text">최근 24시간</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="2"><a tabindex="0" class="" style=""><span class="text">최근 1주일</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="3"><a tabindex="0" class="" style=""><span class="text">최근 1달</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								<li rel="4"><a tabindex="0" class="" style=""><span class="text">최근 3달</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<input type="hidden" name="project_categories" id="category" value="">
			</div>
			<div class="project-container">
				<div class="project-list">
					<div class="project-list-item">
						<div class="img-wrapper">
							<img src="resources/Image/sample.jpg">
						</div>
						<div class="info">
							<div class="info-detail">
								<div class="title">제목 들어갈 자리</div>
								<div class="user-profile">
									<img class="pic icon-round" src="resources/Image/sample2.jpg">
									이름 들어갈 자리
								</div>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="view-cnt">
											<img class="view-icon" src="resources/Image/icon/view-gray.png">
											3125
										</td>
										<td class="like-cnt">
											<img class="like-icon" src="resources/Image/icon/like-gray.png">
											63
										</td>
										<td class="comment-cnt">
											<img class="comment-icon" src="resources/Image/icon/comment-gray.png">
											11
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="project-list-item">
						<div class="img-wrapper">
							<img src="resources/Image/sample.jpg">
						</div>
						<div class="info">
							<div class="info-detail">
								<div class="title">제목 들어갈 자리</div>
								<div class="user-profile">
									<img class="pic icon-round" src="resources/Image/sample2.jpg">
									이름 들어갈 자리
								</div>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="view-cnt">
											<img class="view-icon" src="resources/Image/icon/view-gray.png">
											2223
										</td>
										<td class="like-cnt">
											<img class="like-icon" src="resources/Image/icon/like-gray.png">
											11
										</td>
										<td class="comment-cnt">
											<img class="comment-icon" src="resources/Image/icon/comment-gray.png">
											8
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="project-list-item">
						<div class="img-wrapper">
							<img src="resources/Image/sample.jpg">
						</div>
						<div class="info">
							<div class="info-detail">
								<div class="title">제목 들어갈 자리</div>
								<div class="user-profile">
									<img class="pic icon-round" src="resources/Image/sample2.jpg">
									이름 들어갈 자리
								</div>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="view-cnt">
											<img class="view-icon" src="resources/Image/icon/view-gray.png">
											1234
										</td>
										<td class="like-cnt">
											<img class="like-icon" src="resources/Image/icon/like-gray.png">
											55
										</td>
										<td class="comment-cnt">
											<img class="comment-icon" src="resources/Image/icon/comment-gray.png">
											22
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>