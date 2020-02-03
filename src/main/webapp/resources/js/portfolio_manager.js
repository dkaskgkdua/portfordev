// 포트폴리오 관리페이지 오픈
function openPortManager(){
	if(!askLogin(member_id))return;
		// getMyPortList();
	$('#my-portfolio-list').css('display', 'none');
	$('#write-portfolio').css('display', 'none');
	$('#portfolio-manager').stop().fadeIn(400, function(){
		$('.loading-myList').stop().fadeIn(400, getMyPortList);
	});
	$('body').addClass('not-scroll').on('scroll touchmove mousewheel', function(e){
        e.preventDefault();
    });
}
// 포트폴리오 관리페이지 종료
function closePortManager(){
	$('body').removeClass('not-scroll').off('scroll touchmove mousewheel');
	$('#portfolio-manager').stop().fadeOut(400);
	portManagerFucntionOff();
}
// My 포트폴리오 리스트 가져오기
function getMyPortList(){
	$.ajax({
		type: 'POST', 
		url: '/pro/portfolio/manage',
		async: false,
		dataType: 'json', 
		cache: false, 
		success: function(my_ports){
			$('.my-portfolio-list').empty();
			if(my_ports == null || my_ports.length == 0){
				$('.my-portfolio-list').append('<div class="no-portfolio-item">아직 등록된 포트폴리오가 없습니다.</div>');
				$('.loading-myList').stop().fadeOut(400, function(){
					$('#my-portfolio-list').stop().fadeIn();
					$('#write-portfolio').stop().fadeIn();
				});
				return;
			}
			$.each(my_ports, function(){
				var output = '';
				output +=	'<div class="my-portfolio-item" id="myPort'+this.PORT_ID+'">';
				output +=		'<input type="hidden" class="hidden_PORT_ID" value="'+this.PORT_ID+'">';
				output +=		'<div class="mp-img-wrapper" style="background-image:url(/pro/resources/upload/'+this.PORT_THUMBNAIL+'"></div>';
				output +=		'<div class="mp-info-wrapper">';
				output +=			'<span class="mp-info-subject">'+this.PORT_SUBJECT+'</span>';
				output +=			'<img class="mp-icon" src="/pro/resources/Image/icon/view-gray.png">';
				output +=			'<span class="mp-info-view mp-count">'+this.PORT_READCOUNT+'</span>';
				output +=			'<img class="mp-icon" src="/pro/resources/Image/icon/like-gray.png">';
				output +=			'<span class="mp-info-like mp-count">'+this.PORT_LIKECOUNT+'</span>';
				if(this.PORT_FEED_NEED == 0){
					output +=	 	'<img class="mp-icon" src="/pro/resources/Image/icon/comment-gray.png">';
					output +=		'<span class="mp-info-feed mp-count">'+this.PORT_FEEDCOUNT+'</span>';
				}
				output +=			'<div class="mp-controller">';
				output +=				'<form class="port-update-form" action="/pro/portfolio/update">';
				output +=					'<input type="hidden" class="MEMBER_ID" name="MEMBER_ID" value="'+this.MEMBER_ID+'">';
				output +=					'<input type="hidden" class="PORT_ID" name="PORT_ID" value="'+this.PORT_ID+'">';
				output +=					'<button type="submit" class="modify-portfolio">수정 하기</button>';
				output +=				'</form>';
				output +=				'<form class="port-delete-form" action="/pro/portfolio/delete" method="post">';
				output +=					'<input type="hidden" class="MEMBER_ID" name="MEMBER_ID" value="'+this.MEMBER_ID+'">';
				output +=					'<input type="hidden" class="PORT_ID" name="PORT_ID" value="'+this.PORT_ID+'">';
				output +=					'<button type="submit" class="delete-portfolio">삭제 하기</button>';
				output +=				'</form>';
				output +=			'</div>';
				output +=		'</div>';
				output +=	'</div>';
				$('.my-portfolio-list').append(output);
			});
			portManagerFunctionOn();
		},
		error: function(){
			errorAlert('마이 포트폴리오를 불러오는 과정에');
		}
	});
}
// 포트폴리오 관리 페이지의 전반적인 기능 들
function portManagerFunctionOn(){
	$('.loading-myList').stop().fadeOut(400, function(){
		$('#my-portfolio-list').stop().fadeIn();
		$('#write-portfolio').stop().fadeIn();
	});
	$('.port-update-form').on('submit', function(){
		alert('수정시도');
		return false;
	});
	$('.port-delete-form').on('submit', function(){
		var member_id = $(this).children('.MEMBER_ID').val();
		var port_id = $(this).children('.PORT_ID').val();
		portDeleteConfirm(member_id, port_id);
		return false;
	});
}
// 포트폴리오 관리페이지 기능 제거
function portManagerFunctionOff(){
	$('.port-update-form').off('submit');
	$('.port-delete-form').off('submit');
}
// 포트폴리오 호버 시
function portItemHover(){
	$('#my-portfolio-list').on('mouseenter', '.my-portfolio-item', function(){
		$(this).children('.mp-info-wrapper').stop().fadeIn(function(){
			$(this).css('opacity', '1');
		});
	});
	$('#my-portfolio-list').on('mouseleave', '.my-portfolio-item', function(){
		$(this).children('.mp-info-wrapper').stop().fadeOut();
	});
}
// 포트폴리오 클릭 시
function portItemClick(){
	$('#my-portfolio-list').on('click', '.my-portfolio-item', function(){
		$('.mp-info-wrapper').stop().fadeOut();
		$(this).children('.mp-info-wrapper').stop().fadeIn();
	});
}
// 모든 jsp, js, css load 된 후
$(window).load(function(){
	// 어떤 버튼이든 my_port class 를 가지고 있을경우 모달 오픈 가능
	$('.my_port').click(openPortManager);
	// 포트폴리오 관리 페이지 종료
	$('#portfolio-manager').on('click', closePortManager);
	// 컨텐트 클릭 시 종료 방지
	$('#portfolio-manager-container').click(function(e){
		e.stopPropagation();
	});
	// 포트폴리오에 호버 혹은 클릭 이벤트 부여
	if($(window).width() >= 750)
		portItemHover();
	else
		portItemClick();
	// 윈도우 크기 조절 시 이벤트 재부여
	$(window).resize(function(){
		$('.my-portfolio-list').off('mouseleave');
		$('.my-portfolio-list').off('mouseenter');
		$('.my-portfolio-list').off('click');
		if($(window).width() >= 750)
			portItemHover();
		else
			portItemClick();
	});
});