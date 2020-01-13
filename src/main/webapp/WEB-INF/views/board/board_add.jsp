<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>
<jsp:include page="../main/navbar.jsp" />
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
	$(function() {
		if("${BOARD_CATEGORY}"=="0") {
			$('#h3_category').text("자유게시판");
		} else {
			$('#h3_category').text("스터디(Q&A)");
		}	
		$("form").submit(function() {
				if ($.trim($("#board_pass").val()) == "") {
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
					
		});
		$('#upfile').change(function() {
			var array = $(this).get(0).files; 
			alert(array);
			var inputfile = $(this).val().split('\\');
			$('#filevalue').text(inputfile[inputfile.length - 1]);
			show();
		});

		$('.remove').click(function() {
			$('#filevalue').text('');
			$(this).css('display', 'none');
			$("input[name=BOARD_ORIGINAL]").val('');
			$("input[name=BOARD_FILE").val('');
		});

		// 남은 글자 수 표시
		$("#board_content").keyup(function() {
			var content = $(this).val();
			$("#counter").html(content.length + '/500');
	
			if(content.length >= 500){
				$(this).val(content.substr(0, 500));
				$("#counter").css('background', 'red');
			}else{
				$("#counter").css('background', 'rgba(255, 0, 0, 0.5)');
			}
		});
	});
</script>
</head>
<body>


	<div class="container">
		<form action="board_add_action" method="post"
			enctype="multipart/form-data" name="boardform">
			<h3 id="h3_category">자유게시판 글쓰기</h3>
			<input type="hidden" name="BOARD_CATEGORY" value="${BOARD_CATEGORY}">
			<input type="hidden" name="MEMBER_ID" value="${id}">
			<div class="form-group">
				<label for="board_name">글쓴이</label> <input name="BOARD_NAME"
					id="board_name" value="${nickname}" readOnly type="text" size="10"
					maxlength="30" class="form-control" placeholder="Enter board_name">
			</div>

			<div class="form-group">
				<label for="board_pass">비밀번호</label> <input name="BOARD_PASSWORD"
					id="board_pass" type="password" size="10" maxlength="30"
					class="form-control" placeholder="Enter board_pass" value="">
			</div>

			<div class="form-group">
				<label for="board_subject">제목</label> <input name="BOARD_SUBJECT"
					id="board_subject" type="text" size="50" maxlength="100"
					class="form-control" placeholder="Enter board_subject" value="">
			</div>

			<div class="form-group">
				<label for="board_content">내용</label>
				<textarea name="BOARD_CONTENT" id="board_content" cols="67"
					rows="10" class="form-control" maxlength ="500" placeholder="내용을 입력해주세요.(최대 500자)"></textarea>
			</div>

			<div class="form-group">
				<label for="board_file">파일 첨부</label> 
				<label for="upfile"> 
					<img id=ig src="resources/Image/attach.png" alt="파일첨부">
				</label> 
				<input multiple ="multiple" type="file" id="upfile" name="uploadfile">
				<span id="filevalue"></span>
			</div>

			<div class="form-group">
				<button type=submit class="btn btn-primary">등록</button>
				<input type='button' value="취소" class="back"
					onClick='history.back(); return false;'>
			</div>

		</form>
	</div>

</body>
</html>