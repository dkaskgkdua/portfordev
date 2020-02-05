<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PFD Profile Write</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<jsp:include page="../main/navbar.jsp"></jsp:include>
      <link rel="stylesheet" type="text/css" href="resources/css/profile_main_slidebar.css"/>
      <link rel="stylesheet" type="text/css" href="resources/css/profile_form.css"/>
      
      <style>
      img{vertical-align: middle;}
      #submit{background:#2196F3!important;width:100%;border-radius:5px}
      </style>
      <script>
      /*셀렉트 바꿀때마다 바뀌는ㄴ*/
      function select11(){
         var ori="";
         var newselect = $('#skill_detail').val();
         var select_parent = $('#skill').val();
         if(select_parent==1){
         ori = $('#select_result').val();
            if(newselect=="선택"){
               return;
            }
         
            if(ori==""||ori==null){
                $('#select_result').val(newselect);
            }else{
               
               if(ori.indexOf(newselect)!=-1){
                  alert("이미 포함된 항목입니다.");
                  return;
               }
               var checkcnt=ori.split(',');
               if(checkcnt.length>=5){
                  alert("여섯개까지만 선택 가능합니다.");
                  return
               }
                $('#select_result').val(ori+','+newselect);
                
            }
         }else{
            
         
         ori = $('#select_result2').val();
         if(newselect=="선택"){
            return;
         }
            if(ori==""||ori==null){
                $('#select_result2').val(newselect);
            }else{
               if(ori.indexOf(newselect)!=-1){
                  alert("이미 포함된 항목입니다.");
                  return;
               }
               var checkcnt=ori.split(',');
               if(checkcnt.length>=5){
                  alert("여섯개까지만 선택 가능합니다.");
                  return
               }
                $('#select_result2').val(ori+','+newselect);
            }
         }
         
       }
      
      function categoryChange(e) {
         var good_a = ["선택","javaScript", "node.js", "vue.js","react.js","angular.js","jquery"];
         var good_b = ["선택","java", "spring", "oracle", "C","server","system","python"];
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
                       <p>프로필 사진 </p>
                       <input type="file" id="file" name="profile_img" accept=" image/*">
                       <img src="resources/Image/icon/default_user.png" id="img" width="100">
                       <hr>
                       <p>*직업(필수)</p>
                       <input type="radio" name="PROFILE_JOB" value="회사원"><span>회사소속</span>
                       <input type="radio" name="PROFILE_JOB"value="프리랜서"><span>프리랜서</span>
                       <input type="radio" name="PROFILE_JOB"value="준비생"><span>구직자</span> 
                       <input type="radio" name="PROFILE_JOB"value="사업가"><span>사업가</span> 
                       <hr>
                       </div>
                       <div class="slide_in">
                          <p>*이메일(필수)</p>
                          <input type="email" name="PROFILE_EMAIL">
                          <hr>
                          <p>전화번호</p>
                          <input type="text" name="PROFILE_PHONE">
                          <hr>
                          <p>블로그주소</p>
                          <input type="text" name="PROFILE_BLOG">
                          <hr>
                          <p>깃허브주소</p>
                          <input type="text" name="PROFILE_GIT">
                       </div>
                       <div class="slide_in">
                          <p>연차</p>
                          <input type="number" maxlength="2" name="PROFILE_YEAR">
                          <span id="check_PROFILE_YEAR"></span>
                          <hr>
                          <p>키워드를 골라주세요(성격)</p>
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
                          
                          <hr>
                          <p>키워드를 골라주세요(업무)</p>
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
                       </div>
                       <div class="slide_in">
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
                             <input type="text" id="select_result" name="PROFILE_TECH_FRONT" style="background: white" readonly="readonly">
                             <button type="button" id="select_result_delete"><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
                          </div>
                          <span>Backend</span>
                          <div>
                             <input type="text" id="select_result2" name="PROFILE_TECH_BACK" style="background: white" readonly="readonly">
                             <button type="button" id="select_result2_delete" ><img class="delete" src="resources/Image/icon/delete_btn.png"/></button>
                          </div>
                          </div><!-- result_div끝 -->
                          
                          
                          <!-- 기술스택 소개 -->
                          <div>
                          <p>자세한 기술스택을 입력해주세요</p>
                          <textarea rows="8" cols="90" maxlength="200" name="PROFILE_TECH_INTRO"></textarea>
                          
                          </div>
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