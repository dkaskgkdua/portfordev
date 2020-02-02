$(document).ready(function(){
	categoryR = $('.active-category').attr('id');
	orderR = 'newest';
	recentActR = 'all';
	pageR = 1;
	// 프로필 리스트 초기화
	function initProfileList(){
		categoryR = $('.active-category').attr('id');
		pageP = 1;
		$('.profile-list').empty();
		getProfileList();
		console.log(pageR);
		console.log(recentActR);
		console.log(orderR);
		console.log(categoryR);
	}
	// 프로필 리스트 가져오기
	function getProfileList(){
		$.ajax({
			data: {'page':pageR, 'category': categoryR, 'recentAct': recentActR, 'order': orderR}, 
			url: '/pro/profile/getProfileList', 
			type: 'post',
			dataType: 'json', 
			cache: false, 
			success: function(profileList){
				if(profileList == null || profileList.length == 0){
					isEnd = true;
					if(pageR == 1){
						$('.profile-list').append('<div class="no-profile">조건에 해당하는 프로필이 없습니다.</div>');
					}
					return;
				}
				$.each(profileList, function(index){
					var output = 	'<div class="profile-list-item clickable" id="profile_'+index+'" style="display:none;">';
					output += 			'<input type="hidden" class="PROFILE_MEMBER_ID" value="'+this.MEMBER_ID+'">';
					output += 			'<div class="img-wrapper"></div>';
					output += 			'<div class="info">';
					output += 				'<div class="info-detail">';
					output += 					'<span class="profile-name">'+this.PROFILE_REAL_NAME+'</span>';
					output += 				'</div>';
					output += 				'<div class="activity">';
					output += 					'<img class="activity-icon" src="/pro/resources/Image/icon/award.svg">';
					output += 					'<span class="activity-score">'+this.MEMBER_ACT+'</span>';
					output += 				'</div>';
					output += 			'</div>';
					output += 			'<div class="bottom">';
					output += 				'<table class="social-info">';
					output += 					'<tbody>';
					output += 						'<tr>';
					output += 							'<td class="port-cnt">';
					output += 								'<img class="port-cnt-icon" src="/pro/resources/Image/icon/board-cnt.png">';
					output += 								'<span class="port-cnt-span">'+this.PORT_CNT+'</span>';
					output += 							'</td>';
					output += 							'<td class="feed-cnt">';
					output += 								'<img class="feed-cnt-icon" src="/pro/resources/Image/icon/comment-gray.png">';
					output += 								'<span class="feed-cnt-span">'+this.FEED_CNT+'</span>';
					output += 							'</td>';
					output += 							'<td class="user-page clickable">';
					output += 								'<img class="user-page-icon" src="/pro/resources/Image/userdefault.png">';
					output += 							'</td>';
					output += 						'</tr>';
					output += 					'</tbody>';
					output +=	 			'</table>';
					output += 			'</div>';
					output += 		'</div>';
					$('.profile-list').append(output);
					$('#profile_' + index).children('.img-wrapper').css({'background-image' : 'url(/pro/resources/upload/'+this.PROFILE_IMG_FILE+')'});
					$('#profile_' + index).fadeIn(400);
				});
				proCollFunctionOn();
			},
			error: function(){
				alert('프로필 리스트를 가져오는 중\n에러가 발생했습니다.\n문제가 지속될 경우\n관리자에게 문의바랍니다.');
			}
		});
	}
	
	// 전체 클릭시
	$('#cateAll').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#cateAll').addClass('active-category');
		initProfileList();
	});
	// 포트폴리오 클릭시
	$('#portWriterOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#portWriterOnly').addClass('active-category');
		initProfileList();
	});
	// 활동갑 클릭시
	$('#bestActorOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#bestActorOnly').addClass('active-category');
		initProfileList();
	});
	
	// dropdown toggle button 클릭 시
	$('.dropdown-menu').children('button').click(function(){
		// 선택한 메뉴로 버튼 텍스트 변경
		$(this).parent().parent().children('.btn').text($(this).text());
		// 최근 활동 순 변경 시
		if($(this).hasClass('orderBtn')){
			var btnText = $(this).text();
			if(btnText == '가입순')
				orderR = 'newest';
			else if(btnText == '최근 활동순')
				orderR = 'latest_act';
			else if(btnText == '총 활동순')
				orderR = 'most_act';
			initProfileList();
		}
		// 활동 일 변경 시
		else if($(this).hasClass('recentBtn')){
			var btnText = $(this).text();
			if(btnText == '활동 기간')
				recentActR = 'all';
			else if(btnText == '최근 24시간')
				recentActR = 'day';
			else if(btnText == '최근 1주일')
				recentActR = 'week';
			else if(btnText == '최근 1달')
				recentActR = 'month';
			else if(btnText == '최근 3달')
				recentActR = 'month3';
			initProfileList();
		}
	});
	// 프로파일 모음 페이지의 전반적인 기능들
	proCollFunctionOn();
	function proCollFunctionOn(){
		
		
		// 프로필 아이템 클릭 시
		$('.profile-list-item').click(function(){
			location.href='/pro/profile?idch='+$(this).children('.PROFILE_MEMBER_ID').val();
		});
		// 유저 아이콘 호버 시
		$('.user-page').hover(function(){
			$(this).parent().parent().parent().parent().parent().removeClass('clickable');
		}, function(){
			$(this).parent().parent().parent().parent().parent().addClass('clickable');
		});
		// 유저 아이콘 클릭 시
		$('.user-page').click(function(e){
			e.stopPropagation();
			location.href='/pro/mypage?MEMBER_ID='+$(this).parent().parent().parent().parent().parent().children('.PROFILE_MEMBER_ID').val();
		});
	}
	// 전반적인 기능 off
	function proCollFunctionOff(){
		$('.profile-list-item').off('click');
		$('.user-page').off('mouseenter');
		$('.user-page').off('mouseleave');
		$('.user-page').off('click');
	}
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
	$(window).scroll(function(){
		var scrollTopHeight = $(window).scrollTop();
		if($(document).height() <= scrollTopHeight + $(window).height() + 10)
		{
			if(loadNext())
				$('html, body').animate({scrollTop : scrollTopHeight}, 100);
		}
	});
	// 다음 요소 ajax 통해 자동 호출
	function loadNext()
	{
		if(isEnd)return false;
		pageR++;
		getPortList();
	}
});