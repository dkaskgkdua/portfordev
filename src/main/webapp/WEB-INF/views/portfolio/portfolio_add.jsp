<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />

<script src="https://www.google.com/recaptcha/api.js"></script>
<title>PFD 포트폴리오 등록</title>
<script>
function sum_show() {
	// 파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게 한다.
	if ($('#sum_filevalue').text() == '') {
		$(".remove").css('display', 'none');
	} else {
		$(".remove").css('display', 'inline-block');
	}
};
function port_show() {
	if ($('#port_filevalue').text() == '') {
		$(".remove2").css('display', 'none');
	} else {
		$(".remove2").css('display', 'inline-block');
	}
};
$(function() {
		sum_show();
		port_show();
		$('.file_up').change(function() {
			var inputfile = $(this).val().split('\\');
			$(this).next().text(inputfile[inputfile.length - 1]);
			sum_show();
			port_show();
		});
		$('.remove, .remove2').click(function() {
			$(this).prev().text('');
			var agent = navigator.userAgent.toLowerCase();
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			    // ie 일때 input[type=file] init.
			    $(this).prev().prev().replaceWith( $("#excelFile").clone(true) );
			} else {
			    //other browser 일때 input[type=file] init.
			    $(this).prev().prev().val("");
			}
			$(this).css('display', 'none');
		});
		$("#add_button").click(function() {
			/*
			if ($('#add_member_id').val() == "") {
				alert("ID를 입력하세요");
				$('#add_member_id').focus();
				return false;
			}
			if (idCheck == false) {
				alert("ID 중복되었습니다.");
				return false;
			}

			if ($('#add_member_password').val() == "") {
				alert("비밀번호를 입력하세요");
				$('#add_member_password').focus();
				return false;
			}

			var password_pattern = /^\w{6,15}$/;
			if (!password_pattern.test($('#add_member_password').val())) {
				alert("비밀번호를 6자리~15자리로 맞춰주세요.(문자, 숫자, _ )");
				$('#add_member_password').focus();
				return false;
			}

			if ($('#add_member_name').val() == "") {
				alert("이름을 입력하세요");
				$('#add_member_name').focus();
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
	                        console.log("자동 가입 방지 봇 통과");
	                        $('#add_member_form').submit();
	                		break;
	                    case 1:
	                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
	                        break;
	                    default:
	                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                   		break;
	                }
	            }, error: function() {
	            	console.log('captcha 에러');
	            }
	        });
			*/
		});
});
</script>
<style>
.container {
	width: 50%;
	border: 1px solid lightgray;
	padding: 20px;
	margin-top : 5px;
}
#add_button {
	width: 100%;
}
#PORT_FILE, #PORT_SUM_IMAGE {
   display: none;
}
img {
   width: 25px;
}
img:hover {
   cursor: pointer
}
h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<form action="/pro/portfolio_add" id="add_portfolio_form" method="post" enctype="multipart/form-data">
			<fieldset>
				<h3>프로젝트 등록</h3>
				<div class="form-group">
					<label for="PORT_SUBJECT">주제</label> 
					<input type="text" class="form-control" id="PORT_SUBJECT" placeholder="Enter Subject"
						name="PORT_SUBJECT" maxLength="20">
				</div>
				<div class="form-group">
					<label for="PORT_CONTENT">내용</label> 
					<textArea id ="PORT_CONTENT" cols="50" rows="6" class="form-control" placeholder="Enter Content" name="PORT_CONTENT"></textArea>
				</div>
				<div class="form-group">
					<label style ="display:inline" for="PORT_SUM_IMAGE">썸네일 첨부</label> 
					<label style ="display:inline" for="PORT_SUM_IMAGE" data-toggle="tooltip" data-placement="top" title="최대 용량 : 20MB"> 
						<img id=ig src="resources/Image/attach.png" width ="10px" alt="파일첨부">
					</label> 
					<input  class="file_up" type="file" id="PORT_SUM_IMAGE" name="PORT_SUM_IMAGE">
					<span id="sum_filevalue"></span>
					<img src="resources/Image/remove.png" alt="파일삭제" width="10px" class="remove">
				</div>
				<div class="form-group">
					<label style ="display:inline" for="PORT_FILE">PPT 첨부</label> 
					<label style ="display:inline" for="PORT_FILE" data-toggle="tooltip" data-placement="top" title="최대 용량 : 20MB"> 
						<img id=ig src="resources/Image/attach.png" width ="10px" alt="파일첨부">
					</label> 
					<input  class="file_up" type="file" id="PORT_FILE" name="PORT_FILE">
					<span id="port_filevalue"></span>
					<img src="resources/Image/remove.png" alt="파일삭제" width="10px" class="remove2">
				</div>
				<div class="form-group">
					<label for="individual">Team</label>
					<input type="radio" id = "individual" name="PORT_TEAM" value="0" checked>
					<label for="individual">개인</label>
					<input type="radio" id = "team" name="PORT_TEAM" value="1">
					<label for="team">팀</label>
				</div>
				<div class="form-group">
					<label for="PORT_GITHUB">Github</label> 
					<input type="text" id="PORT_GITHUB" name="PORT_GITHUB" placeholder="Enter Git Address">
				</div>
				<div class="form-group">
					<label for="PORT_SITE">Link</label> 
					<input type="text" id="PORT_SITE" name="PORT_SITE" placeholder="Enter Open Address">
				</div>
				<div class="form-group">
					<label for="individual">공개여부</label>
					<input type="radio" id = "open" name="PORT_SHOW" value="0" checked>
					<label for="individual">공개</label>
					<input type="radio" id = "close" name="PORT_SHOW" value="1">
					<label for="team">비공개</label>
				</div>
				<div class="form-group">
					<label for="individual">피드백</label>
					<input type="radio" id = "agree" name="PORT_FEED_NEED" value="0" checked>
					<label for="individual">허용</label>
					<input type="radio" id = "reject" name="PORT_FEED_NEED" value="1">
					<label for="team">거부</label>
				</div>
				<div class="form-group">
					<div class="g-recaptcha"
						data-sitekey=6LfgOM4UAAAAAJg9CHiuPnsjrNKup61971_H3xld></div>
				</div>
				<div class="form-group">
					<button id="add_button" class = "btn btn-secondary" type="button">등록</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>