<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/pro/resources/css/alert_custom.css" />
    
<!-- 안내문구를 보여줄 SECTION -->
<section id="alert-wrap">
	<div class="alert-box">
		<img src="/pro/resources/Image/icon/alert-notice2.png">
		<b>알림</b>
		<hr>
		<!-- 확인 버튼만 있는 알림 창 -->
		<span class="alert-message default-alert">
			<span class="default-message"></span>
		</span>
		<!-- 로그인 필요 알림 -->
		<span class="alert-message login-alert">
			회원만이 이용가능한 기능입니다.<br>
			로그인페이지로 이동하시겠습니까?
		</span>
		<!-- 사이트 이동 알림 -->
		<span class="alert-message site-alert">
			<strong><span class="site-url"></span></strong>로 이동하시겠습니까?
		</span>
		<!-- 프로필 이동 알림 -->
		<span class="alert-message profile-alert">
			<strong><span class="profile-nick"></span></strong>님의 프로필로 이동하시겠습니까?
		</span>
		<!-- 포트폴리오가 없음 알림 -->
		<span class="alert-message missing-alert">
			포트폴리오가 삭제되었거나<br>
			공개 여부가 변경되었습니다.<br>
			페이지를 새로고침 하시겠습니까?
		</span>
		<!-- 본인의 피드백, 포트폴리오 추천 스크랩 불가 알림 -->
		<span class="alert-message not-allowed-alert">
			본인의 <span class="not-allowed-message"></span> 할 수 없습니다.
		</span>
		<!-- 피드백 작성안하고 제출 시 -->
		<span class="alert-message content-need-alert">
			피드백 내용은 필수적으로 입력해야합니다.
		</span>
		<!-- 피드백 작성 완료 알림 -->
		<span class="alert-message write-done-alert">
			피드백 작성을 완료하였습니다.
		</span>
		<!-- 피드백 정말 수정 할 지 확인 -->
		<span class="alert-message feed-update-confirm">
			피드백을 수정하시겠습니까?<br>
			수정시 추천이 초기화됩니다.
		</span>
		<!-- 피드백 수정 완료 알림 -->
		<span class="alert-message update-done-alert">
			피드백 수정을 완료하였습니다.
		</span>
		<!-- 피드백 정말 삭제 할 지 알림 -->
		<span class="alert-message feed-delete-confirm">
			피드백을 정말 삭제하시겠습니까?<br>
			삭제시 복구가 불가합니다.
		</span>
		<!-- 피드백 삭제 결과 알림 -->
		<span class="alert-message feed-delete-result">
			피드백 삭제<span class="delete-result-message"></span>
		</span>
		<!-- 포트폴리오 정말 삭제 할 지 알림 -->
		<span class="alert-message port-delete-confirm">
			포트폴리오를 정말로 삭제하시겠습니까?<br>
			삭제시 복구가 불가합니다.
		</span>
		<!-- 포트폴리오를 수정 할 지 알림 -->
		<span class="alert-message port-update-confirm">
			포트폴리오 수정 페이지로 이동하시겠습니까?<br>
		</span>
		<!-- 오류 발생 알림 -->
		<span class="alert-message error-alert">
			<span class="error-message"></span><br>
			오류가 발생하였습니다.<br>
			지속적으로 문제가 발생할 경우<br>
			관리자에게 문의바랍니다.<br>
			페이지를 새로고침 하시겠습니까?
		</span>
		<hr>
		<div class="alert-btn-area">
			<button class="goBtn" type="button">확인</button>
			<button class="cancelBtn" type="button">취소</button>
		</div>
	</div>
</section>
<script type="text/javascript" src="/pro/resources/js/alert_custom.js"></script>