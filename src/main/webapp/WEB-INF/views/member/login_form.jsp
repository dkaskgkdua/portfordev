<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>PFD 로그인</title>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<meta name="google-signin-client_id"
	content="346744892699-07svb4537noeg6lm2ps2mqaa6t6d5dj2.apps.googleusercontent.com">
<script>
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope' : 'profile email',
			'width' : 240,
			'height' : 50,
			'longtitle' : true,
			'theme' : 'dark',
			'onsuccess' : onSuccess,
			'onfailure' : onFailure
		});
	}
	function onSuccess(googleUser) {
		var profile = googleUser.getBasicProfile();

	}
	function onFailure(error) {
		console.log(error);
	}
	/*
	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}*/
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
	$(function() {
		$(".join").click(function() {
			location.href = "join.net";
		});
		if ("${saveid}" != "") {
			$("#remember").attr('checked', 'checked');
			$("#id").val("${saveid}");
		}
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
		<form method="post" action="loginProcess.net" name="loginform"
			id="loginform">

			<fieldset>
				<legend>로그인</legend>
				<div class="form-group">
					<label for="id"><b>ID</b></label> <input
						class="form-control" type="text" size="10px" name="id" id="id"
						placeholder="Enter id" maxlength="10">
				</div>
				<div class="form-group">
					<label for="pass"><b>비밀번호</b></label> <input
						class="form-control" type="password" name="password" id="pass"
						placeholder="Enter Password">
				</div>
				<div class="form-group">
					<input type="checkbox" id="remember" value="remember" name="remember"> 
					<label for="remember">Remember me</label>
				</div>
				<div class="form-group">
					<button class="btn btn-secondary" id="submit_btn" type="submit">로그인</button>
					<button class="btn btn-secondary join" type="button">회원가입</button>
					<button class="btn btn-danger" id="cancel_button" type="reset">취소</button>
				</div>
				<!--  <div class="g-signin2" data-width="100" data-height="100" data-longtitle="true" ></div>-->
				<div class="form-group">
					<div id="my-signin2"></div>
				</div>
				
				<a href="#" onclick="signOut();">Sign out</a>

			</fieldset>

		</form>

	</div>
</body>
</html>