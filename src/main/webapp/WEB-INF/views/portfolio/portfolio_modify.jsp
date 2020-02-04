<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />

<script src="https://www.google.com/recaptcha/api.js"></script>
<title>PFD Portfolio Edit</title>
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
			$('#PORT_NEW_FILE').val(strArray);
			port_show();
		});
		// 파일 제거 시
		$('.remove2').click(function() {
			$('#port_filevalue').text('');
			$('#PORT_NEW_FILE').val('');
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
		$("#update_button").click(function() {
			
			
			if ($('#PORT_SUBJECT').val().trim() == "") {
				alert("제목을 입력하세요");
				$('#PORT_SUBJECT').focus();
				return false;
			}
			
			if ($('#PORT_CONTENT').val().trim() == "") {
				alert("내용을 입력하세요");
				$('#PORT_CONTENT').focus();
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
	                        console.log("자동 등록 방지 봇 통과");
	                        $('#update_portfolio_form').submit();
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
		$('#update_cancel').click(function(){
			if(confirm('포트폴리오 수정을 취소하시겠습니까?'))
				history.go(-1);
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
#update_button, #update_cancel{
    background: #FFF;
    border: 1px solid lightgrey;
    color: rgb(93, 143, 203);
    display: inline-block;
    width: 47%;
    margin: 1%;
    outline:none!important;
}
#update_button:hover, #update_cancel:hover{
	cursor:pointer;
	background:rgb(93, 143, 203);
	color:#FFF;
	border-radius:2%;
	opacity:0.7;
	transition:0.4s;
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
#update_portfolio_form h3 {
	text-align: center;
    font-size: 1.5em;
    font-weight: 600;
}
</style>
</head>
<body>
	<div class="container">
	<c:if test="${!empty port}">
		<form action="/pro/portfolio/update_action" id="update_portfolio_form" method="post" enctype="multipart/form-data">
			<fieldset>
				<h3>포트폴리오 수정</h3>
				<input type="hidden" value="${id}" name="MEMBER_ID">
				<input type="hidden" id="PORT_ORI_FILE" name="PORT_ORI_FILE" value="${port.PORT_ORI_FILE}">
				<input type="hidden" id="PORT_NEW_FILE" name="PORT_NEW_FILE" value="${port.PORT_ORI_FILE}">
				<input type="hidden" id="PORT_ID" name="PORT_ID" value="${port.PORT_ID}">
				<div class="form-group">
					<label for="PORT_SUBJECT">제목</label> 
					<input type="text" class="form-control" id="PORT_SUBJECT" placeholder="Enter Subject"
						name="PORT_SUBJECT" maxLength="20" value="${port.PORT_SUBJECT}">
				</div>
				<div class="form-group">
					<label for="PORT_CONTENT">내용</label> 
					<textArea id ="PORT_CONTENT" cols="50" rows="6" class="form-control" placeholder="Enter Content" name="PORT_CONTENT">${port.PORT_CONTENT}</textArea>
				</div>
				<div class="form-group">
					<label style ="display:inline" for="PORT_UPLOADFILE">이미지 첨부</label> 
					<label style ="display:inline" for="PORT_UPLOADFILE" data-toggle="tooltip" data-placement="top" title="최대 용량 : 20MB"> 
						<img id=ig src="/pro/resources/Image/icon/images.svg" width ="10px" alt="파일첨부">
					</label> 
					<input  multiple ="multiple"  class="file_up" type="file" id="PORT_UPLOADFILE" name="PORT_UPLOADFILE">
					<span id="port_filevalue">${port.PORT_ORI_FILE}</span>
					<img src="/pro/resources/Image/icon/x-circle.svg" alt="파일삭제" width="10px" class="remove2">
				</div>
				<div class="form-group">
					<span style="color:red">확장자는 jpg, jpeg, gif, png만 가능합니다.</span>
				</div>
				<div class="form-group">
					<label for="PORT_GITHUB">기간</label> 
					<input type="date" id="PORT_START_DAY" value ="${port.PORT_START_DAY}" name="PORT_START_DAY">-
					<input type="date" id="PORT_END_DAY" value ="${port.PORT_END_DAY}" name="PORT_END_DAY">
				</div>
				<div class="form-group">
				<c:if test="${port.PORT_TEAM == 0}">
					<label for="individual">Team</label>
					<input type="radio" id = "individual" name="PORT_TEAM" value="0" checked>
					<label for="individual">개인</label>
					<input type="radio" id = "team" name="PORT_TEAM" value="1">
					<label for="team">팀</label>
				</c:if>
				<c:if test="${port.PORT_TEAM == 1}">
					<label for="individual">Team</label>
					<input type="radio" id = "individual" name="PORT_TEAM" value="0">
					<label for="individual">개인</label>
					<input type="radio" id = "team" name="PORT_TEAM" value="1" checked>
					<label for="team">팀</label>
				</c:if>
				</div>
				<div class="form-group">
					<label for="PORT_GITHUB">Github</label> 
					<input type="text" id="PORT_GITHUB" name="PORT_GITHUB" placeholder="Enter Git Address" value="${port.PORT_GITHUB}">
				</div>
				<div class="form-group">
					<label for="PORT_SITE">Link</label> 
					<input type="text" id="PORT_SITE" name="PORT_SITE" placeholder="Enter Open Address" value="${port.PORT_SITE}">
				</div>
				<div class="form-group">
				<c:if test="${port.PORT_SHOW == 0}">
					<label for="open">공개여부</label>
					<input type="radio" id = "open" name="PORT_SHOW" value="0" checked>
					<label for="open">공개</label>
					<input type="radio" id = "close" name="PORT_SHOW" value="1">
					<label for="close">비공개</label>
				</c:if>
				<c:if test="${port.PORT_SHOW == 1}">
					<label for="individual">공개여부</label>
					<input type="radio" id = "open" name="PORT_SHOW" value="0">
					<label for="open">공개</label>
					<input type="radio" id = "close" name="PORT_SHOW" value="1" checked>
					<label for="close">비공개</label>
				</c:if>
				</div>
				<c:if test="${port.PORT_FEED_NEED == 0}">
				<div class="form-group">
					<label for="individual">피드백</label>
					<input type="radio" id = "agree" name="PORT_FEED_NEED" value="0" checked>
					<label for="agree">허용</label>
					<input type="radio" id = "reject" name="PORT_FEED_NEED" value="1">
					<label for="reject">거부</label>
				</div>
				</c:if>
				<c:if test="${port.PORT_FEED_NEED == 1}">
				<div class="form-group">
					<label for="individual">피드백</label>
					<input type="radio" id = "agree" name="PORT_FEED_NEED" value="0">
					<label for="agree">허용</label>
					<input type="radio" id = "reject" name="PORT_FEED_NEED" value="1" checked>
					<label for="reject">거부</label>
				</div>
				</c:if>
				<div class="form-group">
					<div class="g-recaptcha"
						data-sitekey=6LfgOM4UAAAAAJg9CHiuPnsjrNKup61971_H3xld></div>
				</div>
				<div class="form-group">
					<button id="update_button" class = "btn" type="button">수정</button>
					<button id="update_cancel" class = "btn" type="button">취소</button>
				</div>
			</fieldset>
		</form>
	</c:if>
	<c:if test="${empty port}">
		<script>alert('포트폴리오를 불러오는데 실패하였습니다.');history.go(-1);</script>
	</c:if>
	</div>
</body>
</html>