<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Main Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="navbar.jsp" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<style>
			.inner{
				margin: 0 auto!important;
			}
			#banner h1{
				font-weight:600!important;
			}
			#banner p{
				font-weight:500!important;
				font-size:1.5em;
			}
			h2+p{
				font-size:1.5em!important;
				font-weight:400;
			}
			h3{
				font-weight:400!important;
			}
			.slide{color:white;max-width:100%;margin:0 auto;display: inline-block;}
			.slide_in{height:400px;margin: 10px;background:#5385c1;}
		</style>
	</head>
	<body>
		<!-- Banner -->
		<section id="banner">
			<h1>Portfolio for Developers</h1>
			<p>개발자들을 위한 무료 포트폴리오 게시 웹사이트</p>
		</section>

		<!-- One -->
		<section id="one" class="wrapper special">
			<div class="inner">
				<header class="align-center">
					<h2>Noteworthy Portfolios</h2>
					<p>현재 주목받는 포트폴리오</p>
				</header>
				<header class="align-center">
					<div class="slide">
	  					<div class="slide_in">Best1</div>
	  					<div class="slide_in">Best2</div>
	  					<div class="slide_in">Best3</div>
	  					<div class="slide_in">Best4</div>
	  					<div class="slide_in">Best5</div>
	  					<div class="slide_in">Best6</div>
					</div>
				</header>
				<div class="flex flex-4">
					<div class="box">
						<h3>PFD's PICK</h3>
						<p>하이라이트</p>
					</div>
					<div class="box">
						<h3>Daily Best</h3>
						<p>오늘의 베스트</p>
					</div>
					<div class="box">
						<h3>Weekly Best</h3>
						<p>이 주의 베스트</p>
					</div>
					<div class="box">
						<h3>Monthly Best</h3>
						<p>이 달의 베스트</p>
					</div>
				</div>
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
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/portfolio.png" alt="Portfolio" />
						</div>
						<h3>Convenience</h3>
						<p>쉽고 편리한 정보 입력으로 마치 개인 사이트를 호스팅한 것 같은 만족감</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/feedback.png" alt="Feedback" />
						</div>
						<h3>FeedBack</h3>
						<p>선배 개발자들로 부터 얻는 전문적인 평가와 조언</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/community.png" alt="Community" />
						</div>
						<h3>Community</h3>
						<p>자유롭게 의견을 나누는 소통의 창</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/study.png" alt="Study" />
						</div>
						<h3>Study</h3>
						<p>Project 팀원 Study 그룹 모집 용이</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Three -->
		<section id="three" class="wrapper special">
			<div class="inner">
				<header class="align-center">
					<h2>Latest IT News</h2>
					<p>최신 IT 기술 동향과 정보를 쉽게 접하세요</p>
				</header>
				<div class="flex flex-2">
					<article>
						<div class="image fit">
							<img src="resources/Image/pic01.jpg" alt="Pic 01" />
						</div>
						<header>
							<h3>Praesent placerat magna</h3>
						</header>
						<p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
						<footer>
							<a href="#" class="button special">More</a>
						</footer>
					</article>
					<article>
						<div class="image fit">
							<img src="resources/Image/pic02.jpg" alt="Pic 02" />
						</div>
						<header>
							<h3>Fusce pellentesque tempus</h3>
						</header>
						<p>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna non comodo sodales tempus.</p>
						<footer>
							<a href="#" class="button special">More</a>
						</footer>
					</article>
				</div>
			</div>
		</section>
		
		<!-- Four -->
		<section id="Four" class="wrapper style1 special">
			<div class="inner">
				<header>
					<h2>PFD Developers</h2>
					<p>PFD 개발자들의 포트폴리오를 만나보세요</p>
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
			});
		</script>
	</body>
</html>