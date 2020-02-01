<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>
<jsp:include page="../main/navbar.jsp" />
<script src="https://www.google.com/recaptcha/api.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
<style>
.container {
   padding-top: 55px;
}
#upfile {
   display: none;
}
img {
   width: 25px;
}
img:hover {
   cursor: pointer
}
p {
	margin : 0 0 0 0 !important;
}
</style>
<script>
	function show() {
		if ($('#filevalue').text() == '') {
			// 파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게 한다.
			$(".remove").css('display', 'none');
		} else {
			$(".remove").css('display', 'inline-block');
		}
	};
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data: form_data,
			type : "post",
			url: 'summer_image',
			cache :false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage', img_name);
			}
		});
	}
	$(function() {
		show();
		 $('#board_content').summernote({
			 	placeholder: '최대 500자 작성 가능합니다.',
		        height: 300,
		        lang: 'ko-KR',
		        callbacks: {
		        	onImageUpload: function(files, editor, welEditable) {
		        		for(var i = files.length -1; i>=0; i--) {
		        			sendFile(files[i], this);
		        		}
		        	}
		        }
		 });
		 if("${BOARD_CATEGORY}"=="0") {
				$('#h3_category').text("자유게시판");
			} else if("${BOARD_CATEGORY}"=="1"){
				$('#h3_category').text("스터디");
			} else {
				$('#h3_category').text("Q&A");
			}	
		
		$("#add_board_button").click(function() {
				if ($.trim($("#board_pass").val()) == "") {
					alert("비밀번호를 입력하세요");
					$("#board_pass").focus();
					return false;
				}
				var pattern = /^\d{4}$/;
				var password = $("#board_pass").val();
				if (!pattern.test(password)) {
					alert("비밀번호 4자리를 맞춰주세요.");
					return false;
				}
				
				if ($.trim($("#board_subject").val()) == "") {
					alert("제목을 입력하세요");
					$("#board_subject").focus();
					return false;
				}
				
				if ($.trim($("#board_content").val()) == "") {
					alert("내용을 입력하세요");
					$("#board_content").focus();
					return false;
				}
				$.ajax({
		            url: '/pro/VerifyRecaptcha',
		            type: 'post',
		            data: {
		                recaptcha: $("#g-recaptcha-response").val()
		            },
		            success: function(data) {
		                switch (data) {
		                    case 0:
		                        console.log("자동 생성 방지 봇 통과");
		                        $('#board_form').submit();
		                		break;
		                    case 1:
		                        alert("자동 생성 방지 봇을 확인 한뒤 진행 해 주세요.");
		                        break;
		                    default:
		                        alert("자동 생성 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
		                   		break;
		                }
		            }, error: function() {
		            	console.log('captcha 에러');
		            }
		        });
					
		});
		$('#upfile').change(function() {
			var array = $(this).get(0).files; 
			console.log(array);
			var strArray ="";
			for(var i=0; i < array.length; i++) {
				strArray += array[i].name;
				if(i < array.length-1) {
					strArray += ", ";
				}
			}
			$('#filevalue').text(strArray);
			show();
		});
		$('.remove').click(function() {
			$('#filevalue').text('');
			var agent = navigator.userAgent.toLowerCase();
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			    // ie 일때 input[type=file] init.
			    $("#upfile").replaceWith( $("#excelFile").clone(true) );
			} else {
			    //other browser 일때 input[type=file] init.
			    $("#upfile").val("");
			}
			$(this).css('display', 'none');
		});
	});
</script>
</head>
<body>


	<div class="container">
		<form id="board_form"action="/pro/board_reply_action" method="post"
			enctype="multipart/form-data" name="boardform">
			<h3 id="h3_category"></h3>
			<input type="hidden" name="BOARD_CATEGORY" value="${board_data.BOARD_CATEGORY}">
			<input type="hidden" name="MEMBER_ID" value="${id}">
			<input type="hidden" name="BOARD_RE_REF" value="${board_data.BOARD_RE_REF}">
			<input type="hidden" name="BOARD_RE_LEV" value="${board_data.BOARD_RE_LEV}">
			<input type="hidden" name="BOARD_RE_SEQ" value="${board_data.BOARD_RE_SEQ}">
			<div class="form-group">
				<label for="board_name">글쓴이</label> 
				<input name="MEMBER_NAME"
					id="board_name" value="${nickname}" readOnly type="text" class="form-control">
			</div>

			<div class="form-group">
				<label for="board_pass">비밀번호</label> <input name="BOARD_PASSWORD"
					id="board_pass" type="password" size="4" maxlength="4"
					class="form-control" placeholder="Enter password(숫자 4자리)" value="">
			</div>

			<div class="form-group">
				<label for="board_subject">제목</label> <input name="BOARD_SUBJECT"
					id="board_subject" type="text" size="50" maxlength="100"
					class="form-control" placeholder="Enter board_subject" value="">
			</div>

			<div class="form-group">
				<label for="board_content">내용</label>
				<textarea name="BOARD_CONTENT" id="board_content"></textarea>
			</div>

			<div class="form-group">
				<label style ="display:inline" for="board_file">파일 첨부</label> 
				<label style ="display:inline" for="upfile" data-toggle="tooltip" data-placement="top" title="최대 용량 : 10MB"> 
					<img id=ig src="/pro/resources/Image/attach.png" width ="10px" alt="파일첨부">
				</label> 
				<input  multiple ="multiple" type="file" id="upfile" name="uploadfile">
				<span id="filevalue"></span>
				<img src="/pro/resources/Image/icon/x-circle.svg" alt="파일삭제" width="10px" class="remove">
			</div>
			<div class="form-group">
				<div class="g-recaptcha" data-sitekey=6LfgOM4UAAAAAJg9CHiuPnsjrNKup61971_H3xld>
				</div>
			</div>
			<div class="form-group">
				<button id="add_board_button"type="button" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-secondary" onClick='history.back(); return false;'>취소</button>
			</div>

		</form>
	</div>

</body>
</html>