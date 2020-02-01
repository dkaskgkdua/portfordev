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
function port_show() {
	if ($('#port_filevalue').text() == '') {
		$(".remove2").css('display', 'none');
	} else {
		$(".remove2").css('display', 'inline-block');
	}
};
$(function() {
		port_show();
		// 파일 수정 시
		$('#PORT_UPLOADFILE').change(function() {
			var array = $(this).get(0).files; 
			var strArray ="";
			for(var i=0; i < array.length; i++) {
				strArray += array[i].name;
				if(i < array.length-1) {
					strArray += ", ";
				}
			}
			$('#port_filevalue').text(strArray);
			$('#PORT_ORI_FILE').val(strArray);
			port_show();
		});
		// 파일 제거 시
		$('.remove2').click(function() {
			$('#port_filevalue').text('');
			var agent = navigator.userAgent.toLowerCase();
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			    // ie 일때 input[type=file] init.
			    $("#PORT_UPLOADFILE").replaceWith( $("#excelFile").clone(true) );
			} else {
			    //other browser 일때 input[type=file] init.
			    $("#PORT_UPLOADFILE").val("");
			}
			$(this).css('display', 'none');
		});
		$("#add_button").click(function() {
			
			
			if ($('#PORT_SUBJECT').val() == "") {
				alert("제목을 입력하세요");
				$('#PORT_SUBJECT').focus();
				return false;
			}
			
			if ($('#PORT_CONTENT').val() == "") {
				alert("내용을 입력하세요");
				$('#PORT_CONTENT').focus();
				return false;
			}
			$("#add_portfolio_form").submit();
			
			$.ajax({
	            url: '/pro/VerifyRecaptcha',
	            type: 'post',
	            data: {
	                recaptcha: $("#g-recaptcha-response").val()
	            },
	            success: function(data) {
	                switch (data) {
	                    case 0:
	                        console.log("자동 등록 방지 봇 통과");
	                        $('#add_portfolio_form').submit();
	                		break;
	                    case 1:
	                        alert("자동 등록 방지 봇을 확인 한뒤 진행 해 주세요.");
	                        break;
	                    default:
	                        alert("자동 등록 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                   		break;
	                }
	            }, error: function() {
	            	console.log('captcha 에러');
	            }
	        });
			
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
#PORT_UPLOADFILE {
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
		<form action="/pro/portfolio_add_action" id="add_portfolio_form" method="post" enctype="multipart/form-data">
			<fieldset>
				<h3>프로젝트 등록</h3>
				<input type="hidden" value="${id}" name="MEMBER_ID">
				<input type="hidden" id="PORT_ORI_FILE" name="PORT_ORI_FILE">
				<div class="form-group">
					<label for="PORT_SUBJECT">제목</label> 
					<input type="text" class="form-control" id="PORT_SUBJECT" placeholder="Enter Subject"
						name="PORT_SUBJECT" maxLength="20">
				</div>
				<div class="form-group">
					<label for="PORT_CONTENT">내용</label> 
					<textArea id ="PORT_CONTENT" cols="50" rows="6" class="form-control" placeholder="Enter Content" name="PORT_CONTENT"></textArea>
				</div>
				<div class="form-group">
					<label style ="display:inline" for="PORT_UPLOADFILE">이미지 첨부</label> 
					<label style ="display:inline" for="PORT_UPLOADFILE" data-toggle="tooltip" data-placement="top" title="최대 용량 : 20MB"> 
						<img id=ig src="/pro/resources/Image/icon/images.svg" width ="10px" alt="파일첨부">
					</label> 
					<input  multiple ="multiple"  class="file_up" type="file" id="PORT_UPLOADFILE" name="PORT_UPLOADFILE">
					<span id="port_filevalue"></span>
					<img src="/pro/resources/Image/icon/x-circle.svg" alt="파일삭제" width="10px" class="remove2">
				</div>
				<div class="form-group">
					<span style="color:red">확장자는 jpg, jpeg, gif, png만 가능합니다.</span>
				</div>
				<div class="form-group">
					<label for="PORT_GITHUB">기간</label> 
					<input type="date" id="PORT_START_DAY" value ="2020-01-01" name="PORT_START_DAY">-
					<input type="date" id="PORT_END_DAY" value ="2020-02-01" name="PORT_END_DAY">
				</div>
				<div class="form-group">
					<label for="PORT_GITHUB">기간</label> 
					<input type="date" id="PORT_START_DAY" value ="2020-01-01" name="PORT_START_DAY">-
					<input type="date" id="PORT_END_DAY" value ="2020-02-01" name="PORT_END_DAY">
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
					<label for="open">공개</label>
					<input type="radio" id = "close" name="PORT_SHOW" value="1">
					<label for="close">비공개</label>
				</div>
				<div class="form-group">
					<label for="individual">피드백</label>
					<input type="radio" id = "agree" name="PORT_FEED_NEED" value="0" checked>
					<label for="agree">허용</label>
					<input type="radio" id = "reject" name="PORT_FEED_NEED" value="1">
					<label for="reject">거부</label>
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