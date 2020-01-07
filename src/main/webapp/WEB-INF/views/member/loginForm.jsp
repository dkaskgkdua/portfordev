<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .container{width:50%;border:1px solid lightgray;
               padding:20px;margin-top:20px}
</style>
<meta charset="UTF-8">
<title>회원관리 시스템 로그인 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<meta name="google-signin-client_id" content="346744892699-07svb4537noeg6lm2ps2mqaa6t6d5dj2.apps.googleusercontent.com">
<script>
function renderButton() {
    gapi.signin2.render('my-signin2', {
      'scope': 'profile email',
      'width': 240,
      'height': 50,
      'longtitle': true,
      'theme': 'dark',
      'onsuccess': onSuccess,
      'onfailure': onFailure
    });
  }
function onSuccess(googleUser) {
    console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
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
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
	$(function() {
		$(".join").click(function() {
			location.href="join.net";
		});
		if("${saveid}" != "") {
			$("#remember").attr('checked','checked');
			$("#id").val("${saveid}");
		}
	});
</script>
</head>
<body>
   <div class ="container">
  <form method ="post" action = "loginProcess.net" name = "loginform" id ="loginform"> 
 
    <fieldset>
     <legend>로그인</legend>
     <div class = "form-group">
     	<label for ="id"><b>ID</b></label><br>
     	<input class = "form-control" type = "text" size="10px" name = "id" id="id" placeholder ="Enter id" maxlength ="10">
     </div>	
     <div class = "form-group">	
     	<label for ="pass"><b>비밀번호</b></label><br>
     	<input class = "form-control" type = "password" name ="password" id="pass" placeholder = "Enter Password" >
     </div>
     <div class = "form-group">
     	<input type = "checkbox" id = "remember" value = "remember" name = "remember" >
     	<label for = "remember">Remember me</label>
     </div>		
     	<button class = "btn btn-default join" type = "button" value ="회원가입">회원가입</button>
     	<button class = "btn btn-default" id = "button1" type = "reset" value ="취소">Cancel</button>
     	<button class = "btn btn-default" class = "submitbtn" type = "submit" value ="로그인">로그인</button>
     	<!--  <div class="g-signin2" data-width="100" data-height="100" data-longtitle="true" ></div>-->
     	 <div id="my-signin2"></div>
     	<a href="#" onclick="signOut();">Sign out</a>
		
    </fieldset>

    </form>
    
    </div>
</body>
</html>