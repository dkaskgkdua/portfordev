<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Portfolio Collection</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<jsp:include page="../portfolio/portfolio_detail.jsp" />
		<link rel="stylesheet" href="../resources/css/portfolio_collection.css" />
		<script src="../resources/js/portfolio_collection.js"></script>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div class="clearfix">
			<div class="sort-list" style="margin-top: 0px;">
      			<div class="category-list">
					<div class="category-list-item active-category" id="cateAll">전체</div>
					<div class="category-list-item" id="feedNeedOnly">피니</div>
					<div class="category-list-item" id="recomOnly">베스트</div>
					<div class="category-list-item" id="scrapOnly">스크랩</div>
				</div>
				<div class="sort-condition">
					<div class="dropdown" style="display:inline-block;">
						<select name="order" class="select" id="order" style="display: none;">
							<option value="newest" selected>최신순</option>
							<option value="noted">추천순</option>
							<option value="viewed">조회순</option>
							<option value="comment_desc">댓글순</option>
						</select>
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="orderDropDown">최신순</button>
						<div class="dropdown-menu" style="min-width:100px; text-align:center;" aria-labelledby="orderDropDown">
							<button class="dropdown-item" type="button">최신순</button>
							<button class="dropdown-item" type="button">추천순</button>
							<button class="dropdown-item" type="button">조회순</button>
							<button class="dropdown-item" type="button">댓글순</button>
						</div>
					</div>
					<div class="dropdown" style="display:inline-block;">
						<select name="from" class="select" id="from" style="display: none;">
							<option value="all" selected>전체기간</option>
							<option value="day">최근 24시간</option>
							<option value="week">최근 1주일</option>
							<option value="month">최근 1달</option>
							<option value="month3">최근 3달</option>
						</select>
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="fromDropDown">전체기간</button>
						<div class="dropdown-menu" style="min-width:115px; text-align:center;" aria-labelledby="fromDropDown">
							<button class="dropdown-item" type="button">전체기간</button>
							<button class="dropdown-item" type="button">최근 24시간</button>
							<button class="dropdown-item" type="button">최근 1주일</button>
							<button class="dropdown-item" type="button">최근 1달</button>
							<button class="dropdown-item" type="button">최근 3달</button>
						</div>
					</div>
				</div>
			</div>
			<div class="portfolio-container">
				<div class="portfolio-list">
					<c:forEach var="item" begin="0" end="20" step="1">
					<div class="portfolio-list-item clickable">
						<div class="img-wrapper">
							<!-- <img src="resources/Image/sample.jpg"> -->
							<div class="port-scrap-area">
								<img src="/pro/resources/Image/icon/Scrap_unclicked_icon.svg">
							</div>
							<div class="port-fini-area">
								<img src="/pro/resources/Image/icon/Fini_icon.svg">
							</div>
						</div>
						<div class="info">
							<div class="info-detail">
								<div class="title">제목 들어갈 자리</div>
								<div class="user-profile">
									<img class="pic icon-round" src="../resources/Image/sample2.jpg">
									<input type="hidden" class="user-nick-hidden" value="손민준">
									손민준
								</div>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="view-cnt">
											<img class="view-icon" src="../resources/Image/icon/view-gray.png">
											<input type="hidden" class="view-cnt-hidden" value="1234">
											1234
										</td>
										<td class="like-cnt">
											<img class="like-icon" src="../resources/Image/icon/like-gray.png">
											<input type="hidden" class="like-cnt-hidden" value="55">
											55
										</td>
										<td class="comment-cnt">
											<img class="comment-icon" src="../resources/Image/icon/comment-gray.png">
											<input type="hidden" class="comment-cnt-hidden" value="55">
											22
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<button id="move_top_btn" type="button">TOP</button>
	</body>
</html>