<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="navbar.jsp" />
		<jsp:include page="../portfolio/portfolio_detail.jsp" />
		<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/main_page.css"/>
		<script type="text/javascript" src="resources/js/main_page.js"></script>
		<script type="text/javascript" src="resources/slick/slick.min.js"></script>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<!-- Banner -->
		<section id="banner">
			<h1>Portfolio for Developer</h1>
			<p>개발자들을 위한 포트폴리오</p>
		</section>
		<!-- One -->
		<c:if test="${!empty recentList}">
		<section id="one" class="wrapper special">
			<div class="inner">
				<header class="align-center">
					<c:if test="${!empty condition}">
					<c:set var="con" value="${condition}"/>
					</c:if>
					<c:if test="${!fn:contains(con, 'recent')}">
					<h2>Noteworthy Portfolios</h2>
					<p>현재 주목받는 포트폴리오</p>
					</c:if>
					<c:if test="${fn:contains(con, 'recent')}">
					<h2>Recently Noted Portfolios</h2>
					<p>최근 추천 받은 포트폴리오</p>
					</c:if>
					<div class="best-portfolio-list">
					<c:if test="${!empty bestList}">
						<c:forEach var="port" items="${bestList}">
						<div class="best-portfolio-item" id="best-port${port.PORT_ID}">
							<input type="hidden" class="hidden_PORT_ID" value="${port.PORT_ID}">
							<div class="bp-img-wrapper" style="background-image:url(/pro/resources/${port.PORT_THUMBNAIL})"></div>
							<div class="bp-info-wrapper">
								<img class="bp-info-writer-img" src="/pro/resources/${port.PORT_WRITER_IMG}">
								<div class="bp-writer-info">
									<span class="bp-info-writer">${port.PORT_WRITER}</span>
									<span class="bp-info-writer-job">${port.PORT_WRITER_JOB}</span>님
								</div>
								<span class="bp-info-subject">${port.PORT_SUBJECT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/view-gray.png">
								<span class="bp-info-view bp-count">${port.PORT_READCOUNT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/like-gray.png">
								<span class="bp-info-like bp-count">${port.PORT_LIKECOUNT}</span>
								<c:if test="${port.PORT_FEED_NEED == 0}">
								<img class="bp-icon" src="/pro/resources/Image/icon/comment-gray.png">
								<span class="bp-info-feed bp-count">${port.PORT_FEEDCOUNT}</span>
								</c:if>
							</div>
						</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty bestList}">
						<c:forEach var="port" items="${recentList}">
						<div class="best-portfolio-item" id="best-port${port.PORT_ID}">
							<input type="hidden" class="hidden_PORT_ID" value="${port.PORT_ID}">
							<div class="bp-img-wrapper" style="background-image:url(/pro/resources/${port.PORT_THUMBNAIL})"></div>
							<div class="bp-info-wrapper">
								<img class="bp-info-writer-img" src="/pro/resources/${port.PORT_WRITER_IMG}">
								<div class="bp-writer-info">
									<span class="bp-info-writer">${port.PORT_WRITER}</span>
									<span class="bp-info-writer-job">${port.PORT_WRITER_JOB}</span>님
								</div>
								<span class="bp-info-subject">${port.PORT_SUBJECT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/view-gray.png">
								<span class="bp-info-view bp-count">${port.PORT_READCOUNT}</span>
								<img class="bp-icon" src="/pro/resources/Image/icon/like-gray.png">
								<span class="bp-info-like bp-count">${port.PORT_LIKECOUNT}</span>
								<c:if test="${port.PORT_FEED_NEED == 0}">
								<img class="bp-icon" src="/pro/resources/Image/icon/comment-gray.png">
								<span class="bp-info-feed bp-count">${port.PORT_FEEDCOUNT}</span>
								</c:if>
							</div>
						</div>
						</c:forEach>
					</c:if>
					</div>
					<p>
					<c:if test = "${fn:contains(con, 'daily')}">
						<span class="best-port-filter filter-active clickable">Daily</span>
						<span class="best-port-filter clickable">Weekly</span>
						<span class="best-port-filter clickable">Monthly</span>
					</c:if>
					<c:if test = "${fn:contains(con, 'weekly')}">
						<span class="best-port-filter filter-disable">Daily</span>
						<span class="best-port-filter filter-active clickable">Weekly</span>
						<span class="best-port-filter clickable">Monthly</span>
					</c:if>
					<c:if test = "${fn:contains(con, 'monthly')}">
						<span class="best-port-filter filter-disable">Daily</span>
						<span class="best-port-filter filter-disable">Weekly</span>
						<span class="best-port-filter filter-active clicakble">Monthly</span>
					</c:if>
					<c:if test = "${fn:contains(con, 'recent')}">
						<span class="best-port-filter filter-disable">Daily</span>
						<span class="best-port-filter filter-disable">Weekly</span>
						<span class="best-port-filter filter-disable">Monthly</span>
					</c:if>
						<span class="best-port-filter clickable" onclick="javascript:location.href='portfolio/collection'">All</span>
					</p>
				</header>
			</div>
		</section>
		</c:if>
		<!-- Two -->
		<section id="two" class="wrapper">
			<div class="inner">
				<header class="align-center">
					<h2>Why PFD?</h2>
					<p>PFD만이 가진 장점</p>
				</header>
				<div class="flex flex-4">
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/laptop.png" alt="Portfolio" />
						</div>
						<h3>Convenience</h3>
						<p>간편한 정보 입력으로 쉽게 만드는 포트폴리오</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/feedback.png" alt="Feedback" />
						</div>
						<h3>FeedBack</h3>
						<p>선배 개발자들로 부터 얻는 전문적인 평가와 조언</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/class.png" alt="Community" />
						</div>
						<h3>Community</h3>
						<p>자유롭게 의견을 나누며 소통하는 게시판</p>
					</div>
					<div class="box">
						<div class="image fit">
							<img src="resources/Image/icon/team.png" alt="Study" />
						</div>
						<h3>Study</h3>
						<p>편리한 프로젝트 팀원, 스터디 그룹원 모집</p>
					</div>
				</div>
				<c:if test="${empty id}">
				<footer>
					<a href="/pro/join" class="button special">무료로 가입하기</a>
				</footer>
				</c:if>
			</div>
		</section>
		<!-- Three -->
		<section id="Three" class="wrapper style1 special">
			<div class="inner">
				<header>
					<h2>PFD Main Features</h2>
					<p>PFD 주요기능</p>
				</header>
				<div class="main-features">
					<div class="feature">
						<div class="feature-summary">
							<div class="feature-img">
								<img src="resources/Image/icon/profile-main.png" alt="Feature 1"/>
							</div>
							<h3>프로필</h3>
						</div>
						<div class="feature-detail">
							<span class="feature-detail-menu my_profile">프로필 관리하기</span>
							<span class="feature-detail-menu" onclick="javascript:location.href='/pro/profile/collection'">프로필 모아보기</span>
						</div>
					</div>
					<div class="feature">
						<div class="feature-summary">
							<div class="feature-img">
								<img src="resources/Image/icon/portfolio-main.png" alt="Feature 2"/>
							</div>
							<h3>포트폴리오</h3>
						</div>
						<div class="feature-detail">
							<span class="feature-detail-menu my_port">포트폴리오 관리하기</span>
							<span class="feature-detail-menu" onclick="javascript:location.href='/pro/portfolio/collection'">포트폴리오 모아보기</span>
						</div>
					</div>
					<div class="feature">
						<div class="feature-summary">
							<div class="feature-img">
								<img src="resources/Image/icon/community-main.png" alt="Feature 3"/>
							</div>
							<h3>커뮤니티</h3>
						</div>
						<div class="feature-detail">
							<span class="feature-detail-menu" onclick="javascript:location.href='board_list?BOARD_CATEGORY=0'">자유 게시판</span>
							<span class="feature-detail-menu" onclick="javascript:location.href='board_list?BOARD_CATEGORY=1'">스터디 게시판</span>
							<span class="feature-detail-menu" onclick="javascript:location.href='board_list?BOARD_CATEGORY=2'">Q&amp;A 게시판</span>
						</div>
					</div>
					<div class="feature">
						<div class="feature-summary">
							<div class="feature-img">
								<img src="resources/Image/icon/news.png" alt="Feature 4"/>
							</div>
							<h3>IT뉴스</h3>
						</div>
						<div class="feature-detail">
							<span class="feature-detail-menu" onclick="javascript:location.href='/pro/news'">IT기사 보러가기</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>