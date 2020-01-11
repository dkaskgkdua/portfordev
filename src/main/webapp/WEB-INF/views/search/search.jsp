<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Theory by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>검색결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/portfolio_main_slidebar.css" />
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<script src="resources/js/search.js"></script>
		<style>
		.inner{margin-left: 350px;
    			max-width: 80em}
    	.sidebar{margin-top: 70px;font-size:15pt}
    	.sidebar li{margin-top: 20px;}
		.search_h1{font-size:20pt;margin-top:30px;}
		#search{border:3px solid black!important; width:30%!important;
						margin:0 auto; margin-top: 50px; text-align: center;}
		table tr,td{background: white; border:0px!important;padding:0px!important;}
		.sub{margin-bottom: 50px;}
		img{width:100%}
		.contentimg{width:10%}
		table *{vertical-align: text-top;}
		.divimg{display: inline-block;width:130px;margin-right: 20px}
		ul,li{list-style: none; vertical-align: text-top!important;padding:0px!important;margin-bottom: 20px;}
		#sidebar_btn{position:absolute; left:240px;top:400px}
		</style>
	</head>
	<body class="subpage">

			

		<!-- Three -->
			<section id="three" class="wrapper">
			<!-- 사이드바  -->
				<div id="adsideWrapper">
    		<div id="adside" class="fixed"  >
    		<!-- @@@@@@@@@@@사이드바 여는 버튼 -->
			<div>
    		<img src="resources/Image/left.png" style="width:30px" id="sidebar_btn"/>
    		</div>
    		<!-- @@@@@@@@@@@사이드바 여는 버튼 끝-->
    		<div style="width:200px;margin: 0 auto;margin-top: 20px;margin-left: 50px;" id="sidebar">
    			<h1 class="profile_h1 search_h1">MENU</h1>
    			<div class="sidebar">
    			<ul>
    			<li>MEMBER</li>
    			<li>PROJECT</li>
    			<li>FREE BOARD</li>
    			<li>STUDY & QnA</li>
    			<li>COMMUNITY</li>
    			</ul>
    			</div>
    		</div>
    		
			</div>
  			</div>
  			
			<!-- 사이드바 끝 -->
			
			
			
			
			<!-- 본문 내용 -->
			<div class="inner">
			<div class="search_div">
    		<h1 style="text-align: left;margin-top:10px">통합검색>어쩌구</h1>
    		</div>
				<!--@@@@@@@@@@@@@@@@@@@@@@@@ 검색결과  -->
				<div>
				<h1 class="profile_h1 search_h1 sub">PROJECT</h1>
				
					<!-- <table>
						<tr>
							<td><h1 class="profile_h1 search_h1 sub">PROJECT</h1></td>
						</tr>
						<tr class="content">
						<td class="contentimg"><img src="resources/Image/search_sample.png"/></td>
							<td class="content_td">
							<div>어쩌구저쩌구 웹사이트</div>
							<div>설명 어쩌구저쩌구루리ㅏㅜㅏㅣ마ㅣㄴ아ㅣㅁ</div>
							<div style="">작성자: 이다은</div>
							</td>
						</tr>
					</table> -->
					
					<ul>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<a href="">어쩌구저쩌구 개발을위한 프로젝트</a>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<a href="">어쩌구저쩌구 개발을위한 프로젝트</a>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<a href="">어쩌구저쩌구 개발을위한 프로젝트</a>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<a href="">어쩌구저쩌구 개발을위한 프로젝트</a>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<a href="">어쩌구저쩌구 개발을위한 프로젝트</a>
						</li>
					</ul>
				
				</div>	
				<!-- @@@@@@@@@@@@@@@검색결과 끝 -->
					<div class="flex flex-2">
						<article>
							<div class="image fit">
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

		<!-- Footer -->
			
<jsp:include page="../main/footer.jsp"></jsp:include>
		<!-- Scripts -->

	</body>
</html>