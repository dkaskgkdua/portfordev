<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PFD_portfolio_main</title><!-- 나중에 _main 빼고 개발자 아이디 -->
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
	<style>
	.slide{color:white;max-width:100%;margin:0 auto;display: inline-block;margin-top:100px;}
	.slide_in{height:400px;margin: 10px;background:gray;}
	.right{display: inline-block;}
	.left{display: inline-block;}
	.h1{font-color:black;text-align: center;font-size: 30pt;font-weight:700;color:gray}
	.skill{display: block; margin-right: auto;margin-left: auto}
	.skill_detail{display:inline-block; float: left;}
	.skill_table{text-align: center; margin-top: 50px}
	.skill_table td{height:100px;padding:0px; vertical-align: middle;background: white;}
	.skill_table tr{border:0px}
	legend{margin-left:70px;width:inherit;text-align: center}
	#userimage{opacity: 0.7}
	.user_info{font-size: 15pt}
	#user{margin-bottom:50px;border-top:1px solid lightgray}
	#typing{text-align: center; font-weight: bold; font-size:15pt}
	.skill_img_m{width:100px;display: inline-block;}
	#info{padding: 80px; margin:0;color:gray;font-size: 20pt}
	.info_div{margin-bottom: 100px;}
	.background{background-image: url('resources/Image/background2.png');
					height:600px;opacity: 0.7;max-width:100%;
				filter : grayscale(100%) brightness(150%) ;
				float:left;
					}
	/* 개발능력 이미지 */
	.ability{border-radius:100%; width:100px; }
	.background_in{width:50%; height:300px; background: white ; opacity: 0.7;display: inline-block;margin-top:180px;}
	
	.user_name{/* background: #5385c1; color:white */}
	/* #three{padding-top: 0px;}  */
	body{min-width: 1000px;}
	 
#adsideWrapper { 
  position: absolute;
}
#adside {
  position: absolute;
  top: 0;
}
#adside.fixed {
  position: fixed;
  top: 0;
  margin-top:60px;
 width:300px;
  background: white;
  height: 100%;
 /*  border-right: 1px solid lightgray; */
}
.profile{width:190px;height:250px;}
.profile_h1{font-weight: 700;font-size: 25pt;color: black;margin-bottom:10px}
.sidebar{margin-top: 70px;}
.sidebar ul{list-style: none;
			 padding-left:0px;}
.sidebar li{margin-top: 20px;font-weight: 600;padding:0px}
.name{font-weight:800;margin:0px;color:black;font-size:15pt}		
.contact{width:20px}
.contact_div span{position:relative;
					top:-6px;
					font-size: 5pt;}
.contact_div a{text-decoration: none;}	
#three{padding:30px}	
.skill_img{width:50px}				 
	</style>
