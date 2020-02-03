<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Portfolio Collection</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<jsp:include page="../alert/alert_custom.jsp" />
		<jsp:include page="../portfolio/portfolio_detail.jsp" />
		<link rel="stylesheet" href="../resources/css/portfolio_collection.css" />
		<script src="../resources/js/portfolio_collection.js"></script>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div class="clearfix">
			<div class="sort-list" style="margin-top: 0px;">
      			<div class="category-list">
					<div class="category-list-item active-category" id="cateAll" title="전체 포트폴리오">전체</div>
					<div class="category-list-item" id="feedNeedOnly" title="피드백이 필요한 포트폴리오">
						<img src="/pro/resources/Image/icon/Fini_icon.png" style="height:20px;">피니
					</div>
					<div class="category-list-item" id="recomOnly" title="추천을 3개 이상 받은 포트폴리오">
						<img src="/pro/resources/Image/icon/like-gray.png" style="height:15px; margin-right:7px;">베스트
					</div>
					<div class="category-list-item" id="scrapOnly" title="스크랩한 포트폴리오">
						<img src="/pro/resources/Image/icon/Scrap_unclicked_icon.svg" style="height:23px; margin-right:3px;">스크랩
					</div>
				</div>
				<div class="sort-condition">
					<div class="dropdown" style="display:inline-block;">
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="orderDropDown" title="정렬순">최신순</button>
						<div class="dropdown-menu" style="min-width:100px; text-align:center;" aria-labelledby="orderDropDown">
							<button class="dropdown-item orderBtn" type="button">최신순</button>
							<button class="dropdown-item orderBtn" type="button">추천순</button>
							<button class="dropdown-item orderBtn" type="button">조회순</button>
							<button class="dropdown-item orderBtn" type="button">피드백순</button>
						</div>
					</div>
					<div class="dropdown" style="display:inline-block;">
						<button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="fromDropDown" title="포트폴리오 작성기간">전체기간</button>
						<div class="dropdown-menu" style="min-width:115px; text-align:center;" aria-labelledby="fromDropDown">
							<button class="dropdown-item fromBtn" type="button">전체기간</button>
							<button class="dropdown-item fromBtn" type="button">최근 24시간</button>
							<button class="dropdown-item fromBtn" type="button">최근 1주일</button>
							<button class="dropdown-item fromBtn" type="button">최근 1달</button>
							<button class="dropdown-item fromBtn" type="button">최근 3달</button>
						</div>
					</div>
				</div>
			</div>
			<div class="portfolio-container">
				<div class="portfolio-list">
					<c:if test="${empty portList}">
						<div class="no-portfolio">아직 등록된 포트폴리오가 없습니다.</div>
					</c:if>
					<c:if test="${!empty portList}">
					<c:forEach var="port" items="${portList}">
					<c:if test="${port.PORT_SHOW == 0}">
					<div class="portfolio-list-item clickable">
						<input type="hidden" class="hidden_PORT_ID" value="${port.PORT_ID}">
						<input type="hidden" class="hidden_PORT_WRITER_ID" value="${port.MEMBER_ID}">
						<div class="img-wrapper" style="background-image:url(/pro/resources/${port.PORT_THUMBNAIL});">
							<input type="hidden" class="port-img-hidden" value="${port.PORT_FILE_PATH}">
							<div class="port-scrap-area" title="스크랩하기">
								<c:if test="${port.PORT_SCRAP == 0}">
								<img src="/pro/resources/Image/icon/Scrap_unclicked_icon.svg">
								</c:if>
								<c:if test="${port.PORT_SCRAP == 1}">
								<img src="/pro/resources/Image/icon/Scrap_clicked_icon.svg">
								</c:if>
							</div>
							<c:if test="${port.PORT_FEED_NEED == 0}">
							<div class="port-fini-area" title="피드백이 필요한 포트폴리오">
								<img src="/pro/resources/Image/icon/Fini_icon.svg">
							</div>
							</c:if>
						</div>
						<div class="info">
							<div class="info-detail">
								<div class="title">${port.PORT_SUBJECT}</div>
								<div class="user-profile" title="작성자 프로필로 이동">
									<img class="pic icon-round" src="/pro/resources/${port.PORT_WRITER_IMG}">
									<input type="hidden" class="user-id-hidden" value="${port.MEMBER_ID}">
									<input type="hidden" class="user-nick-hidden" value="${port.PORT_WRITER}">
									${port.PORT_WRITER}
								</div>
							</div>
						</div>
						<div class="bottom">
							<table class="social-info">
								<tbody>
									<tr>
										<td class="view-cnt" title="조회 수">
											<img class="view-icon" src="../resources/Image/icon/view-gray.png">
											<span class="view-count">${port.PORT_READCOUNT}</span>
											<input type="hidden" class="view-cnt-hidden" value="${port.PORT_READCOUNT}">
										</td>
										<td class="like-cnt" title="추천 수">
											<img class="like-icon" src="../resources/Image/icon/like-gray.png">
											<span class="like-count">${port.PORT_LIKECOUNT}</span>
											<input type="hidden" class="like-cnt-hidden" value="${port.PORT_LIKECOUNT}">
										</td>
										<td class="comment-cnt" title="피드백 수">
											<img class="comment-icon" src="../resources/Image/icon/comment-gray.png">
											<span class="comment-cnt">${port.PORT_FEEDCOUNT}</span>
											<input type="hidden" class="comment-cnt-hidden" value="${port.PORT_FEEDCOUNT}">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<button id="move_top_btn" type="button">TOP</button>
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>