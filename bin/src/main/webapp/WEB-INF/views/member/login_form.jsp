<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>PFD 로그인</title>
<!-- 
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<meta name="google-signin-client_id"
	content="346744892699-07svb4537noeg6lm2ps2mqaa6t6d5dj2.apps.googleusercontent.com">
 -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>

	/*
	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}*/
	function attachSignin(element) {
		auth2.attachClickHandler(element, {}, function(googleUser) {
			var profile = googleUser.getBasicProfile();
			var id = profile.getId();
			var name = profile.getName();
			signOut();
			$.ajax({
				url : "/pro/idcheck",
				data : {"id":id},
				success : function(rdata) {
					$("#remember").prop("checked", false);
					if(rdata == -1) { //없는 아이디
						$("#add_member_id").val(id);
						$("#add_member_password").val(id);
						$("#add_member_name").val(name);
						$("#add_member_form").submit();
					} else {
						$("#id").val(id);
						$("#password").val(id);
						$("#loginform").submit();
					}
				}
			})
		}, function(error) {
			alert("구글 로그인 중 오류가 발생했습니다.");
			console.log(error);
		});
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
	$(function() {
		$('#loginform').submit(function() {
			if($('#id').val()=="") {
				alert("ID를 입력하세요");
				$('#id').focus();
				return false;
			}
		});
		$(".join").click(function() {
			location.href = "/pro/join";
		});
		if ("${saveid}" != "") {
			$("#remember").attr('checked', 'checked');
			$("#id").val("${saveid}");
		}
		
		gapi.load('auth2',function() {
			auth2 = gapi.auth2.init({
				client_id : '346744892699-07svb4537noeg6lm2ps2mqaa6t6d5dj2.apps.googleusercontent.com',
				cookiepolicy : 'single_host_origin',
				// Request scopes in addition to 'profile' and 'email'
				//scope: 'additional_scope'
			});
			attachSignin(document.getElementById('google-login-btn'));
		});

		Kakao.init('a96903592eda25b12088f40db41c5a6c');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						$.ajax({
							url : "/pro/idcheck",
							data : {"id" : res.id},
							success : function(rdata) {
								$("#remember").prop("checked", false);
								if (rdata == -1) { //없는 아이디
									$("#add_member_id").val(res.id);
									$("#add_member_password").val(res.id);
									$("#add_member_name").val(
											res.properties.nickname);
									$("#add_member_form").submit();
								} else {
									$("#id").val(res.id);
									$("#password").val(res.id);
									$("#loginform").submit();
								}
							}
						})

					},
					fail : function(error) {
						alert("카카오 로그인 중 에러가 발생했습니다.");
					}
				});
			},
			fail : function(err) {
				alert("카카오 연결 중 에러가 발생했습니다.");
			}
		});

	});
</script>
<style>
	.container {
		width: 40%;
		border: 1px solid lightgray;
		padding: 20px;
		margin-top:80px;
	}
	#google-login-btn {
      display: inline-block;
      background: #f10727;
      padding-left : 10px;
      padding-top : 3px;
      color: white;
      width: 224px;
      height : 49px;
      border-radius: 5px;
      border: thin solid red;
      white-space: nowrap;
    }
    #google-login-btn:hover {
      cursor: pointer;
    }
    span.icon {
      background: url('resources/Image/icon/google.png') transparent 5px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 42px;
      height: 42px;
    }
    span.buttonText {
      font-size: 16px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="/pro/loginProcess" name="loginform"
			id="loginform">

			<fieldset>
				<legend>로그인</legend>
				<div class="form-group">
					<label for="id"><b>ID</b></label> <input class="form-control"
						type="text" size="10px" name="id" id="id" placeholder="Enter id"
						maxlength="15">
				</div>
				<div class="form-group">
					<label for="pass"><b>비밀번호</b></label> <input class="form-control"
						type="password" name="password" id="password"
						placeholder="Enter Password">
				</div>
				<div class="form-group">
					<input type="checkbox" id="remember" value="remember"
						name="remember"> <label for="remember">Remember me</label>
				</div>
				<div class="form-group">
					<button class="btn btn-secondary" id="submit_btn" type="submit">로그인</button>
					<button class="btn btn-secondary join" type="button">회원가입</button>
					<button class="btn btn-danger" id="cancel_button" type="reset">취소</button>
				</div>
				<div class="form-group">
				<div id="google-login-btn" class="customGPlusSignIn">
					<span class="icon"></span> <span class="buttonText">구글계정으로 로그인</span>
				</div>
					</div>
				<a id="kakao-login-btn"></a>
			</fieldset>

		</form>
		<form action="joinProcess" id="add_member_form" method="post"
			style="display: none">
			<input type="hidden" id="add_member_id" name="MEMBER_ID"> <input
				type="hidden" id="add_member_password" name="MEMBER_PASSWORD">
			<input type="hidden" id="add_member_name" name="MEMBER_NAME">
			<input type="hidden" name="auth" value="auth">

		</form>
	</div>
</body>
</html>