<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Developers</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="navbar.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/css/main_page.css"/>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<section id="PFD Developers" class="wrapper style1 special">
			<div class="inner">
				<header>
					<h2>PFD Developers</h2>
					<p>PFD 개발자들의 포트폴리오</p>
				</header>
				<div class="flex flex-4">
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic03.jpg" alt="SongMinJun" />
						</div>
						<h3>송민준</h3>
						<p>팀장</p>
					</div>
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/pic04.jpg" alt="LeeDaEun" />
						</div>
						<h3>이다은</h3>
						<p>팀원</p>
					</div>
					<div class="box person">
						<div class="image round">
							<img src="resources/Image/PFD_Developers/hyunho_profile.jpg" alt="AnHyunHo" />
						</div>
						<h3>안현호</h3>
						<p>팀원</p>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"/>
	</body>
</html>