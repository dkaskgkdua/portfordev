<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../main/navbar.jsp" />
<title>MyPage-${nickname}</title>
<style>
article {
	width: 70%;
	height: 80%;
	float: right; 
	padding: 25px;
}

aside {
	width: 30%;
	height: 80%;
	float: left; 
	padding: 25px;
}
section {
	width : 100%;
	height : 500px;
}
.user_info {
	display : inline-block;
}
</style>
</head>
<body>
	<section>
		<aside>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">First item</a> 
				<a href="#" class="list-group-item list-group-item-action">Second item</a> 
				<a href="#" class="list-group-item list-group-item-action">Third item</a>
			</div>
		</aside>
	<article>
		<div>
			<div class="avatar">
				<img src="${PROFILE_IMG_FILE}" alt="avatar" class="avatar">
			</div>
			<div class="container">
				<div class="user_nick">
					<h3>${nickname}</h3><h5>${MEMBER_DATE}</h5>
				</div>
				<div class="user_infos">
					<div class="user_info">
						<div class="user_info_label">
							활동점수
						</div>
						<div class="user_info_score">
							${MEMBER_ACT}
						</div>
					</div>
					<div class="user_info">
						<div class="user_info_label">
							포인트
						</div>
						<div class="user_info_score">
							${MEMBER_POINT}
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${menu eq '정보수정'}">
			</c:when>
			<c:when test="${menu eq '게시물'}">
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</article>
	</section>
<jsp:include page="../main/footer.jsp" />
</body>

</html>