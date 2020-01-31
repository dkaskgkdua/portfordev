$(function(){
	$(".modal-content").css("height","");
	$('#profile_modify').on('click',function(event){
		event.preventDefault();
		$("#modal1").modal();
		
	});
	
	$("#profileimg").on('change',function(e){
		var text=$(this)[0].files[0].name;
		$("#addprofile").css('display','none');
		$("#profile_remove").css('display','inline-block');
		preview(e);
		$('#profileimg_span').text(text);
		$('#chkimg').val(text);
	})
	
	$("#profile_remove").click(function(){
		 $('#profileimg_span').text("");
		 $('#chkimg').val("");
			
		$("#profile_remove").css('display','none');
		$("#addprofile").css('display','inline-block');
		 $('#img').attr('src','');
		
	})
	
	
	
	function preview(e)
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
})