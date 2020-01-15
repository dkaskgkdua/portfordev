<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PFD-프로필 등록</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<jsp:include page="../main/navbar.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/profile_main_slidebar.css"/>
		
		<style>
		input[type=radio]{opacity:1;float:none;
							-webkit-appearance: radio; display: inline-block;margin-right:0em;}
			.slide{width:100%;box-sizing: border-box;margin-top: 30px;color:black}
			.slide_in{background:white;text-align: left;overflow: auto;}
			.container {
							width: 40%;
							border: 1px solid lightgray;
							padding: 30px;
							margin-top:80px;
						}
			.insert_h1{font-size:20pt; font-weight: bold; color:black;}
			.slick-next{visibility: hidden;}
			.slick-prev{visibility: hidden;}
			#progress{display: none}
			#profile_icon{width:100px; margin:0 auto }
			#btn{margin-top: 100px;}
			.pre-next{display: none; margin-bottom:20px;height:50px;background:#2096f3; border-radius: 100%}
			#pre{position:relative; left:0px}
			#next{float:right}
			.slide_in p {color: black;text-align:left;margin: 2px;}
			.slide_in hr{margin:5px;}
			#addimg{width:30px;}
		</style>
</head>
<body>
					<div class='container'>
						<form id="profile_form">
						<div class="your-class slide">
							<div class="slide_in" style="text-align:center!important">
								<h1 class='insert_h1'>안녕하세요! ${name}회원님 
								<br>
								 프로필 등록을 시작합니다.
								 </h1>
								 <div style="margin:0 auto;">
								 <img src="resources/Image/icon/profile.png" id="profile_icon"/>
								 </div>
								 
								 <!-- 프로필 등록 시작  -->
								 <div id="btn">
								 <button type="button" id="start_btn" style="width:30%;">시작하기</button>
								 </div>
							</div>
  							<div class="slide_in">
  							<p>*영문이름 </p>
  							<input type="text" name="eng_name"><hr>
  							<p>*프로필 사진 </p>
  							<input type="file" name="profile_img"><hr>
  							<p>직업</p>
  							<input type="radio" name="job" value="front"><span>개발자</span>
  							<input type="radio" name="job "value="back"><span>보안</span>
  							<input type="radio" name="job "value="back"><span>퍼블리셔</span> 
  							<hr>
  							
  							
  							
  							
  							
  							</div>
  							<div class="slide_in">
  								<p>*전화번호</p>
  								<input type="text" name="phone">
  								<hr>
  								<p>*이메일</p>
  								<input type="email" name="email">
  								<hr>
  								<p>블로그주소</p>
  								<input type="text" name="blog">
  								<hr>
  								<p>깃허브주소</p>
  								<input type="text" name="github">
  							</div>
  							<div class="slide_in">
  								<p>연차</p>
  								<input type="text" name="github">
  								<p>강점</p>
  								<input type="text" name="github">
  							</div>
  							<div class="slide_in">
  								<p>다룰수 있는 툴을 선택해주세요</p>
  								<input type="text" name="github">
  							</div>
  							<div class="slide_in">
  								<p>자기소개</p>
  								<textarea rows="10" cols="100" maxlength="200"></textarea>
								<button type='button' id="submit">등록하기</button>  								
  							</div>
  							<div class="slide_in">
  							</div>
						</div>
						</form>
							 <div>
							 <button type="button" class="pre-next" id="pre">&lt;</button>
							 <button type="button" class="pre-next" id="next">></button>
							 </div>
  							 <div class="w3-light-grey w3-round-xlarge" id="progress">
  									  <div class="w3-container w3-blue w3-round-xlarge" id="per"style="width:0%">0%</div>
 							 </div>
					</div>	
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/skel.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script type="text/javascript" src="resources/slick/slick.min.js"></script>
			<script src="resources/js/profile_form.js"></script>
			<script>
			$(document).ready(function(){
					
				$('.slide').slick({
					  infinite: true,
					  slidesToShow: 1,
					  slidesToScroll: 1,
					  arrows: true,
					  dots:false,
					  speed:1000 
					});
				
				
				
		});
			
	</script>
</body>
</html>