<script>
	$(document).ready(function () {  
        var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
        $(window).scroll(function (event) {
        var y = $(this).scrollTop();
  
  });
});
</script>
	</head>
	<body>
	



	 
		<!-- Three -->
		
			<section id="three" class="wrapper">
			<div id="adsideWrapper">
    		<div id="adside" class="fixed"  >
    		<!-- style="overflow:scroll" -->
    		
    		
    		<!-- 프로필 사진 칸 -->
    		<div style="width:200px;margin: 0 auto;margin-top: 20px;margin-left: 50px;">
    			<h1 class="profile_h1">PROFILE</h1>
    			<div class="profile"><img src="resources/Image/sample2.jpg" class="profile"></div>
    			<div>
    			<br>
    			<h1 class="name">LEE DAEUN / 이다은</h1>
    			<p>Web programmer</p>
    			</div>
    			
    			<div class="contact_div">
    				<!-- <ul>
    					<li>
    						<img class="contact" src="resources/Image/phone.png"/>
    						<span>010-9954-8516</span>
    					</li>
    				</ul> -->
    				<img class="contact" src="resources/Image/phone.png"/>
    				<span>010-9954-8516</span>
    				<br>
    				<img class="contact" src="resources/Image/email.png"/>
    				<span>lde1245@naver.com</span>
    				<br>
    				<img class="contact" src="resources/Image/blog.png"/>
    				<span><a href="">webruden.tistory.com/94</a></span>
    				<br>
    				<img class="contact" src="resources/Image/github.png"/>
    				<span><a href="">webruden.tistory.com/94</a></span>
    			</div>
    			
    			<div class="sidebar">
    			<ul>
    			<li>PROJECT</li>
    			<li>INTRODUCE</li>
    			<li>SKILL</li>
    			<li>CONTACT</li>
    			</ul>
    			</div>
    		</div>
    		<div>
    		
    		</div>
			</div>
  			</div>
			<!-- <div class="background">
					<img src="resources/Image/background2.png" width=100% height="500"/>
					<h1 class="h1">PROJECT</h1>
					
					<header class="align-center">
					<div class="your-class background_in"></div>
					</header>
				</div>  -->
				<div class="inner">
				
				<!-- <h1 class="h1">PROJECT</h1> -->
					<header class="align-center">
					
						<div class="your-class slide">
  						<div class="slide_in">your content</div>
  						<div class="slide_in">your content</div>
  						<div class="slide_in">your content</div>
  						<div class="slide_in">your content</div>
  						<div class="slide_in">your content</div>
  						<div class="slide_in">your content</div>
						</div>
					</header>
					<!-- <hr style="border:1px solid gray"> -->
					
					
					
					<!-- 유저 정보 -->
					<fieldset id="user">
						<!-- <legend><img src="resources/Image/userdefault.png" width=50 id="userimage"></legend> -->
					<!-- 	<table>
							<tr>
								<td><span class="user_info">name:</span></td>
								<td></td>
							</tr>
							<tr>
								<td><span class="user_info">certificate:</span></td>
								<td></td>
							</tr>
						</table> -->
					</fieldset>
					<!-- <p id="typing"></p> -->
					
					<!-- 스킬 table 나중에 ajax로 구현-->
					<!-- 임시 아이콘임 -->
					<h1 class="h1 user-name" >DEVELOPER O O O</h1>
					<div style="background:white" class="info_div">
					<table class="skill_table">
					<tr>
						<td><img src="resources/Image/userlevel1_2.png" class="ability"></td>
						<td><img src="resources/Image/ability_think.png" class="ability"></td>
						<td><img src="resources/Image/ability_careful.png" class="ability"></td>
					</tr>
					<tr>
						<td>2년차 개발자</td>
						<td>창의적인</td>
						<td>협동적인</td>
						
					</tr>
					</table>
					<p id="info" style="padding-bottom: 10px; font-weight: bold;">개발자 소개</p>
					<P id="info" style="padding-top: 10px">
					저는 어쩌구 저쩌구 회사의 40년차 개발자 어쩌구입니다. 어쩌구저쩌구 프로젝트를 어쩌구어쩌구저쩌구 프로젝트를 어쩌구
					  어쩌구저쩌구 프로젝트를 어쩌구 어쩌구저쩌구 프로젝트를 어쩌구 어쩌구저쩌구 프로젝트를 어쩌구어쩌구저쩌구 프로젝트를 어쩌구어쩌구저쩌구 프로젝트를 어쩌구어쩌구저쩌구 프로젝트를 어쩌구</P>
					<!-- <h1 style="background: #5385c1;padding:10px">&nbsp</h1> -->
					</div>
					<hr>
					<br>
					<h1 class="h1">SKILL</h1>
					<!-- <img src="resources/Image/skill1.png" width=50 class="skill"> -->
					<table class="skill_table">
						<tr>
							<td rowspan="3" width="30%">
							<img src="resources/Image/front.png" class="skill_img_m">
							<p class="h1">Frontend</p>
							</td>
							<td><img src="resources/Image/java.png" class="skill_img" ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" class="skill_img"><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>	
							<td><img src="resources/Image/jsp.png" class="skill_img" ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/php.png" class="skill_img" ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>
							<td><img src="resources/Image/git.png" class="skill_img" ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" class="skill_img" ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
					</table>
					<br>
					<table class="skill_table">
					<tr>
							<td rowspan="3" width="30%">
							<img src="resources/Image/back.png" class="skill_img_m">
							<p class="h1">Backend</p>
							</td>
							<td><img src="resources/Image/java.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>	
							<td><img src="resources/Image/jsp.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/php.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>
							<td><img src="resources/Image/git.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" width=50 ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
					</table>
					
					<h1 style="font-size: 15pt">기술 스택소개</h1>
					<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>
					<br>
					<br>
					<hr>
					<br>
					<h1 class="h1">CONTACT</h1>
					<br>
					<br>
					<div class="flex flex-2">
						<article>
							<div class="image fit">
								<img src="resources/Image/pic01.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Github</h3>
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
								<h3>blog</h3>
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
			<footer id="footer">
				<div class="inner">
					<div class="flex">
						<div class="copyright">
							&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
						</div>
						<ul class="icons">
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">linkedIn</span></a></li>
							<li><a href="#" class="icon fa-pinterest-p"><span class="label">Pinterest</span></a></li>
							<li><a href="#" class="icon fa-vimeo"><span class="label">Vimeo</span></a></li>
						</ul>
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/skel.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script type="text/javascript" src="resources/slick/slick.min.js"></script>
			<script>
			$(document).ready(function(){
					
				$('.slide').slick({
					  infinite: true,
					  slidesToShow: 3,
					  slidesToScroll: 3,
					  arrows: true,
					  dots:true,
					  autoplay: true,
					  autoplaySpeed:4000,
					  pauseOnHover:true, 
					  speed:3000 
					});
				
				
				
		});
			
	</script>
	</body>
</html>