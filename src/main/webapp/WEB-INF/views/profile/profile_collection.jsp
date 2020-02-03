<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Profile Collection</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<jsp:include page="../alert/alert_custom.jsp" />
		<link rel="stylesheet" href="../resources/css/profile_collection.css" />
		<script src="/pro/resources/js/profile_collection.js"></script>
	</head>
	<body>
		<div class="clearfix">
			<div class="sort-list" style="margin-top: 0px;">
      			<div class="category-list">
					<div class="category-list-item active-category" id="cateAll" title="전체 회원">전체</div>
					<div class="category-list-item" id="portWriterOnly" title="포트폴리오를 작성한 회원">
						<img src="/pro/resources/Image/icon/board-cnt.png">작성회원
					</div>
					<div class="category-list-item" id="bestActorOnly" title="활동점수 100점 이상의 회원">
						<img src="/pro/resources/Image/icon/award.png">베스트
					</div>
				</div>
				<div class="sort-condition">
					<div class="dropdown" style="display:inline-block;">
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="orderDropDown" title="정렬순">가입 날짜</button>
						<div class="dropdown-menu" style="min-width:110px; text-align:center;" aria-labelledby="orderDropDown">
							<button class="dropdown-item orderBtn" type="button">가입 날짜</button>
							<button class="dropdown-item orderBtn" type="button">활동 날짜</button>
							<button class="dropdown-item orderBtn" type="button">활동 점수</button>
						</div>
					</div>
					<div class="dropdown" style="display:inline-block;">
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="fromDropDown" title="마지막으로 활동한 기간">활동 기간</button>
						<div class="dropdown-menu" style="min-width:115px; text-align:center;" aria-labelledby="fromDropDown">
							<button class="dropdown-item recentBtn" type="button">활동 기간</button>
							<button class="dropdown-item recentBtn" type="button">최근 24시간</button>
							<button class="dropdown-item recentBtn" type="button">최근 1주일</button>
							<button class="dropdown-item recentBtn" type="button">최근 1달</button>
							<button class="dropdown-item recentBtn" type="button">최근 3달</button>
						</div>
					</div>
				</div>
			</div>
			<div class="profile-container">
				<div class="profile-list">
				<c:if test="${empty profileList}">
					<div class="no-profile">아직 등록된 프로필이 없습니다.</div>
				</c:if>
				<c:if test="${!empty profileList}">
				<c:forEach var="profile" items="${profileList}">
					<div class="profile-list-item clickable">
						<input type="hidden" class="PROFILE_MEMBER_ID" value="${profile.MEMBER_ID}">
						<div class="img-wrapper" style="background-image:url(/pro/resources/upload/${profile.PROFILE_IMG_FILE})"></div>
						<div class="info">
							<div class="info-detail">
								<span class="profile-name">${profile.PROFILE_REAL_NAME}</span>
							</div>
							<div class="activity" title="활동 점수">
								<img class="activity-icon" src="/pro/resources/Image/icon/award.svg">
								<span class="activity-score">${profile.MEMBER_ACT}</span>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="port-cnt" title="포트폴리오 작성 수">
											<img class="port-cnt-icon" src="/pro/resources/Image/icon/board-cnt.png">
											<span class="port-cnt-span">${profile.PORT_CNT}</span>
										</td>
										<td class="feed-cnt" title="피드백 작성 수">
											<img class="feed-cnt-icon" src="/pro/resources/Image/icon/comment-gray.png">
											<span class="feed-cnt-span">${profile.FEED_CNT}</span>
										</td>
										<td class="user-page clickable" title="유저 페이지로 이동">
											<img class="user-page-icon" src="/pro/resources/Image/userdefault.png">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</c:forEach>
				</c:if>
				</div>
			</div>
		</div>
		<button id="move_top_btn" type="button">TOP</button>
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>