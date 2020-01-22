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
		<link rel="stylesheet" type="text/css" href="resources/css/profile_form.css"/>
		
		<style>
		
		</style>
		<script>
		/*셀렉트 바꿀때마다 바뀌는ㄴ*/
		function select11(){
			var ori="";
			var newselect = $('#skill_detail').val();
			var select_parent = $('#skill').val();
			if(select_parent==1){
			ori = $('#select_result').val();
				if(ori==""||ori==null){
					 $('#select_result').val(newselect);
				}else{
			 		$('#select_result').val(ori+','+newselect);
			 		
				}
			}else{
			ori = $('#select_result2').val();
				if(ori==""||ori==null){
					 $('#select_result2').val(newselect);
				}else{
		 			$('#select_result2').val(ori+','+newselect);
				}
			}
			

		 }
		
		function categoryChange(e) {
			var good_a = ["jsp", "javaScript", "node.js", "vue.js","react.js"];
			var good_b = ["java", "spring", "oracle", "c"];
			var target = document.getElementById("skill_detail");

			if(e.value == "1") var d = good_a;
			else if(e.value == "2") var d = good_b;

			target.options.length = 0;

			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}	
		}
		</script>
</head>
<body>
	<input type="hidden" value="${id}" id="user_id">
					<div class='container'>
						<form id="profile_form">
						<div class="your-class slide">
							<div class="slide_in" style="text-align:center!important">
								<h1 class='insert_h1'>안녕하세요! ${nickname}회원님 
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
  							<p>이름(미입력시 닉네임이 노출됩니다.) </p>
  							<input type="text" name="PROFILE_REAL_NAME"><hr>
  							<p>*프로필 사진 </p>
  							<input type="file" id="file"name="profile_img"><hr>
  							<p>직업</p>
  							<input type="radio" name="job" value="회사원"><span>회사소속</span>
  							<input type="radio" name="job "value="프리랜서"><span>프리랜서</span>
  							<input type="radio" name="job "value="준비생"><span>구직자</span> 
  							<input type="radio" name="job "value="사업가"><span>사업가</span> 
  							<hr>
  							</div>
  							<div class="slide_in">
  								<p>*전화번호</p>
  								<input type="text" name="PROFILE_PHONE">
  								<hr>
  								<p>*이메일</p>
  								<input type="email" name="PROFILE_EMAIL">
  								<hr>
  								<p>블로그주소</p>
  								<input type="text" name="PROFILE_BLOG">
  								<hr>
  								<p>깃허브주소</p>
  								<input type="text" name="PROFILE_GIT">
  							</div>
  							<div class="slide_in">
  								<p>연차</p>
  								<input type="text" name="PROFILE_YEAR">
  								<hr>
  								<p>강점1</p>
  								<select id="select" name="PROFILE_STRENGTH1">
  									<option>선택</option>
  									<option >협동력</option>
  									<option >성실성</option>
  									<option >리더쉽</option>
  									<option >꼼꼼함</option>
  									<option >노력파</option>
  									<option >직접입력</option>
  								</select>
  								<hr>
  								<p>강점2</p>
  								<select id="select" name="PROFILE_STRENGTH2">
  									<option>선택</option>
  									<option>협동력</option>
  									<option>성실성</option>
  									<option>리더쉽</option>
  									<option>꼼꼼함</option>
  									<option>노력파</option>
  									<option>직접입력</option>
  								</select>
  							</div>
  							<div class="slide_in">
  								<p>다룰수 있는 툴을 선택해주세요</p>
  								<select id="skill" name="skill"onchange="categoryChange(this)">
  										<option>선택</option>
  										<option value="1">frontend</option>
  										<option value="2">backend</option>
  								</select>
  								
  								<select class="select2" name="skill_detail" id="skill_detail" onchange="select11()">
  									<option>선택</option>
  								</select>
  								<div class="result_div">
  								<span>Frontend</span>
  								<div>
  									<input type="text" id="select_result" name="PROFILE_TECH_FRONT" style="background: white" readonly="readonly">
  									<button type="button" id="select_result_delete"><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
  								</div>
  								<span>Backend</span>
  								<div>
  									<input type="text" id="select_result2" name="PROFILE_TECH_BACK" style="background: white" readonly="readonly">
  									<button type="button" id="select_result2_delete" ><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
  								</div>
  								</div><!-- result_div끝 -->
  							</div>
  							<div class="slide_in">
  								<p>자기소개</p>
  								<textarea rows="10" cols="100" maxlength="200" name="PROFILE_INTRO"></textarea>
								<button type='button' id="submit">등록하기</button>  								
  							</div>
  							<div class="slide_in" id="finish">
  							</div>
						</div>
						</form>
							 <div id="next_div">
							 <button type="button" class="pre-next" id="pre">
							 	<img src="resources/Image/icon/pre_btn.png" width=20/>
							 </button>
							 <button type="button" class="pre-next" id="next">
							 	<img src="resources/Image/icon/next_btn.png" width=20/>
							 </button>
							 </div>
  							 <div class="w3-light-grey w3-round-xlarge" id="progress">
  									  <div class="w3-container w3-blue w3-round-xlarge" id="per"style="width:0%">0%</div>
 							 </div>
					</div>	
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/skel.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script src="resources/js/jquery.form.js"></script>
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
					  speed:500 
					});
				
				
				
				
				
				
		});
			
	</script>
</body>
</html>