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
					if(newselect=="선택"){
						return;
					}
					
					if(ori.indexOf(newselect)!=-1){
						alert("이미 포함된 항목입니다.");
						return;
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
					if(newselect=="선택"){
						return;
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

$(function(){
	/* 포트폴리오 관련 */
	// slide-item hover 시
	$('.best-portfolio-item').hover(function(){
		$(this).children('.bp-info-wrapper').stop().fadeIn();
	}, function(){
		$(this).children('.bp-info-wrapper').stop().fadeOut();
	});
	$('.best-portfolio-list').css('display', 'none').on('init', function(event, slick){
		$('.loading-list').css('display', 'none');
		$('.best-portfolio-list').resize();
		$('.best-portfolio-list').stop().fadeIn();
	});
	  
	/*모달 관련 js*/
	$('#select_result_delete').on('click',function(){
		$('#select_result').val("");
		
	})

	$('#select_result2_delete').click(function(){
		$('#select_result2').val("");
		
	})
	
	
	/*모달여는 것 */
	$(".modal-content").css("height","");
	$('#profile_modify').on('click',function(event){
		event.preventDefault();
		$("#modal1").modal();
		
	});
	
	$('#profile_modify_info').on('click',function(event){
		event.preventDefault();
		$('#modal2').modal();
	})
	
	$('#profile_modify_skill').on('click',function(event){
		event.preventDefault();
		$('#modal3').modal();
	})
	
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
	
	$('#profile_mody_2').click(function(){
		var data = $('#profile_intro').serialize();
		$.ajax({
			type:'post',
			url:'profile_modify_intro',
			data:data,
			success:function(item){
				location.href="profile?idch="+item.id;
			},
			error:function(){
				alert('변경실패 다시 시도해주세요');
				
			}
			
		})//ajaxend
		
		
	})
	
	
	$('#profile_mody3').click(function(){
		var data = $('#profile_skill').serialize();
		$.ajax({
			type:'post',
			url:'profile_modify_skill',
			data:data,
			success:function(item){
				location.href="profile?idch="+item.id;
			},
			error:function(){
				alert('변경실패 다시 시도해주세요');
				
			}
			
		})//ajaxend
		
		
	})
	
	
	function preview(e)
         {
            // 선택한 그림의 File 객체를 취득
            var file = e.target.files[0];   // File 객체 리스트에서 첫번째 File 객체를 가져옵니다.
            
            // file.type : 파일의 형식 ( MIME 타입 - ex. text/html )
            if(!file.type.match('image.*'))   // 파일 타입이 image 인지 확인합니다.
            {
               alert('확장자는 이미지 확장자만 가능합니다.');
               var agent = navigator.userAgent.toLowerCase();

               if (agent.indexOf("msie") != -1) {
            		// ie 일때 input[type=file] init.
            		$("#profileimg").replaceWith( $("#file").clone(true) );
            	} else {
            		// other browser 일때 input[type=file] init.
            		$("#profileimg").val("");
            	}

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