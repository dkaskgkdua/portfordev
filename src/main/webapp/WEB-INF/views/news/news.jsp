<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>PFD It News</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/it_news.css"/>
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
				<header class="brNewsHeader">
					<strong>Breaking News</strong>
					<b>속보</b>
					<span class="brNews-filter clickable">인터넷</span>
					<span class="brNews-filter clickable">컴퓨터</span>
					<span class="brNews-filter filter-active clickable">IT일반</span>
				</header>
				<div class="brNewsList">
					<c:forEach var="news" items="${brNewsList}">
					<div class="brNewsItem clickable">
						<div class="brNewsImg">
							${news.image}
						</div>
						<div class="brNewsHeadline">
							${news.headLine}
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		</c:if>
		<c:if test="${!empty newsList}">
		<section id="searchedNews" class="wrapper special">
			<div class="inner">
				<header class="align-center">
					<h2>Latest IT News</h2>
					<p>최신 IT 기술 동향과 정보</p>
				</header>
				<div class="newsList">
					<c:forEach var="news" items="${newsList}">
					<div class="newsItem clickable">
						<header>
							<h3>${news.title}</h3>
							<span>${news.pubDate}</span>
						</header>
						<p>${news.description}</p>
						<footer>
							<a href="${news.originallink}" class="button special small">보러가기</a>
						</footer>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		</c:if>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<div class="flex">
					<div class="copyright">
						&copy; PFD. Design: <a href="#">Team PFD</a>. Images: <a href="#">Team PFD</a>.
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
		<script type="text/javascript" src="resources/slick/slick.min.js"></script>
		<script>
			$(document).ready(function(){
				// 네이버 뉴스 속보
				var category = '';
				function getBreakingNews(cg)
				{
					$.ajax({
						data: {
							category : cg
						}, 
						type: "get", 
						url: "breakingNews", 
						cache: false, 
						contentType: false, 
						success : function(news){
							$.each(news, function(){
								console.log(this.headLine);
							});
						}
					});	
				}
				
				// 네이버 뉴스 API
				var newsPage = 1;
				function getNextNews(np)
				{
					$.ajax({
						data: {
							display: 10, 
							start: (1 + (np-1)*10)
						}, 
						type: "get", 
						url: "getNextNews", 
						cache: false, 
						contentType: false, 
						success : function(news){
							$.each(news, function(){
								console.log(this.title);
							});
						}
					});	
				}
				/*
				$('.newsList').slick({
					  infinite: false, 
					  slidesToShow: 4, 
					  slidesToScroll: 4, 
					  arrows: true,	
					  dots:false, 
					  autoplay: true,	
					  autoplaySpeed:4000,	
					  pauseOnHover:true,	
					  speed:1000, 			
					  responsive:[
						  {	// 반응형 웹
							  breakpoint:960,	// 기준화면 사이즈
							  settings:{slidesToShow:3, slidesToScroll:3}	// 사이즈에 적용될 설정
						  },
						  {
							  breakpoint:768,
							  settings:{slidesToShow:2, slidesToScroll:2}
						  }
					  ]
					});
				$('.newsItem a').hover(function(){
					$(this).parent().parent().removeClass('clickable');
				}, function(){
					$(this).parent().parent().addClass('clickable');
				});*/
			});
		</script>
	</body>
</html>