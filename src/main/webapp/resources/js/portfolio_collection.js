$(document).ready(function(){
	var member_id = $('#userId').val();
	var member_name = $('#userNick').val();
	categoryP = $('.active-category').attr('id');
	orderP = 'newest';
	fromP = 'all';
	pageP = 1;
	// 포트폴리오 리스트 초기화
	function initPortList(){
		categoryP = $('.active-category').attr('id');
		pageP = 1;
		$('.portfolio-list').empty();
		getPortList();
	}
	
	// 포트폴리오 리스트 가져오기
	function getPortList(){
		$.ajax({
			data: {'page':pageP, 'category': categoryP, 'order': orderP, 'from': fromP}, 
			url: '/pro/portfolio/getPortList', 
			type: 'post',
			dataType: 'json', 
			cache: false, 
			success: function(portList){
				if(portList == null || portList.length == 0){
					isEnd = true;
					console.log('list의 끝에 도달했음 : '+isEnd);
					if(pageP == 1)
					{
						$('.portfolio-list').append('<div class="no-portfolio">조건에 해당하는 포트폴리오가 없습니다.</div>');
					}
					return;
				}
				$.each(portList, function(){
					if(this.PORT_SHOW == 1) return true;
					var output = '';
					output += '<div class="portfolio-list-item clickable" id="portfolio_'+this.PORT_ID+'" style="display:none;">';
					output += 	'<input type="hidden" class="hidden_PORT_ID" value="'+this.PORT_ID+'">';
					output += 	'<input type="hidden" class="hidden_PORT_WRITER_ID" value="'+this.MEMBER_ID+'">';
					output +=	'<div class="img-wrapper">';
					output +=		'<div class="port-scrap-area">';
					if(this.PORT_SCRAP == 0)
						output +=		'<img src="/pro/resources/Image/icon/Scrap_unclicked_icon.svg">';
					else if(this.PORT_SCRAP == 1)
						output +=		'<img src="/pro/resources/Image/icon/Scrap_clicked_icon.svg">';
					output +=		'</div>';
					if(this.PORT_FEED_NEED == 0){
						output += 	'<div class="port-fini-area">';
						output += 		'<img src="/pro/resources/Image/icon/Fini_icon.svg">';
						output += 	'</div>';
					}
					output +=	'</div>';
					output +=	'<div class="info">';
					output +=		'<div class="info-detail">';
					output +=			'<div class="title">'+this.PORT_SUBJECT+'</div>';
					output +=			'<div class="user-profile">';
					output +=				'<img class="pic icon-round" src="/pro/resources/'+this.PORT_WRITER_IMG+'">';
					output +=				'<input type="hidden" class="user-id-hidden" value="'+this.MEMBER_ID+'">';
					output +=				'<input type="hidden" class="user-nick-hidden" value="'+this.PORT_WRITER+'">';
					output +=				this.PORT_WRITER;
					output +=			'</div>';
					output +=		'</div>';
					output +=	'</div>';
					output +=	'<div class="bottom">';
					output +=		'<table class="social-info">';
					output +=			'<tbody>';
					output +=				'<tr>';
					output +=					'<td class="view-cnt">';
					output +=						'<img class="view-icon" src="../resources/Image/icon/view-gray.png">';
					output +=						'<span class="view-count">'+this.PORT_READCOUNT+'</span>';
					output +=						'<input type="hidden" class="view-cnt-hidden" value="'+this.PORT_READCOUNT+'">';
					output +=					'</td>';
					output +=					'<td class="like-cnt">';
					output +=						'<img class="like-icon" src="../resources/Image/icon/like-gray.png">';
					output +=						'<span class="like-count">'+this.PORT_LIKECOUNT+'</span>';
					output +=						'<input type="hidden" class="like-cnt-hidden" value="'+this.PORT_LIKECOUNT+'">';
					output +=					'</td>';
					output +=					'<td class="comment-cnt">';
					output +=						'<img class="comment-icon" src="../resources/Image/icon/comment-gray.png">';
					output +=						'<span class="comment-count">'+this.PORT_FEEDCOUNT+'</span>';
					output +=						'<input type="hidden" class="comment-cnt-hidden" value="'+this.PORT_FEEDCOUNT+'">';
					output +=					'</td>';
					output +=				'</tr>';
					output +=			'</tbody>';
					output +=		'</table>';
					output +=	'</div>';
					output += '</div>';
					$('.portfolio-list').append(output);
					$('#portfolio_' + this.PORT_ID).children('.img-wrapper').css({'background-image' : 'url(/pro/resources/'+this.PORT_THUMBNAIL+')'});
					$('#portfolio_' + this.PORT_ID).fadeIn(400);
				})
				generalFunctions();
			}, 
			error:function(){
				errorAlert('포트폴리오 목록을 가져오는 과정에');
			}
		});
	}
	// 전체 클릭시
	$('#cateAll').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#cateAll').addClass('active-category');
		initPortList();
	});
	// 피드백 클릭시
	$('#feedNeedOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#feedNeedOnly').addClass('active-category');
		initPortList();
	});
	// 추천 클릭시
	$('#recomOnly').click(function(){
		$('.category-list-item').removeClass('active-category');
		$('#recomOnly').addClass('active-category');
		initPortList();
	});
	// 스크랩 클릭시
	$('#scrapOnly').click(function(){
		if(!askLogin(member_id))return;
		$('.category-list-item').removeClass('active-category');
		$('#scrapOnly').addClass('active-category');
		initPortList();
	});
	// dropdown toggle button 클릭 시
	$('.dropdown-menu').children('button').click(function(){
		// 선택한 메뉴로 버튼 텍스트 변경
		$(this).parent().parent().children('.btn').text($(this).text());
		// orderBtn 클릭시
		if($(this).hasClass('orderBtn'))
		{
			var btnText = $(this).text();
			if(btnText == '최신순')
				orderP = 'newest';
			else if(btnText == '추천순')
				orderP = 'noted';
			else if(btnText == '조회순')
				orderP = 'viewed';
			else if(btnText == '피드백순')
				orderP = 'comment';
			initPortList();
			// console.log(orderP);
		}
		// fromBtn 클릭시
		else if($(this).hasClass('fromBtn'))
		{
			var btnText = $(this).text();
			if(btnText == '전체기간')
				fromP = 'all';
			else if(btnText == '최근 24시간')
				fromP = 'day';
			else if(btnText == '최근 1주일')
				fromP = 'week';
			else if(btnText == '최근 1달')
				fromP = 'month';
			else if(btnText == '최근 3달')
				fromP = 'month3';
			initPortList();
			// console.log(fromP);
		}	
	});
	// 리스트 초기화시 기본 기능 활성화
	generalFunctions();
	function generalFunctions(){
		// portfolio scrap 호버시
		$('.port-scrap-area').off('mouseenter');
		$('.port-scrap-area').off('mouseleave');
		$('.port-scrap-area').hover(function(){
			$(this).parent().parent().removeClass('clickable');
		}, function(){
			$(this).parent().parent().addClass('clickable');
		});

		// portfolio scrap 클릭시
		$('.port-scrap-area').off('click');
		$('.port-scrap-area').click(function(e){
			e.stopPropagation();
			if(!askLogin(member_id))return;
			var port_writer_id = $(this).parent().parent().children('.hidden_PORT_WRITER_ID').val();
			member_id = $('#userId').val();
			if(member_id == port_writer_id){
				notAllowed('포트폴리오를 스크랩');
				return;
			}
			var port_id = Number($(this).parent().parent().children('.hidden_PORT_ID').val());
			// console.log(port_id);
			$.ajax({
				data: {'PORT_ID' : port_id, 'MEMBER_ID' : member_id}, 
				type: 'POST', 
				url: 'port_scrap', 
				cache: false, 
				success: function(rd){
					// console.log(rd);
				}, 
				error:function(){
					errorAlert('포트폴리오 스크랩을 하는 과정에');
				}
			});
			// 스크랩이 되어 있을 경우
			if($(this).children('img').attr('src') == '/pro/resources/Image/icon/Scrap_clicked_icon.svg')
			{
				$(this).children('img').attr('src', '/pro/resources/Image/icon/Scrap_unclicked_icon.svg');
			}
			// 스크랩이 안되어 있을 경우
			else
			{
				$(this).children('img').attr('src', '/pro/resources/Image/icon/Scrap_clicked_icon.svg');
			}
		});
		
		// .user-profile 클릭 시 profile 이동여부 alert
		$('.user-profile').off('mouseenter');
		$('.user-profile').off('mouseleave');
		$('.user-profile').hover(function(){
			$(this).parent().parent().parent().removeClass('clickable');
		}, function(){
			$(this).parent().parent().parent().addClass('clickable');
		})
		$('.user-profile').off('click');
		$('.user-profile').click(function(e){
			e.stopPropagation();
			var writerNick = $(this).children('.user-nick-hidden').val();
			var writerId = $(this).children('.user-id-hidden').val();
			$('#alert-wrap').fadeIn(200, function(){
				$('#alert-wrap .profile-alert').css('display', 'block');
				$('#alert-wrap .profile-nick').text(writerNick);
				$('#alert-wrap .alert-box').fadeIn();
				$('#alert-wrap .goBtn').on('click', function(){
					location.href = '/pro/profile?idch='+writerId;
				});
				$('#alert-wrap .cancelBtn').on('click', function(){
					$('#alert-wrap .alert-box').fadeOut(200, function(){
						$('#alert-wrap').fadeOut();
						$('#alert-wrap .profile-alert').css('display', 'none');
						$('#alert-wrap .goBtn').off('click');
						$('#alert-wrap .cancelBtn').off('click');
					});
				})
			})
		})
	}
	
	// Top 버튼 클릭 시 맨 위로 스크롤
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
	// 스크롤 내릴 시 자동으로 ajax 를 통해 다음 요소를 생성
	function loadNext()
	{
		console.log('loadNext() : '+isEnd);
		if(isEnd)return false;
		pageP++;
		getPortList();
	}
});