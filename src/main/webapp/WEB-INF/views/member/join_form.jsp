<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>PFD 회원가입</title>
<script>
$(function() {
	var idCheck =false;
	$("#add_member_id").on('keyup', function() {
		$("add_member_id_message").empty();
		// \w => [A-Za-z0-9_]
		var pattern = /^\w{4,15}$/;
		//var pattern = /^\w+@\w*[.]\w{3}$/;
		var id =$("#add_member_id").val();
	
		if(!pattern.test(id)) {
			$("#add_member_id_message").css('color', 'red')
							.html("아이디 형식으로 맞춰주세요.");
			idCheck = false;
			return;
		}
		$.ajax({
			url : "idcheck",
			data : {"id": id},
			success : function(rdata) {
				if(rdata == -1) {
					$("#add_member_id_message").css('color', 'green').html(
							"사용 가능한 아이디 입니다.");
					idCheck=true;
				} else {
					$("#add_member_id_message").css('color', 'blue').html(
							 "사용중인 아이디 입니다.");
					idCheck=false;
				}
			},//if
			error : function() {
				alert("에러?");
			}
		});//ajax
	});  // keyup
	
	
	$('#add_member_form').submit(function() {
		if($('#add_member_id').val()=="") {
			alert("ID를 입력하세요");
			$('#add_member_id').focus();
			return false;
		}
		if(idCheck == false) {
			alert("ID 중복되었습니다.");
			return false;
		}
		
		if($('#add_member_password').val()=="") {
			alert("비밀번호를 입력하세요");
			$('#add_member_password').focus();
			return false;
		}
		
		var password_pattern = /^\w{6,15}$/;
		if(!password_pattern.test($('#add_member_password').val())) {
			alert("비밀번호를 최소 6자리, 최대 15자리로 맞춰주세요.");
			$('#add_member_password').focus();
			return false;
		}
		
		if($('#add_member_name').val()=="") {
			alert("이름을 입력하세요");
			$('#add_member_name').focus();
			return false;
		}
	
	});
	
});
</script>
<style>
.container {
	width: 40%;
	border: 1px solid lightgray;
	padding: 20px;
	margin-top: 20%;
}
</style>
</head>
<body>
<div class="container">
   <form action="joinProcess" id = "add_member_form" method="post">
	 <fieldset>
	   	<div class = "form-group">
			<label for ="add_member_id">아이디</label>
			<input type="text" class="form-control" id="add_member_id"
					   placeholder = "Enter id" name="MEMBER_ID" maxLength="12">
			<span id = "add_member_id_message"></span>
		</div>
		<div class = "form-group">
			<label for ="add_member_password">비밀번호</label>
			<input type="password" class="form-control" id="add_member_password"
					   placeholder = "Enter password" name="MEMBER_PASSWORD">
		</div>
		<div class = "form-group">
			<label for = "add_member_name" >이름</label>
			<input type="text" id = "add_member_name" name = "MEMBER_NAME" placeholder="Enter name" maxLength="15">
		</div>
		<button type="submit">회원가입</button>
		<button type="button">취소</button>
	</fieldset>
   </form>
</div>
</body>
</html>