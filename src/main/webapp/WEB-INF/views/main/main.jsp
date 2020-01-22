<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Main Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="navbar.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/main_page.css"/>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<!-- Banner -->
		<section id="banner">
			<h1>Portfolio for Developer</h1>
			<p>개발자들을 위한 포트폴리오</p>
		</section>

		<!-- One -->
		<section id="one" class="wrapper special">
			<div class="inner">
				<header class="align-center">
					<h2>Noteworthy Portfolios</h2>
					<p>현재 주목받는 포트폴리오</p>
					<div class="slide">
	  					<div class="slide_in">Best1</div>
	  					<div class="slide_in">Best2</div>
	  					<div class="slide_in">Best3</div>
	  					<div class="slide_in">Best4</div>
	  					<div class="slide_in">Best5</div>
	  					<div class="slide_in">Best6</div>
					</div>
					<p>
						<span class="best-port-filter filter-active">Daily</span>
						<span class="best-port-filter">Weekly</span>
						<span class="best-port-filter">Monthly</span>
						<span class="best-port-filter" onclick="javascript:location.href='portfolio/collection'">All</span>
					</p>
				</header>
			</div>
		</section>

		<!-- Two -->
		<section id="two" class="wrapper">
			<div class="inner">
				<header class="align-center">
					<h2>Why PFD?</h2>
					<p>PFD만이 가진 장점</p>
				</header>
				<div class="flex flex-4">
					<div class="box" onclick="javascript:location.href='profile'">
						<div class="image fit">
							<img src="resources/Image/icon/laptop.png" alt="Portfolio" />
						</div>
						<h3>Convenience</h3>
						<p>간편한 정보 입력으로 쉽게 만드는 포트폴리오</p>
					</div>
					<div class="box" onclick="javascript:location.href='portfolio/collection'">
						<div class="image fit">
							<img src="resources/Image/icon/feedback.png" alt="Feedback" />
						</div>
						<h3>FeedBack</h3>
						<p>선배 개발자들로 부터 얻는 전문적인 평가와 조언</p>
					</div>
					<div class="box" onclick="javascript:location.href='board_list?BOARD_CATEGORY=0'">
						<div class="image fit">
							<img src="resources/Image/icon/class.png" alt="Community" />
						</div>
						<h3>Community</h3>
						<p>자유롭게 의견을 나누며 소통하는 게시판</p>
					</div>
					<div class="box" onclick="javascript:location.href='board_list?BOARD_CATEGORY=1'">
						<div class="image fit">
							<img src="resources/Image/icon/team.png" alt="Study" />
						</div>
						<h3>Study</h3>
						<p>편리한 프로젝트 팀원, 스터디 그룹원 모집</p>
					</div>
				</div>
			</div>
		</section>
		<!-- Three -->
		<section id="Three" class="wrapper style1 special">
			<div class="inner">
				<header>
					<h2>PFD Developers</h2>
					<p>PFD 개발자들의 포트폴리오</p>
				</header>
				<div class="flex flex-4">
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic03.jpg" alt="Person 1" />
						</div>
						<h3>손민준</h3>
						<p>팀장</p>
					</div>
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic04.jpg" alt="Person 2" />
						</div>
						<h3>이다은</h3>
						<p>팀원</p>
					</div>
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic05.jpg" alt="Person 3" />
						</div>
						<h3>안현호</h3>
						<p>팀원</p>
					</div>
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic06.jpg" alt="Person 4" />
						</div>
						<h3>김대건</h3>
						<p>팀원</p>
					</div>
				</div>
			</div>
		</section>

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
				// 베스트 포트폴리오 슬라이드
				$('.slide').slick({
					  infinite: true,	// 맨끝이미지에서 끝내지 않고 맨앞으로 이동
					  slidesToShow: 3,	// 화면에 보여질 이미지 갯수
					  slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
					  arrows: true,	// 화살표
					  dots:true,	// 아래 점
					  autoplay: true,	// 자동으로 다음 이미지 보여주기
					  autoplaySpeed:5000,	// 다음 이미지로 넘어갈 시간
					  pauseOnHover:true,	// 마우스 호버시 슬라이드 이동멈춤
					  speed:1000, 			// 다음 이미지로 넘겨질때 걸리는 시간
					  // vertical:true		// 세로방향으로 슬라이드를 원하면 추가
					  responsive:[
						  {	// 반응형 웹
							  breakpoint:960,	// 기준화면 사이즈
							  settings:{slidesToShow:2}	// 사이즈에 적용될 설정
						  },
						  {
							  breakpoint:768,
							  settings:{slidesToShow:1}
						  }
					  ]
					});
				// 베스트 포트폴리오 필터 변경시
				$('.best-port-filter').click(function(){
					$('.best-port-filter').removeClass('filter-active');
					$(this).addClass('filter-active');
					if($(this).text() == 'Daily')
					{
						// alert('dd');
					}
					else if($(this).text() == 'Weekly')
					{
						// alert('ww');
					}
					else if($(this).text() == 'Monthly')
					{
						// alert('MM');
					}
				});
			});
		</script>
	</body>
</html>