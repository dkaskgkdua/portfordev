<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>     
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
		margin-left: 400px;
	}
	.contact_div span{vertical-align: baseline; font-size: 9pt}
	</style>
<script>
	$(document).ready(function () { 
		
		if($('#profileid').val()==""){
    		alert('프로필 등록을 하지 않은 유저입니다.');
    		if("${id}"=="${idch}"){
    			 var move=confirm("프로필 등록을 하시겠습니까?");
    			 if(move==true){
    				location.href="profile_form";
    			 }else{
    				 history.back();
    			 }
    		}else{
    		history.back();
    		}
		}	
        
    		
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

	<input type="hidden" id="profileid" value="${profile.member_id}">
	<img src = "resources/Image/userdefault.png" class="profile_btn"/>


	 
		<!-- Three -->
		<c:if test="${!empty profile.member_id}">
			<section id="three" class="wrapper">
			<div id="adsideWrapper">
    		<div id="adside" class="fixed"  >
    		<!-- style="overflow:scroll" -->
    		
    		<!-- 프로필 사진 칸 -->
    		<div style="width:200px;margin: 0 auto;margin-top: 20px;margin-left: 50px;" id="p_div">
    			<h1 class="profile_h1">PROFILE</h1>
    			<c:if test="${!empty profile.PROFILE_IMG_FILE}">
    			<div class="profile"><img src="resources/upload/${profile.PROFILE_IMG_FILE}" class="profile"></div>
    			</c:if>
    			<c:if test="${empty profile.PROFILE_IMG_FILE}">
    			<div class="profile"><img src="resources/Image/default_user.png" class="profile"></div>
    			</c:if>
    			<div>
    			<br>
    			
    			
    			<!-- 실명입력하면 실명 -->
    			<c:if test="${!empty profile.PROFILE_REAL_NAME}">
    			<h1 class="name">${profile.PROFILE_REAL_NAME}</h1>
    			
    			</c:if>
    			<!-- 실명 입력 안했으면 그냥 닉네임 -->
    			<c:if test="${empty profile.PROFILE_REAL_NAME}">
    			<h1 class="name">${profile.member_id}</h1>
    			</c:if>
    			
    			<c:if test="${!empty profile.PROFILE_JOB}">
    				<c:if test="${profile.PROFILE_JOB=='회사원'}">
    				<p>Employee</p>
    				</c:if>
    				<c:if test="${profile.PROFILE_JOB=='프리랜서'}">
    				<p>Freelancer</p>
    				</c:if>
    				<c:if test="${profile.PROFILE_JOB=='준비생'}">
    				<p>Job seekers</p>
    				</c:if>
    				<c:if test="${profile.PROFILE_JOB=='사업가'}">
    				<p>CEO</p>
    				</c:if>
    			</c:if>
    			</div>
    			
    			<div class="contact_div">
    			  <c:if test="${!empty profile.PROFILE_PHONE}">
    				<img class="contact" src="resources/Image/phone.png"/>
    				<span>${profile.PROFILE_PHONE}</span>
    			  </c:if>
    				<br>
    			  <c:if test="${!empty profile.PROFILE_EMAIL}">	
    				<img class="contact" src="resources/Image/email.png"/>
    				<span>${profile.PROFILE_EMAIL}</span>
    			  </c:if>	
    				<br>
    			 <c:if test="${!empty profile.PROFILE_BLOG}">	
    				<img class="contact" src="resources/Image/blog.png"/>
    				<span><a href="">${profile.PROFILE_BLOG}</a></span>
    		   	</c:if>	
    				<br>
    			<c:if test="${!empty profile.PROFILE_GIT && profile.PROFILE_GIT!=''}">	
    				<img class="contact" src="resources/Image/github.png"/>
    				<span><a href="">${profile.PROFILE_GIT}</a></span>
    			</c:if>	
    			</div>
    			<button type="button" onclick="location.href='profile_form'">등록</button>
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
						<!-- 본인이면 추가 버튼 노출 -->
						<c:if test="${id==profile.member_id}">
							<div style="text-align:right">
								<button id="add" type="button" onclick="location.href='portfolio_add'" >
									<span>프로젝트 추가</span>
									<img src="resources/Image/icon/add_btn.png" width=20/>
								</button>
							</div>
						</c:if>
						<c:if test="${!empty portfolio}">
						<div class="your-class slide">
							<c:forEach var="p" items="${portfolio}">
								<div class="slide_in"><img  class="slide_in_content" src="resources/upload/${p.PORT_FILE_PATH}/0.png"></div>
							</c:forEach>
						</div>
						</c:if>	 
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
					<h1 class="h1 user-name" >DEVELOPER ${profile.PROFILE_REAL_NAME}</h1>
					<div style="background:white" class="info_div">
					<table class="skill_table">
					<tr>
						<td><img src="resources/Image/userlevel${profile.PROFILE_YEAR}.png" class="ability"></td>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_meticulous' || 
										profile.PROFILE_STRENGTH1=='ability_social' ||
										profile.PROFILE_STRENGTH1=='ability_kind' ||
										profile.PROFILE_STRENGTH1=='ability_active' ||
										profile.PROFILE_STRENGTH1=='ability_planned' 
										
						}">
						<td><img src="resources/Image/icon/${porfile.PROFILE_STRENGTH1}.png" class="ability"></td>
						</c:if>
						
						<c:if test="${profile.PROFILE_STRENGTH1!='ability_meticulous' && 
										profile.PROFILE_STRENGTH1!='ability_social' &&
										profile.PROFILE_STRENGTH1!='ability_kind' &&
										profile.PROFILE_STRENGTH1!='ability_active' &&
										profile.PROFILE_STRENGTH1!='ability_planned' 
										
						}">
						<td><img src="resources/Image/icon/ability_etc.png" class="ability"></td>
						</c:if>
						
						
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_think' || 
										profile.PROFILE_STRENGTH2=='ability_sungsil' ||
										profile.PROFILE_STRENGTH2=='ability_teach' ||
										profile.PROFILE_STRENGTH2=='ability_group' ||
										profile.PROFILE_STRENGTH2=='ability_understand' ||
										profile.PROFILE_STRENGTH2=='ability_careful' 
										
						}">
						<td><img src="resources/Image/icon/${porfile.PROFILE_STRENGTH2}.png" class="ability"></td>
						</c:if>
						
						<c:if test="${porfile.PROFILE_STRENGTH2!='ability_think' && 
										porfile.PROFILE_STRENGTH2!='ability_sungsil' &&
										porfile.PROFILE_STRENGTH2!='ability_teach' &&
										porfile.PROFILE_STRENGTH2!='ability_group' &&
										porfile.PROFILE_STRENGTH2!='ability_understand' &&
										porfile.PROFILE_STRENGTH2!='ability_careful' 
										
						}">
						<td><img src="resources/Image/icon/ability_else.png" class="ability"></td>
						</c:if>
					</tr>
					<tr>
					  
						<td>${profile.PROFILE_YEAR}년차 개발자</td>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_meticulous'}">
						<td>꼼꼼한</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_social'}">
						<td>사교적인</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_kind'}">
						<td>친절한</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_active'}">
						<td>능동적인</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_planned'}">
						<td>계획적인</td>
						</c:if>
						
						
						<c:if test="${profile.PROFILE_STRENGTH1!='ability_meticulous' && 
										profile.PROFILE_STRENGTH1!='ability_social' &&
										profile.PROFILE_STRENGTH1!='ability_kind' &&
										profile.PROFILE_STRENGTH1!='ability_active' &&
										profile.PROFILE_STRENGTH1!='ability_planned' 
										
						}">
						<td>${profile.PROFILE_STRENGTH1}</td>
						</c:if>
						
						<!-- 두번째 키워트  글-->
						
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_think'}">
						<td>창의적인</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_sungsil'}">
						<td>성실한</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_teach'}">
						<td>리더쉽강한</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_group'}">
						<td>적응력이 뛰어난</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_understand'}">
						<td>이해력이 뛰어난</td>
						</c:if>
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_careful'}">
						<td>협동력이 뛰어난</td>
						</c:if>
						
						<c:if test="${profile.PROFILE_STRENGTH2!='ability_think' && 
										profile.PROFILE_STRENGTH2!='ability_sungsil' &&
										profile.PROFILE_STRENGTH2!='ability_teach' &&
										profile.PROFILE_STRENGTH2!='ability_group' &&
										profile.PROFILE_STRENGTH2!='ability_understand' &&
										profile.PROFILE_STRENGTH2!='ability_careful' 
										
						}">
						<td>${profile.PROFILE_STRENGTH2}</td>
						</c:if>
						
					</tr>
					</table>
					<p id="info" style="padding-bottom: 10px; font-weight: bold;">개발자 소개</p>
					<P id="info" style="padding-top: 10px">
					${profile.PROFILE_INTRO}
					</P>
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
							<c:if test="${!empty front[0]}">
							<td><img src="resources/Image/${front[0]}.png" class="skill_img" ><span class="skill_span">${front[0]}</span></td>
							</c:if>
							<c:if test="${!empty front[1]}">
							<td><img src="resources/Image/${front[1]}.png" class="skill_img"><span class="skill_span">${front[1]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty front[2]}">	
							<td><img src="resources/Image/${front[2]}.png" class="skill_img" ><span class="skill_span">${front[2]}</span></td>
							</c:if>
							<c:if test="${!empty front[3]}">
							<td><img src="resources/Image/${front[3]}.png" class="skill_img" ><span class="skill_span">${front[3]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty front[4]}">
							<td><img src="resources/Image/${front[4]}.png" class="skill_img" ><span class="skill_span">${front[4]}</span></td>
							</c:if>
							<c:if test="${!empty front[5]}">
							<td><img src="resources/Image/${front[5]}.png" class="skill_img" ><span class="skill_span">${front[5]}</span></td>
							</c:if>
						</tr>
					</table>
					<br>
					<table class="skill_table skill_stack">
					<tr>
							<td rowspan="3" width="30%">
							<img src="resources/Image/back.png" class="skill_img_m">
							<p class="h1">Backend</p>
							</td>
							<c:if test="${!empty back[0]}">
							<td><img src="resources/Image/${back[0]}.png" class="skill_img" ><span class="skill_span">${back[0]}</span></td>
							</c:if>
							<c:if test="${!empty back[1]}">
							<td><img src="resources/Image/${back[1]}.png" class="skill_img" ><span class="skill_span">${back[1]}</span></td>
							</c:if>
						</tr>
						<tr>	
							<c:if test="${!empty back[2]}">
							<td><img src="resources/Image/${back[2]}.png" class="skill_img" ><span class="skill_span">${back[2]}</span></td>
							</c:if>
							<c:if test="${!empty back[3]}">
							<td><img src="resources/Image/${back[3]}.png" class="skill_img" ><span class="skill_span">${back[3]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty back[4]}">
							<td><img src="resources/Image/${back[4]}.png" class="skill_img" ><span class="skill_span">${back[4]}</span></td>
							</c:if>
							<c:if test="${!empty back[5]}">
							<td><img src="resources/Image/${back[5]}.png" class="skill_img" ><span class="skill_span">${back[5]}</span></td>
							</c:if>
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
	</c:if>	

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