<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>PFD IT News</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/it_news.css"/>
		<script type="text/javascript" src="resources/slick/slick.min.js"></script>
		<script type="text/javascript" src="resources/js/it_news.js"></script>
	</head>
	<body>
		<header class="align-center">
			<h1>Latest IT News</h1>
			<p>최신 IT 기술 동향과 정보</p>
		</header>
		<hr>
		<c:if test="${!empty brNewsList}">
		<section id="breakingNews" class="wrapper special">
			<div class="inner">
				<header class="brNewsHeader newsHeader">
					<strong>Breaking News</strong>
					<b>속보</b>
					<div class="brNewsFilters">
						<span class="brNews-filter clickable">인터넷</span>
						<span class="brNews-filter clickable">컴퓨터</span>
						<span class="brNews-filter filter-active clickable">IT일반</span>
					</div>
				</header>
				<div class="brNewsList">
					<c:forEach var="news" items="${brNewsList}">
					<div class="brNewsItem clickable">
						<div class="brNewsImg">
							<img src="${news.image}">
						</div>
						<div class="brNewsHeadline">${news.headLine}</div>
						<input type="hidden" class="hiddenlink" value="${news.link}">
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		</c:if>
		<c:if test="${!empty newsList}">
		<section id="searchedNews" class="wrapper special">
			<div class="inner">
				<header class="newsHeader">
					<strong>Related News</strong>
					<b>관련 기사</b>
				</header>
				<div class="newsList">
					<c:forEach var="news" items="${newsList}">
					<div class="newsItem clickable">
						<div class="newsItemHeader">
							<span class="newsTitle">${news.title}</span>
							<span class="newsDate">${news.pubDate}</span>
						</div>
						<p>${news.description}</p>
						<a href="${news.originallink}" class="button special small">보러가기</a>
					</div>
					</c:forEach>
				</div>
				<div class="newsController">
					<img class="prevList" src="/pro/resources/Image/left.png">
					<img class="nextList clickable" src="/pro/resources/Image/right.png">
				</div>
			</div>
		</section>
		</c:if>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<div class="flex">
					<div class="copyright">
						&copy; PFD. Design: <a href="#">Team PFD</a>. News: <a href="https://www.naver.com/">Naver</a>.
					</div>
					<ul class="icons">
						<li>follow us in</li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-linkedin"><span class="label">linkedIn</span></a></li>
						<li><a href="#" class="icon fa-pinterest-p"><span class="label">Pinterest</span></a></li>
						<li><a href="#" class="icon fa-vimeo"><span class="label">Vimeo</span></a></li>
					</ul>
				</div>
			</div>
		</footer>
	</body>
</html>