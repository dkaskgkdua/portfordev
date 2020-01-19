var cnt = 0 ;
var out='';
/*시작 버튼*/
$("#start_btn").click(function(){
	$('.slick-next').click();
	$(this).css('display','none');
	$('#progress').css('display','block');
	$('#per').text('');
	$('#per').text(0*cnt+'%');
	$('#per').animate({
		width:(10*cnt)+'%'
	},1000)
	$('.pre-next').css('display','inline-block');

})
/*이전버튼 */ 
var precnt=0;
$('#pre').click(function(){
	/*밑에 진행 퍼센트가 실행되는동안 버튼 막기 */
	$('#pre').prop('disabled',true);
	setTimeout(function(){
		$('#pre').prop('disabled',false);
	},500);
	/**/
	cnt--;
	console.log(cnt);
	if(cnt<0){
		
		
		cnt=0;
		var back=confirm("첫번째 페이지 입니다.등록을 취소하시겠습니까?");
		if(back==true){
			history.back();
		}
		return false;
	}
	if(cnt<4){
		$('#next').css('display','inline-block');	
		}
	$('.slick-prev').click();
	$('#per').text('');
	$('#per').text((20*cnt)+'%');
	$('#per').animate({
		width:(20*cnt)+'%'
	},500)

})
/*다음 버튼*/ 
$('#next').click(function(){
	
	/*밑에 진행 퍼센트가 실행되는동안 버튼 막기 */
	$('#next').prop('disabled',true);
	setTimeout(function(){
		$('#next').prop('disabled',false);
	},500);
	/**/
	
	
	if(cnt<=5){
	cnt++;
	}
	console.log(cnt);
	
	if(cnt==4){
	$('#next').css('display','none');
	}
	
	if(cnt==5){
	$('#next_div').css('display','none');
	}else{
		$('#next_div').css('display','block');
	}
	if(cnt>5){
		cnt=5;
		return false;
	}
	
	$('.slick-next').click();
	$('#per').text('');
	$('#per').text(20*cnt+'%');
	$('#per').animate({
		width:(20*cnt)+'%'
	},500)

})
console.log("클릭 횟수 "+cnt);


/*ajax등록*/
$('#submit').click(function(){ 
	var form = $('#profile_form')[0];
    var formData = new FormData(form);
	console.log("보낸 데이터 22"+formData.get('eng_name'));
 $.ajax({
	 type:'post',
	 enctype: 'multipart/form-data',
	 url:'profile_insert',
	 data: formData,
	 processData: false, // 필수 
	 contentType: false, // 필수

	 success: function(item){
      alert("에이젝스 성공="+item.result);
      $('#next').click();
      out+="<h1 class='insert_h1'>등록을 완료하였습니다.</h1>";
      out+="<div style='margin-bottom:50px'>";	
      out+="<img src='resources/Image/icon/check.png' style='width:80px;  margin: 0 auto;'>'"
      out+="</div>";	  
      out+="<button type='button'class='end'>프로필로 이동</button>";
      $('#finish').append(out);
      
	 },
	 error:function(){
		 $('#next').click();
	      out+="<h1 class='insert_h1'>등록을 실패하였습니다. 다시시도해주세요.</h1>";
	      out+="<div style='margin-bottom:50px'>";	
	      out+="<img src='resources/Image/icon/fail.png' style='width:80px; margin: 0 auto;'>'"
	      out+='</div>';
	      out+="<button type='button' onclick='location.href=profile_form'>다시 등록하기</button>";
	      out+="<button type='button' class='end'>메인 페이지</button>";
	      $('#finish').append(out);
	 }


 })



})

