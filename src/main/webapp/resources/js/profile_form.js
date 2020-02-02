var cnt = 0 ;
var out='';
var id= $('#user_id').val();



/*이전버튼 이벤트*/
	function pre(){
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

}	
	
	
	$("input[name=profile_img]").on('change',function (e)
    {
        // 선택한 그림의 File 객체를 취득
        var file = e.target.files[0];   // File 객체 리스트에서 첫번째 File 객체를 가져옵니다.
        
        // file.type : 파일의 형식 ( MIME 타입 - ex. text/html )
        if(!file.type.match('image.*'))   // 파일 타입이 image 인지 확인합니다.
        {
           alert('확장자는 이미지 확장자만 가능합니다.');
           return;
        }
        // 파일을 읽기 위한 객체 생성
        var reader = new FileReader();
        
        // DataURL 형식으로 파일을 읽어옵니다.
        // 읽어온 결과는 reader 객체의 result 속성에 저장됩니다.
        reader.readAsDataURL(file);
        
        // 읽기에 성공했을 때 실행되는 이벤트 핸들러
        reader.onload = function(e)
        {
           // result : 읽기 결과가 저장됩니다.
           // reader.result 또는 e.target.result
           $('#img').attr('src', e.target.result);
        }   // reader.onload end
     }   // preview end

	)	
	
/*직접입력 이벤트*/
$('#select1').on('change',function(){
		var value1=$('#select1').val();
		if(value1!="직접입력"){
			$('#type1').val("");
			$('#type1').val(value1);
			$('#type1').attr('type','hidden');
		}else if(value1=="직접입력"){
			$('#type1').val("");
			$('#type1').attr('type','text');
			$('#type1').focus();
		}
		
})

$('#select2').on('change',function(){
		var value2=$('#select2').val();
		if(value2!="직접입력"){
			$('#type2').val("");
			$('#type2').val(value2);
			$('#type2').attr('type','hidden');
		}else if(value2=="직접입력"){
			$('#type2').val("");
			$('#type2').attr('type','text');
			$('#type2').focus();
		}
		
})
/*선택 비우기 이벤트*/
$('#select_result_delete').on('click',function(){
	$('#select_result').val("");
	
})

$('#select_result2_delete').click(function(){
	$('#select_result2').val("");
	
})


/*시작 버튼*/
$("#start_btn").click(function(){
	$.ajax({
		type:"post",
		url:"profile_check",
		data:{"id":id},
		success:function(item){
			if(item!=0){
				var q = confirm("이미 등록된 프로필이 존재합니다 . 프로필 화면으로 이동하시겠습니까?");
				if(q=="true"){
					location.href="profile?idch="+id;
				}else{
					history.back();
				}
			}else{
				$('.slick-next').click();
				$(this).css('display','none');
				$('#progress').css('display','block');
				$('#per').text('');
				$('#per').text(0*cnt+'%');
				$('#per').animate({
					width:(10*cnt)+'%'
				},1000)
				$('.pre-next').css('display','inline-block');
			}
		}//success 문 끝
		
		
	})
	
	

})
/*이전버튼 */ 
var precnt=0;
 $('#pre').click(pre);
 
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
	
	
	
	/*유효성 검사*/
	
	if($("input[name=PROFILE_JOB]:checked").length<1){
			alert("직업을 선택해주세요");
			
			return false;
		}
	
	if($('input[name=PROFILE_EMAIL]').val()==''){
			alert("이메일을 입력해주세요");
		
		return false;
	}
	
	
	var form = $('#profile_form')[0];
    var formData = new FormData(form);
 $.ajax({
	 type:'post',
	 enctype: 'multipart/form-data',
	 url:'profile_insert',
	 data: formData,
	 processData: false, // 필수 
	 contentType: false, // 필수

	 success: function(item){
      $('#next').click();
      out+="<h1 class='insert_h1'>등록을 완료하였습니다.</h1>";
      out+="<div style='margin-bottom:50px'>";	
      out+="<img src='resources/Image/icon/check.png' style='width:80px;  margin: 0 auto;'>'"
      out+="</div>";	  
      out+="<a href='profile?idch="+id+"'><button type='button'class='end' id='goprofile'>프로필로 이동</button></a>";
      $('#finish').append(out);
      
	 },
	 error:function(){
		 $('#next').click();
	      out+="<h1 class='insert_h1'>등록을 실패하였습니다. 다시시도해주세요.</h1>";
	      out+="<div style='margin-bottom:50px'>";	
	      out+="<img src='resources/Image/icon/fail.png' style='width:80px; margin: 0 auto;'>'"
	      out+='</div>';
	      out+="<button type='button' class='end' id='retry'>다시 등록하기</button>";
	      out+="<button type='button' class='end' id='gomain'>메인 페이지</button>";
	      $('#finish').append(out);
	 }

 })

 
 	$('#gomain').click(function(){
 		location.href="pro";
 		
 	})
 	
 	$('#retry').click(function(){
 		location.href="profile_form";
 		
 	})
 	$('#goprofile').click(function(){
 		location.href="profile?idch"+id;
 		
 	})
 		
 	

 

})