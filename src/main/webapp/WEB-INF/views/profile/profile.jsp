<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PFD_portfolio_main</title><!-- 나중에 _main 빼고 개발자 아이디 -->
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/profile_main_slidebar.css"/>
	<style>
	 .inner {
		margin-left: 450px;
	}
	</style>
<script>
	$(document).ready(function () {  
        var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
        $(window).scroll(function (event) {
        var y = $(this).scrollTop();
        	
  });//scroll끝
  
        var width = $(window).width();
  var cnt=0;
        console.log(width);
        if(width<700){
        	$('.profile_btn').click(function(){
        		cnt++;
        		var obj=$('#adside');
        		obj.show();
        		
        		obj.css('z-index','20');
        		console.log('클릭횟수'+cnt+'//'+cnt%2);
        		if(cnt%2==1){
        		obj.animate({
        			  left:10
        			},1000);
        		}else{
        			obj.animate({
        				left:-300
          			},1000);	
        		}
        		
        		$('.sidebar').css('display','none');
        	})
        	
        	
        	
        } 
});
</script>
	</head>
	<body>
	
	<img src = "resources/Image/userdefault.png" class="profile_btn"/>


	 
		<!-- Three -->
		
			<section id="three" class="wrapper">
			<div id="adsideWrapper">
    		<div id="adside" class="fixed"  >
    		<!-- style="overflow:scroll" -->
    		
    		
    		<!-- 프로필 사진 칸 -->
    		<div style="width:200px;margin: 0 auto;margin-top: 20px;margin-left: 50px;" id="p_div">
    			<h1 class="profile_h1">PROFILE</h1>
    			<div class="profile"><img src="resources/Image/sample2.jpg" class="profile"></div>
    			<div>
    			<br>
    			<h1 class="name">LEE DAEUN / 이다은 </h1><button type="button" onclick="location.href='portfolio_form'">등록</button>
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
  			<!-- 모바일일때 프로필 숨겨진거 나타나게하기 -->
  				<!-- 모바일일때 프로필 숨겨진거 나타나게하기 끝-->
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
					<table class="skill_table skill_stack">
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
					<table class="skill_table skill_stack">
					<tr>
							<td rowspan="3" width="30%">
							<img src="resources/Image/back.png" class="skill_img_m">
							<p class="h1">Backend</p>
							</td>
							<td><img src="resources/Image/java.png" class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>	
							<td><img src="resources/Image/jsp.png"class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/php.png" class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
						<tr>
							<td><img src="resources/Image/git.png"class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
							<td><img src="resources/Image/jsp.png" class="skill_img"  ><span class="skill_span">어쩌구저쩌구어쩌구 저쩌구</span></td>
						</tr>
					</table>
					
					<h1 style="font-size: 15pt" id="adad">기술 스택소개</h1>
					<p class="adad_content">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
					<p class="adad_content">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>
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
	<jsp:include page="../main/footer.jsp"></jsp:include>
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
					  speed:3000 ,
					  verticalSwiping: false,
					  responsive : [ {
				            breakpoint : 580,
				            settings : {
				            	slidesToShow: 1,
								  slidesToScroll: 1,
				         }
				         } ]

					  
					});
				
				
				
		});
			
	</script>
	</body>
</html>