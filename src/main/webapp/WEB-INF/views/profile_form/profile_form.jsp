<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../main/navbar.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/profiles_main_slidebar.css"/>
		<style>
			.slide{width:70%;}
			.slide_in{background:white;}
		</style>
</head>
<body>
<header class="align-center">
					
						<div class="your-class slide">
  							<div class="slide_in">
  								<h1>프로젝트가 있으시다면 프로젝트를 등록해주세요</h1>
  								<input type="file" name=""> 
  							</div>
  							<div class="slide_in">your content</div>
  							<div class="slide_in">your content</div>
  							<div class="slide_in">your content</div>
  							<div class="slide_in">your content</div>
  							<div class="slide_in">your content</div>
						</div>
</header>

<jsp:include page="../main/footer.jsp"></jsp:include>
			<script>
			$(document).ready(function(){
					
				$('.slide').slick({
					  infinite: true,
					  slidesToShow: 1,
					  slidesToScroll: 1,
					  arrows: true,
					  dots:true,
					  speed:3000 
					});
				
				
				
		});
			
	</script>
</body>
</html>