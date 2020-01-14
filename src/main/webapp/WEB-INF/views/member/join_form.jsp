<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />

<script src="https://www.google.com/recaptcha/api.js"></script>
<jsp:include page="./join_form_acount_rule.jsp" />
<jsp:include page="./join_form_info_rule.jsp" />
<title>PFD 회원가입</title>
<script>
	$(function() {

		var idCheck = false;
		$("#add_member_id").on(
				'keyup',
				function() {
					$("add_member_id_message").empty();
					// \w => [A-Za-z0-9_]
					var pattern = /^\w{4,15}$/;
					//var pattern = /^\w+@\w*[.]\w{3}$/;
					var id = $("#add_member_id").val();

					if (!pattern.test(id)) {
						$("#add_member_id_message").css('color', 'red').html(
								"형식(4자~15자)에 맞춰주세요.");
						idCheck = false;
						return;
					}
					$.ajax({
						url : "idcheck",
						data : {
							"id" : id
						},
						success : function(rdata) {
							if (rdata == -1) {
								$("#add_member_id_message").css('color',
										'green').html("사용 가능한 아이디 입니다.");
								idCheck = true;
							} else {
								$("#add_member_id_message")
										.css('color', 'blue').html(
												"사용 중인 아이디 입니다.");
								idCheck = false;
							}
						},//if
						error : function() {
							alert("에러입니다. 운영진에 문의해주세요.");
						}
					});//ajax
				}); // keyup

		var rule_value = 0;
		$("#account_rule_btn").click(function() {
			rule_value += 50;
			$(".progress-bar").css("width", rule_value + "%");
			$(".progress-bar").text(rule_value + "%");
			$("#account_rule_btn").off('click');
		});
		$("#info_rule_btn").click(function() {
			rule_value += 50;
			$(".progress-bar").css("width", rule_value + "%");
			$(".progress-bar").text(rule_value + "%");
			$("#info_rule_btn").off('click');
		});

		$("#join_button").click(function() {

			if (rule_value != 100) {
				alert("약관을 읽어주세요");
				return false;
			}
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
				alert("비밀번호를 최소 6자리, 최대 15자리로 맞춰주세요.");
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
		});

	});
</script>
<style>
.container {
	width: 40%;
	border: 1px solid lightgray;
	padding: 20px;
	margin-top: 80px;
}

#join_button {
	width: 100%;
}
</style>
</head>
<body>
	
	<div class="container">
		<form action="joinProcess" id="add_member_form" method="post">
			<fieldset>
				<div class="form-group">
					<label for="add_member_id">아이디</label> <input type="text"
						class="form-control" id="add_member_id" placeholder="Enter id"
						name="MEMBER_ID" maxLength="12"> <span
						id="add_member_id_message"></span>
				</div>
				<div class="form-group">
					<label for="add_member_password">비밀번호</label> <input
						type="password" class="form-control" id="add_member_password"
						placeholder="Enter password" name="MEMBER_PASSWORD">
				</div>
				<div class="form-group">
					<label for="add_member_name">이름</label> <input type="text"
						id="add_member_name" name="MEMBER_NAME" placeholder="Enter name"
						maxLength="15">
				</div>
				<div class="form-group">
					<span><b style="color: red">비밀번호 찾기를 이용하기 위해 회원 가입 후 이메일
							등록을 해주세요.</b> </span>
				</div>

				<div class="form-group">
					<b>약관 확인</b>
					<div class="progress">
						<div class="progress-bar" style="width: 0%">0%</div>
					</div>
				</div>
				<div class="form-group">
					<button id="account_rule_btn" type="button" class="btn btn-info"
						data-toggle="modal" data-target="#account_rule">회원가입 약관</button>
					<button id="info_rule_btn" type="button" class="btn btn-info"
						data-toggle="modal" data-target="#info_rule">개인정보처리방침</button>
				</div>
				<div class="form-group">
					<div class="g-recaptcha"
						data-sitekey=6LfgOM4UAAAAAJg9CHiuPnsjrNKup61971_H3xld></div>
				</div>
				<div class="form-group">
					<button id="join_button" class = "btn btn-secondary" type="button">회원가입</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>