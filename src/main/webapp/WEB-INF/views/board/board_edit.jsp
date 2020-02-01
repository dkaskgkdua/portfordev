<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../main/navbar.jsp" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
<script>
function show() {
	if ($.trim($('#filevalue').text()) == '') {
		// 파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게 한다.
		$(".remove").css('display', 'none');
	} else {
		$(".remove").css('display', 'inline-block');
	}
};
// 썸머노트에 첨부된 이미지를 서버에 저장한다.
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
	// 서머노트 초기화
	
	
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
	
	 $('#board_content').summernote('code', '${board_data.BOARD_CONTENT}');
	
	 // 카테고리
	 if($("#board_category").val()=="0") {
			$('#h3_category').text("자유게시판");
	 } else if("${BOARD_CATEGORY}"=="1"){
			$('#h3_category').text("스터디");
	 } else {
			$('#h3_category').text("Q&A");
	 }
	// 파일 수정 시
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
			$("#FILE_CHANGE").val("1");
			show();
		});
		// 파일 제거 시
		$('.remove').click(function() {
			$("#FILE_CHANGE").val("2");
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
		
		$("#edit_board_button").click(function() {
			if ($.trim($("#board_password").val()) == "") {
				alert("비밀번호를 입력하세요");
				$("#board_pass").focus();
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
			var pattern = /^\d{4}$/;
			var password = $("#board_password").val();
			if (!pattern.test(password)) {
				alert("비밀번호 4자리를 맞춰주세요.");
				return false;
			}	
			$.ajax({
				url : "/pro/board_password_check",
				type : "post",
				data : {
					"BOARD_ID" : $("#board_id").val(),
					"BOARD_PASSWORD": $("#board_password").val()
				},
				success : function(rdata) {
					if(rdata == 1) {
						$("#board_edit_form").submit();
					} else {
						alert('비밀번호가 일치하지 않습니다.');
						return false;
					}
				},
				error : function() {
					alert("에러입니다. 운영진에 문의해주세요.");
				}
			})
	});
});
</script>
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


<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<body>
  <div class="container">
    <form id ="board_edit_form" action = "board_modify_action" method="post" name="boardform" enctype="multipart/form-data">
    <input id ="board_id" type="hidden" name="BOARD_ID" value="${board_data.BOARD_ID}">

    <input id="FILE_CHANGE" type="hidden" name="FILE_CHANGE" value="0">
    
    <input type="hidden" name="MEMBER_ID" value="${id}">
    <input type="hidden" name="BOARD_CATEGORY" value='${board_data.BOARD_CATEGORY}'>
    <h3 id="h3_category">게시판 수정</h3>
    <div class="form-group">
      	<label for="board_name">글쓴이</label>
     	 <input name="MEMBER_NAME" id="board_name" value="${nickname}" type="text" readOnly >
    </div>
    <div class="form-group">
	  <label for="board_pass">비밀번호</label> 
	  <input name="BOARD_PASSWORD" id="board_password" type="password" size="4" maxlength="4"
					class="form-control" placeholder="Enter password(숫자 4자리)" value="">
	</div>
	<div class="form-group">
		<label for="board_subject">제목</label> 
		<input name="BOARD_SUBJECT" value="${board_data.BOARD_SUBJECT}"
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
					<img style="vertical-align: bottom"id=ig src="/pro/resources/Image/attach.png" width ="10px" alt="파일첨부">
				</label> 
				<input  multiple ="multiple" type="file" id="upfile" name="uploadfile">
				<span id="filevalue">
					<c:if test="${!empty board_file_list}">
						<c:forEach var="files" items="${board_file_list}">
							${files.BOARD_FILE_ORIGINAL}&nbsp;
						</c:forEach>
					</c:if>
				</span>
				<img style="vertical-align: bottom" src="/pro/resources/Image/icon/x-circle.svg" alt="파일삭제" width="10px" class="remove">
	</div>
     
      <div class="form-group">
      <button id ="edit_board_button" type="button" class="btn btn-primary">수정</button>
      <button type="reset" class="btn btn-primary" onClick="history.go(-1)">취소</button>
    </div>     
   </form>
  </div>   
</body>
</html>