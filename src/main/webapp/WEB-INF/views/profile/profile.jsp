<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE HTML>
<html>
	<head>
		<title>PFD_portfolio_main</title><!-- 나중에 _main 빼고 개발자 아이디 -->
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<jsp:include page="../portfolio/portfolio_detail.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/css/profile_main_slidebar.css"/>
		
		<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
 
		<script src="resources/js/profile.js"></script>
	<style>
	.contact_div>div{vertical-align: baseline;}
	 .inner {
		margin-left: 400px;
	}
	.contact_div span{vertical-align: baseline; font-size: 9pt}
	.modal a.close-modal{top: 1.5px;right: -1.5px;}
	#modal1{height:700px}
	</style>
<script>
	$(document).ready(function () { 
		
		if($('#profileid').val()=="" && "${id}"=="${idch}"){
			  move=confirm("프로필 등록이 되어있지 않습니다. 프로필 등록 화면으로 이동합니다.");
			 if(move==true){
				location.href="profile_form";
			 }else{
				 history.back();
			 }
		
		if($('#profileid').val()=="" && "${id}"!="${idch}"){
    		alert('프로필 등록을 하지 않은 유저입니다.');
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

	<input type="hidden" id="profileid" value="${profile.MEMBER_ID}">
	<img src = "resources/Image/userdefault.png" class="profile_btn"/>


	 
		<!-- Three -->
		<c:if test="${!empty profile.MEMBER_ID}">
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
    			<h1 class="name">${profile.MEMBER_ID}</h1>
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
    			   <div>
    				<img class="contact" src="resources/Image/phone.png"/>
    				<span>${profile.PROFILE_PHONE}</span>
    			   </div>
    			  </c:if>
    			  <c:if test="${!empty profile.PROFILE_EMAIL}">	
    			  	<div>
    					<img class="contact" src="resources/Image/email.png"/>
    					<span>${profile.PROFILE_EMAIL}</span>
    			  	</div>
    			  </c:if>	
    			 <c:if test="${!empty profile.PROFILE_BLOG}">	
    			 	<div>
    					<img class="contact" src="resources/Image/blog.png"/>
    					<span><a href="">${profile.PROFILE_BLOG}</a></span>
    		   		</div>
    		   	</c:if>	
    			<c:if test="${!empty profile.PROFILE_GIT && profile.PROFILE_GIT!=''}">	
    			  <div>
    				<img class="contact" src="resources/Image/github.png"/>
    				<span><a href="">${profile.PROFILE_GIT}</a></span>
    			  </div>	
    			</c:if>	
    			</div>
    			<c:if test="${id==profile.MEMBER_ID}">
    			<button type="button" id="profile_modify">프로필 수정</button>
    			</c:if>
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
						<c:if test="${id==profile.MEMBER_ID}">
							<div style="text-align:right">
								<button id="add" type="button" onclick="location.href='portfolio_add'" >
									<span>프로젝트 추가</span>
									<img src="resources/Image/icon/add_btn.png" width=20/>
								</button>
							</div>
						</c:if>
						<c:if test="${!empty myList}">
						<div class="your-class slide best-portfolio-list">
							<c:forEach var="port" items="${myList}">
								<div class="slide_in">
									<!-- 프로젝트  -->
									<div class="best-portfolio-item" id="best-port${port.PORT_ID}">
								<input type="hidden" class="hidden_PORT_ID" value="${port.PORT_ID}">
								<div class="bp-img-wrapper" style="background-image:url(/pro/resources/${port.PORT_THUMBNAIL})">
								</div>
								<div class="bp-info-wrapper">
								<img class="bp-info-writer-img" src="/pro/resources/${port.PORT_WRITER_IMG}">
								<div class="bp-writer-info">
									<span class="bp-info-writer">${port.PORT_WRITER}</span>
									<span class="bp-info-writer-job">${port.PORT_WRITER_JOB}</span>님
								</div>
								<span class="bp-info-subject">${port.PORT_SUBJECT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/view-gray.png">
								<span class="bp-info-view bp-count">${port.PORT_READCOUNT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/like-gray.png">
								<span class="bp-info-like bp-count">${port.PORT_LIKECOUNT}</span>
								<c:if test="${port.PORT_FEED_NEED == 0}">
								<img class="bp-icon" src="/pro/resources/Image/icon/comment-gray.png">
								<span class="bp-info-feed bp-count">${port.PORT_FEEDCOUNT}</span>
								</c:if>
								<c:if test="${id==profile.MEMBER_ID}">
								<form action = "portfolio/delete" method="post">
								<input type="hidden" name="MEMBER_ID" value="${profile.MEMBER_ID}">
								<input type="hidden" name="PORT_ID" value="${port.PORT_ID}">
								<button type="submit" class="port_delete">삭제하기</button>
								</form>
								</c:if>
							</div>
						</div>
									<!-- 프로젝트  -->
								</div>
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
					<c:if test="${id==profile.MEMBER_ID}">
					<img src="resources/Image/icon/modify.png" id="profile_modify_info">
					</c:if>
					<h1 class="h1 user-name" >DEVELOPER ${profile.PROFILE_REAL_NAME}</h1>
					
					<div style="background:white" class="info_div">
					<table class="skill_table">
					<tr>
					
					<!-- 연차 입력되었을 경우 -->
						<c:if test="${!empty profile.PROFILE_YEAR}">
						<td><img src="resources/Image/userlevel${profile.PROFILE_YEAR}.png" class="ability"></td>
						</c:if>
					<!-- 강점1 입력되었을 경운 -->	
						<c:if test="${!empty profile.PROFILE_STRENGTH1}">
						<c:if test="${profile.PROFILE_STRENGTH1=='ability_meticulous' || 
										profile.PROFILE_STRENGTH1=='ability_social' ||
										profile.PROFILE_STRENGTH1=='ability_kind' ||
										profile.PROFILE_STRENGTH1=='ability_active' ||
										profile.PROFILE_STRENGTH1=='ability_planned' 
										
						}">
						<td><img src="resources/Image/icon/${profile.PROFILE_STRENGTH1}.png" class="ability"></td>
						</c:if>
						
						<c:if test="${profile.PROFILE_STRENGTH1!='ability_meticulous' && 
										profile.PROFILE_STRENGTH1!='ability_social' &&
										profile.PROFILE_STRENGTH1!='ability_kind' &&
										profile.PROFILE_STRENGTH1!='ability_active' &&
										profile.PROFILE_STRENGTH1!='ability_planned' 
										
						}">
					<!-- 기타 강점 입력시  -->
						<td><img src="resources/Image/icon/ability_etc.png" class="ability"></td>
						</c:if>
						</c:if>
						
						
						<c:if test="${!empty profile.PROFILE_STRENGTH2}">
						<c:if test="${profile.PROFILE_STRENGTH2=='ability_think' || 
										profile.PROFILE_STRENGTH2=='ability_sungsil' ||
										profile.PROFILE_STRENGTH2=='ability_teach' ||
										profile.PROFILE_STRENGTH2=='ability_group' ||
										profile.PROFILE_STRENGTH2=='ability_understand' ||
										profile.PROFILE_STRENGTH2=='ability_careful' 
										
						}">
						<td><img src="resources/Image/icon/${profile.PROFILE_STRENGTH2}.png" class="ability"></td>
						</c:if>
						
						
						<!-- 기타 강점 입력시  -->
						<c:if test="${profile.PROFILE_STRENGTH2!='ability_think' && 
										profile.PROFILE_STRENGTH2!='ability_sungsil' &&
										profile.PROFILE_STRENGTH2!='ability_teach' &&
										profile.PROFILE_STRENGTH2!='ability_group' &&
										profile.PROFILE_STRENGTH2!='ability_understand' &&
										profile.PROFILE_STRENGTH2!='ability_careful' 
										
						}">
						<td><img src="resources/Image/icon/ability_else.png" class="ability"></td>
						</c:if>
						</c:if>
					</tr>
					<tr>
					  	<c:if test="${!empty profile.PROFILE_YEAR}">
						<td>${profile.PROFILE_YEAR}년차 개발자</td>
						</c:if>
						
						<c:if test="${!empty profile.PROFILE_STRENGTH1}">
						
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
					<c:if test="${id==profile.MEMBER_ID}">
						<img src="resources/Image/icon/modify.png" id="profile_modify_skill">
					</c:if>
					<h1 class="h1">SKILL</h1>
					<!-- <img src="resources/Image/skill1.png" width=50 class="skill"> -->
					<table class="skill_table skill_stack">
						<tr>
							<td rowspan="3" width="40%">
							<img src="resources/Image/front.png" class="skill_img_m">
							<p class="h1">Frontend</p>
							</td>
							<c:if test="${!empty front[0]}">
							<td width="20%"><img src="resources/Image/${front[0]}.png" class="skill_img" ><span class="skill_span">${front[0]}</span></td>
							</c:if>
							<c:if test="${!empty front[1]}">
							<td width="20%"><img src="resources/Image/${front[1]}.png" class="skill_img"><span class="skill_span">${front[1]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty front[2]}">	
							<td width="20%"><img src="resources/Image/${front[2]}.png" class="skill_img" ><span class="skill_span">${front[2]}</span></td>
							</c:if>
							<c:if test="${!empty front[3]}">
							<td width="20%"><img src="resources/Image/${front[3]}.png" class="skill_img" ><span class="skill_span">${front[3]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty front[4]}">
							<td width="20%"><img src="resources/Image/${front[4]}.png" class="skill_img" ><span class="skill_span">${front[4]}</span></td>
							</c:if>
							<c:if test="${!empty front[5]}">
							<td width="20%"><img src="resources/Image/${front[5]}.png" class="skill_img" ><span class="skill_span">${front[5]}</span></td>
							</c:if>
						</tr>
					</table>
					<br>
					<table class="skill_table skill_stack">
					<tr>
							<td rowspan="3" width="40%">
							<img src="resources/Image/back.png" class="skill_img_m">
							<p class="h1">Backend</p>
							</td>
							<c:if test="${!empty back[0]}">
							<td width="20%"><img src="resources/Image/${back[0]}.png" class="skill_img" ><span class="skill_span">${back[0]}</span></td>
							</c:if>
							<c:if test="${!empty back[1]}">
							<td width="20%"><img src="resources/Image/${back[1]}.png" class="skill_img" ><span class="skill_span">${back[1]}</span></td>
							</c:if>
						</tr>
						<tr>	
							<c:if test="${!empty back[2]}">
							<td width="20%"><img src="resources/Image/${back[2]}.png" class="skill_img" ><span class="skill_span">${back[2]}</span></td>
							</c:if>
							<c:if test="${!empty back[3]}">
							<td width="20%"><img src="resources/Image/${back[3]}.png" class="skill_img" ><span class="skill_span">${back[3]}</span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${!empty back[4]}">
							<td width="20%"><img src="resources/Image/${back[4]}.png" class="skill_img" ><span class="skill_span">${back[4]}</span></td>
							</c:if>
							<c:if test="${!empty back[5]}">
							<td width="20%"><img src="resources/Image/${back[5]}.png" class="skill_img" ><span class="skill_span">${back[5]}</span></td>
							</c:if>
						</tr>
					</table>
					
					<h1 style="font-size: 15pt" id="adad">기술 스택소개</h1>
					<p class="adad_content">${profile.PROFILE_TECH_INTRO}</p>
					<br>
					<br>
					<hr>
					<br>
					<h1 class="h1">CONTACT</h1>
					<br>
					<br>
					<div class="flex flex-2">
					<c:if test="${!empty profile.PROFILE_GIT}">
						<article>
							<div class="image fit">
								<img src="resources/Image/pic01.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Github</h3>
								<p>${profile.PROFILE_GIT}</p>
							</header>
							<footer>
								<a href="https://${profile.PROFILE_GIT}" target="_blank" class="button special">More</a>
							</footer>
						</article>
					</c:if>
					<c:if test="${!empty profile.PROFILE_BLOG}">	
						<article>
							<div class="image fit">
								<img src="resources/Image/pic02.jpg" alt="Pic 02" />
							</div>
							<header>
								<h3>blog</h3>
								<p>${profile.PROFILE_BLOG}</p>
							</header>
							<footer>
								<a href="https://${profile.PROFILE_BLOG}" target="_blank" class="button special">More</a>
							</footer>
						</article>
					</c:if>	
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
	
	<!-- 모달창1 -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
  	  <div class="modal-content">
	<!-- <div id="modal1" class="modal"> -->
		<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">사이드바 수정</h4>
 			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 				 <span aria-hidden="true">×</span>
 			</button>
		</div>

		<div class="modal-body">
		<form method="post" action="profile_modify" id="profile_mody_form" enctype='multipart/form-data'>
		<span>이름</span>
		<input type="hidden" value="${profile.MEMBER_ID}" name="MEMBER_ID">
		<c:if test="${!empty profile.PROFILE_REAL_NAME}">
		<input type="text" name="PROFILE_REAL_NAME" value="${profile.PROFILE_REAL_NAME}">
		</c:if>
		<c:if test="${empty profile.PROFILE_REAL_NAME}">
		<input type="text" name="PROFILE_REAL_NAME" value="${profile.MEMBER_ID}">
		</c:if>
		<span>프로필 사진</span><br>
		<input type="file" style="display:none" name="profile_img" id="profileimg">
		<c:if test="${!empty profile.PROFILE_IMG_ORI}">
		<label for="profileimg" id="profileImgLabel">
			<img src="resources/Image/attach.png" id="addprofile" width=30 style="display:none;"/>
		</label>
			<span id="profileimg_span">${profile.PROFILE_IMG_ORI}</span>
			<input type = "hidden" name="chkimg" id="chkimg" value="${profile.PROFILE_IMG_ORI}">
			<input type = "hidden" name="PROFILE_IMG_ORI" value="${profile.PROFILE_IMG_ORI}"> 
			<input type = "hidden" name="PROFILE_IMG_FILE" value="${profile.PROFILE_IMG_FILE}">  
			<img src="resources/Image/remove.png" width=20 id="profile_remove"/>
			<br>
			<img src="resources/upload/${profile.PROFILE_IMG_FILE}" id="img" width="100">
			
		</c:if>
		<c:if test="${empty profile.PROFILE_IMG_ORI}">
		<label for="profileimg" id="profileImgLabel">
			<img src="resources/Image/attach.png" id="addprofile" width=30 style="display:inline-block;"/>
			<span id="profileimg_span">${profile.PROFILE_IMG_ORI}</span>
			<input type = "hidden" name="chkimg" id="chkimg" value="${profile.PROFILE_IMG_ORI}">
			<input type = "hidden" name="PROFILE_IMG_ORI" value="${profile.PROFILE_IMG_ORI}"> 
			<input type = "hidden" name="PROFILE_IMG_FILE" value="${profile.PROFILE_IMG_FILE}"> 
			<img src="resources/Image/remove.png" width=20 id="profile_remove" style="display:none;"/>
			<br>
			<img src="" id="img" width="100">
		</label>
		</c:if>
		<br>
		<span>전화번호</span>
		<input type="text" name="PROFILE_PHONE" value="${profile.PROFILE_PHONE}">
		<span>이메일</span>
		<input type="text" name="PROFILE_EMAIL" value="${profile.PROFILE_EMAIL}">
		<span>블로그</span>
		<input type="text" name="PROFILE_BLOG" value="${profile.PROFILE_BLOG}">
		<span>깃헙</span>
		<input type="text" name="PROFILE_GIT" value="${profile.PROFILE_GIT}">
		<div>
			<button type="submit" class="btn btn-info" id="profile_mody" style="width:100%">수정</button>
		</div>
		</form>
		</div>
	</div>
	</div>
	</div>
	
	
	
	<!-- 모달창2 -->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
  	  <div class="modal-content">
	<!-- <div id="modal1" class="modal"> -->
		<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">사이드바 수정</h4>
 			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 				 <span aria-hidden="true">×</span>
 			</button>
		</div>

		<div class="modal-body">
		<form id="profile_intro">
		<input type="hidden" value="${profile.MEMBER_ID}" name="MEMBER_ID">
		<span>연차</span><br>
		<input type="text" value="${profile.PROFILE_YEAR}" name="PROFILE_YEAR">
				<span>키워드를 골라주세요(성격)</span><br>
  								<select id="select1">
  									<option value="">선택없음</option>
  									<option value="ability_meticulous">꼼꼼한</option>
  									<option value="ability_social">사교적인</option>
  									<option value="ability_kind">친절함</option>
  									<option value="ability_active">능동적인</option>
  									<option value="ability_planned">계획적인</option>
  									<option value="직접입력">직접입력 </option>
  								</select>
  								<input type="hidden" name="PROFILE_STRENGTH1" id="type1">
  								
  								<span>키워드를 골라주세요(업무)</span><br>
  								<select  id="select2">
  									<option value="">선택없음</option>
  									<option value="ability_think">창의성</option>
  									<option value="ability_sungsil">성실성</option>
  									<option value="ability_teach">리더쉽</option>
  									<option value="ability_group">적응력</option>
  									<option value="ability_understand">이해력</option>
  									<option value="ability_careful">협동력</option>
  									<option value="직접입력">직접입력</option>
  								</select>
  								<input type="hidden" name="PROFILE_STRENGTH2" id="type2">
		<span>개발자 소개</span>
		<textarea rows="10" cols="75" name="PROFILE_INTRO">${profile.PROFILE_INTRO}</textarea>
		<div>
			<button type="button" class="btn btn-info" id="profile_mody_2" style="width:100%">수정</button>
		</div>
		</form>
		</div>
	</div>
	</div>
	</div>
	
	
	<!-- 모달창3 -->
	<div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
  	  <div class="modal-content">
	<!-- <div id="modal1" class="modal"> -->
		<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">SKILL 수정</h4>
 			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 				 <span aria-hidden="true">×</span>
 			</button>
		</div>

		<div class="modal-body">
		<form id="profile_skill">
		<input type="hidden" value="${profile.MEMBER_ID}" name="MEMBER_ID">
		<p>다룰수 있는 툴을 선택해주세요</p>
  								<select id="skill" name="skill"onchange="categoryChange(this)">
  										<option>선택</option>
  										<option value="1">frontend</option>
  										<option value="2">backend</option>
  								</select>
  								
  								<select class="select2" name="skill_detail" id="skill_detail" onchange="select11()">
  								</select>
  								<div class="result_div">
  								<span>Frontend</span>
  								<div>
  									<input type="text" id="select_result" name="PROFILE_TECH_FRONT" style="background: white" readonly="readonly"  value="${profile.PROFILE_TECH_FRONT}">
  									<button type="button" id="select_result_delete"><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
  								</div>
  								<span>Backend</span>
  								<div>
  									<input type="text" id="select_result2" name="PROFILE_TECH_BACK" style="background: white" readonly="readonly" value="${profile.PROFILE_TECH_BACK}">
  									<button type="button" id="select_result2_delete" ><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
  								</div>
  								</div><!-- result_div끝 -->
  								
  								
  								<!-- 기술스택 소개 -->
  								<div>
  								<p>자세한 기술스택을 입력해주세요</p>
  								<textarea rows="8" cols="90" maxlength="200" name="PROFILE_TECH_INTRO">${profile.PROFILE_TECH_INTRO}</textarea>
  								</div>
  								
  								<div>
									<button type="button" class="btn btn-info" id="profile_mody3" style="width:100%">수정</button>
						</div>
				</form>
		</div>
	</div>
	</div>
	</div>
	
	</body>
</html>