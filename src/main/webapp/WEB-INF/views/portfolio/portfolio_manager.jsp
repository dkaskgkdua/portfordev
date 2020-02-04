<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/pro/resources/css/portfolio_manager.css" />
<script></script>
<section id="portfolio-manager">
	<div id="exit-manager" class="exit-manager">x</div>
	<div id="portfolio-manager-container" class="portfolio-manager-container">
		<div id="portfolio-add-area">
			<button id="write-portfolio" type="button" onclick="location.href='/pro/portfolio_add'">
	        	<span>포트폴리오 추가</span>
	        	<img src="/pro/resources/Image/icon/add_btn.png" width="20/">
	        </button>
		</div>
		<div class="loading-myList">
			<img src="/pro/resources/Image/loading.gif">
		</div>			
		<div id="my-portfolio-list" class="my-portfolio-list">
			<div class="no-portfolio-item">아직 등록된 포트폴리오가 없습니다.</div>
			<div class="my-portfolio-item" id="myPort_">
				<input type="hidden" class="hidden_PORT_ID" value="">
				<div class="mp-img-wrapper"></div>
				<div class="mp-info-wrapper">
					<span class="mp-info-subject">제목 들어갈 자리</span>
					<img class="mp-icon" src="/pro/resources/Image/icon/view-gray.png">
					<span class="mp-info-view mp-count">555</span>
					<img class="mp-icon" src="/pro/resources/Image/icon/like-gray.png">
					<span class="mp-info-like mp-count">12</span>
					<img class="mp-icon" src="/pro/resources/Image/icon/comment-gray.png">
					<span class="mp-info-feed mp-count">11</span>
					<div class="mp-controller">
						<input type="hidden" class="MEMBER_ID" name="MEMBER_ID" value="">
                        <input type="hidden" class="PORT_ID" name="PORT_ID" value="">
						<button type="button" class="modify-portfolio">수정 하기</button>
						<button type="button" class="delete-portfolio">삭제 하기</button>    
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript" src="/pro/resources/js/portfolio_manager.js"></script>