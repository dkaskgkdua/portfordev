$(document).ready(function(){
	// 전체 클릭시
	$('#cateAll').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#cateAll').addClass('active-category');
	});
	// 피드백 클릭시
	$('#feedNeedOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#feedNeedOnly').addClass('active-category');
	});
	// 추천 클릭시
	$('#recomOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#recomOnly').addClass('active-category');
	});
	
	// dropdown toggle button 클릭 시
	$('.dropdown-menu').children('button').click(function(){
		// 선택한 메뉴로 버튼 텍스트 변경
		$(this).parent().parent().children('.btn').text($(this).text());
		if($(this).parent().parent().children('.btn') == $('#orderDropDown'))
		{
			alert('order');
		}
		else if($(this).parent().parent().children('.btn') == $('#fromDropDown'))
		{
			alert('from');
		}
	});
	
	// order 변경 시
	
	// from 변경 시
	

	// Scroll Top
	$(window).scroll(function(){
		if($(this).scrollTop() > 500)
		{
			$('#move_top_btn').fadeIn();
		}
		else
		{
			$('#move_top_btn').fadeOut();
		}
	});
	$('#move_top_btn').click(moveTop);
	function moveTop()
	{
		$('html, body').animate({scrollTop : 0}, 100);
		return false;
	}
	
	// scroll 이 끝에 도달하기 전 다음 문서 로드
	// document height : 문서 전체의 높이
	// window height : 화면의 높이
	// scroll top : 스크롤의 top 이 위치하고 있는 높이
	var isEnd = false;
	var endRow = 200;
	var startRow = 0;
	$(window).scroll(function(){
		var scrollTopHeight = $(window).scrollTop();
		if($(document).height() <= scrollTopHeight + $(window).height() + 10)
		{
			loadNext();
			$('html, body').animate({scrollTop : scrollTopHeight}, 100);
		}
	});
	
	function loadNext()
	{
		if(isEnd)return;
		//$.ajax({});
		var output = '<div class="profile-list-item"><div class="img-wrapper">이미지 들어갈 자리</div>';
			output +=		'<div class="info">';
			output +=		'<div class="info-detail">';
			output +=		'<div class="title">제목 들어갈 자리</div>';
			output +=		'<div class="user-profile">';
			output +=		'<img class="pic icon-round" src="/pro/resources/Image/sample.jpg">';
			output +=		'이름 들어갈 자리</div>';
			output +=		'</div></div>';
			output +=		'<div class="bottom">';
			output +=		'<table class="social-info">';
			output +=		'<tbody>';
			output +=		'<tr>';
			output +=		'<td class="view-cnt">';
			output +=		'<img class="view-icon" src="/pro/resources/Image/icon/view-gray.png">';
			output +=		'1234</td>';
			output +=		'<td class="like-cnt">';
			output +=		'<img class="like-icon" src="/pro/resources/Image/icon/like-gray.png">';
			output +=		'55</td>';
			output +=		'<td class="comment-cnt">';
			output +=		'<img class="comment-icon" src="/pro/resources/Image/icon/comment-gray.png">';
			output +=		startRow + '</td>';
			output +=		'</tr></tbody></table></div></div>';
		
		$('.profile-list').append(output);
			// .animate({'opacity':'0.5'}, 1000);
		startRow++;
		if(startRow>=endRow)
		{
			isEnd = true;
			alert('문서로드 종료');
			return;
		}
	}
});