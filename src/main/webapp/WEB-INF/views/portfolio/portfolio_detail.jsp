<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/pro/resources/css/portfolio_detail.css" />
<link rel="stylesheet" type="text/css" href="/pro/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/pro/resources/slick/slick-theme.css"/>
<script type="text/javascript" src="/pro/resources/slick/slick.min.js"></script>
<script src="/pro/resources/js/portfolio_detail.js"></script>
<!-- 포트폴리오 상세정보를 보여주는 modal -->
<div id="portfolioModalContainer" class="portfolio-modal-container" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" style="display:none">
	<!-- hidden values -->
	<input id="MEMBER_ID" type="hidden" name="MEMBER_ID" value="79">
	<input id="MEMBER_NAME" type="hidden" name="MEMBER_NAME" value="본인닉네임들어갈자리">
	<input id="PORT_ID" type="hidden" name="PORT_ID" value="13">
	<input id="PORT_WRITER" type="hidden" name="PORT_WRITER_ID" value="작성자닉네임들어갈곳">
	<input id="PORT_SUBJECT" type="hidden" name="PORT_SUBJECT" value="제목들어갈 자리">
	<input id="PORT_CONTENT" type="hidden" name="PORT_CONTENT" value="포트폴리오 상세내용 들어갈 자리">
	<input id="PORT_FILE" type="hidden" name="PORT_FILE" value="포트폴리오이미지들들어갈자리">
	<input id="PORT_START_DAY" type="hidden" name="PORT_START_DAY" value="2020/01/01">
	<input id="PORT_END_DAY" type="hidden" name="PORT_END_DAY" value="2020/01/25">
	<input id="PORT_TEAM" type="hidden" name="PORT_TEAM" value="1">
	<input id="PORT_GITHUB" type="hidden" name="PORT_GITHUB" value="GITHUB 주소 들어갈 자리">
	<input id="PORT_SITE" type="hidden" name="PORT_SITE" value="SITE 도메인 주소 들어갈 자리">
	<input id="PORT_FEED" type="hidden" name="PORT_FEED" value="0">
	<input id="PORT_REGIDATE" type="hidden" name="PORT_REGIDATE" value="2020/01/25">
	<input id="PORT_READCOUNT" type="hidden" name="PORT_READCOUNT" value="1234123432">
	
	<!-- 모바일용 exit -->
	<div class="exit-modal">x</div>
	<!-- PORTFOLIO DETAIL SECTION -->
	<section id="portfolio-detail-wrap">
		<!-- 모바일용 comment -->
		<div class="comment-show">
			<img src="/pro/resources/Image/icon/comment-gray.png">
		</div>
		<div class="portfolio-detail-container">
			<header class="portfolio-detail-header">
				<div class="detail-summary-floater"></div>
				<div class="portfolio-detail-summary">
					<!-- 포트폴리오 제목 -->
					<span class="detail-summary-subject">포트폴리오 제목 들어갈 자리</span>
					<div class="summary-info">
						<!-- 포트폴리오 조회수 -->
						<img class="read-icon" src="/pro/resources/Image/icon/view-gray.png">
						<span class="port-read-cnt">1234</span>
						<!-- 포트폴리오 추천수 -->
						<img class="recom-icon" src="/pro/resources/Image/icon/like-gray.png">
						<span class="port-recom-cnt">55</span>
						<!-- 포트폴리오 피드백수 -->
						<img class="feed-icon" src="/pro/resources/Image/icon/comment-gray.png">
						<span class="port-feed-cnt">22</span>
					</div>
					<!-- 포트폴리오 등록일 -->
					<span class="detail-summary-regidate">2020-01-15</span>
				</div>
			</header>
			<div class="portfolio-detail-project">
				<!-- 포트폴리오 이미지 슬라이드 -->
				<div class="port-slide-list">
	  				<div class="port-slide-item">Img1</div>
	  				<div class="port-slide-item">Img2</div>
	  				<div class="port-slide-item">Img3</div>
	  				<div class="port-slide-item">Img4</div>
	  				<div class="port-slide-item">Img5</div>
	  				<div class="port-slide-item">Img6</div>
				</div>
			</div>
			<!-- 포트폴리오 콘솔 메뉴 -->
			<div class="drag-activity-menu" style="display:none"><img src="/pro/resources/Image/right.png"></div>
			<footer class="portfolio-detail-activity">
				<!-- 포트폴리오 추천 / 취소 버튼 -->
				<div class="icon-tail-fit">
					<img class="recom-icon" src="/pro/resources/Image/icon/heart-off.png">
					<span class="recom-tail">추천 하기</span>
				</div>
				<!-- 포트폴리오 스크랩 / 취소 버튼 -->
				<div class="icon-tail-fit">
					<img class="scrap-icon" src="/pro/resources/Image/icon/scrap-off.png">
					<span class="scrap-tail">스크랩 하기</span>
				</div>
				<!-- 피드백 보기 / 끄기 버튼 -->
				<div class="icon-tail-fit feed-show-btn" style="display:none">
					<img class="feed-show-icon" src="/pro/resources/Image/icon/comment-gray.png">
					<span class="feed-show-tail">피드백 보기</span>
				</div>
				<!-- 피드백 작성 / 취소 버튼 -->
				<div class="icon-tail-fit">
					<img class="write-icon" src="/pro/resources/Image/icon/write-icon.png">
					<span class="write-tail">피드백 작성</span>
				</div>
			</footer>
		</div>
	</section>
	<!-- PORTFOLIO INFO SECTION -->
	<section id="portfolio-info-wrap">
		<div class="portfolio-info-container">
				
		</div>
	</section>
	<!-- FEEDBACK SECTION -->
	<section id="portfolio-feedback-wrap">
		<div class="portfolio-feedback-container">
			<!-- 피드백 작성 -->
			<div class="feedback-write-container" style="display:none;">
				<div class="feed-writer-profile">
					<img class="feed-writer-profile-img" src="/pro/resources/Image/userdefault.png">
					<span class="feed-writer-profile-nick"></span>
				</div>
				<textarea id="FEED_CONTENT" name="FEEDBACK_CONTENT"></textarea>
				<button type="button" class="feed-write-done">작성완료</button>
				<button type="button" class="feed-write-cancel">작성취소</button>
			</div>
			<!-- 피드백 헤더 -->
			<div class="portfolio-feedback-header">
				<!-- 피드백 정보 -->
				<div class="portfolio-feedback-info">
					<h2>Feedback</h2>
					<h2>(&nbsp;<span class="portfolio-feedback-cnt">2</span>&nbsp;)</h2>
				</div>
				<!-- 피드백 필터 -->
				<div class="portfolio-feedback-filter">
					<select name="feedPick" class="select" id="feedPick">
						<option value="allFeed" selected>전체</option>
						<option value="bestFeedOnly">베스트</option>
					</select>
					<select name="feedOrder" class="select" id="feedOrder">
						<option value="latest" selected>최신순</option>
						<option value="recommended">추천순</option>
					</select>
				</div>
			</div>
			<!-- 피드백 리스트 -->
			<div class="portfolio-feedback-list">
				<div class="portfolio-feedback-item best-feedback">
					<!-- hidden feedback id -->
					<input type="hidden" id="FEEDBACK_13" class="FEEDBACK_ID" name="FEEDBACK_ID" value="13">
					<div class="feedback-info">
						<div class="feedback-writer-profile">
							<img class="feedback-writer-img" src="/pro/resources/Image/userdefault.png">
							<span class="feedback-writer-nick">닉네임은10글자가능</span>
							<img class="activity-score" src="/pro/resources/Image/icon/award.svg">
							<span class="feedback-writer-score">99529999</span>
						</div>
					</div>
					<div class="feedback-content">
						<textarea class="feedback-content-text" readonly>어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 </textarea>
					</div>
					<div class="feedback-controller">
						<div class="feedback-recommend">
							<div class="icon-tail-fit">
								<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-off.png">
								<span class="feed-recom-tail">추천하기</span>
							</div>
							<span class="feedback-recommend-cnt">9952</span>
						</div>
						<button type="button" class="feedback-delete">삭제</button>
						<button type="button" class="feedback-update">수정</button>
					</div>
				</div>
				<div class="portfolio-feedback-item">
					<input type="hidden" id="FEEDBACK_14" class="FEEDBACK_ID" name="FEEDBACK_ID" value="14">
					<div class="feedback-info">
						<div class="feedback-writer-profile">
							<img class="feedback-writer-img" src="/pro/resources/Image/userdefault.png">
							<span class="feedback-writer-nick">어쩌구저쩌구닉넴10</span>
							<img class="activity-score" src="/pro/resources/Image/icon/award.svg">
							<span class="feedback-writer-score">299</span>
						</div>
					</div>
					<div class="feedback-content">
						<textarea class="feedback-content-text" readonly>어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 어쩌구저쩌구해서 어쩌구리 저쩌구리 여차저차 고치세요 별로네요 </textarea>
					</div>
					<div class="feedback-controller">
						<div class="feedback-recommend">
							<div class="icon-tail-fit">
								<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-off.png">
								<span class="feed-recom-tail">추천하기</span>
							</div>
							<span class="feedback-recommend-cnt">111111</span>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</div>