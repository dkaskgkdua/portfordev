$(document).ready(function(){
	member_id = $('#userId').val();
	var member_name = $('#userNick').val();
	// 포트폴리오 상세 출력
	// portfolio collection page
	$('.portfolio-list').on('click', '.portfolio-list-item', function(){
		var port_id = Number($(this).children('.hidden_PORT_ID').val());
		getDetail(port_id);
		getFeedbacks(port_id);
		getBestFeedback(port_id);
		showDetail();
		generalDetailFunctionOn();
	});
	// main page
	$('.best-portfolio-list').on('click', '.best-portfolio-item', function(){
		var port_id = Number($(this).children('.hidden_PORT_ID').val());
		getDetail(port_id);
		getFeedbacks(port_id);
		getBestFeedback(port_id);
		showDetail();
		generalDetailFunctionOn();
	});
	// search page
	$('.search_ul').on('click', '.PORT_SUBJECT', function(){
		var port_id = Number($(this).parent().children('.hidden_PORT_ID').val());
		getDetail(port_id);
		getFeedbacks(port_id);
		getBestFeedback(port_id);
		showDetail();
		generalDetailFunctionOn();
		return false;
	});
	// exit 버튼 클릭 시 모달 종료
	$('.exit-detail').click(function(){
		closeDetail();
	});
	// 회색부분 클릭 시 모달 종료
	$('#portfolioModalContainer').click(function(){
		closeDetail();
	});
	// section 클릭 시 모달 종료 방지
	$('#portfolioModalContainer>section').click(function(e){
		e.stopPropagation();
	});
	// 포트폴리오 아이디를 통한 포트폴리오 정보 ajax로 가져오기
	function getDetail(PORT_ID){
		$.ajax({
			data:{'PORT_ID':PORT_ID}, 
			type: 'POST', 
			dataType: 'json', 
			url: '/pro/portfolio/port_detail', 
			cache: false, 
			success: function(port){
				if(port == null){
					askRefresh();
					return;
				}
				if(port.PORT_SHOW == 1){
					if(member_id != port.MEMBER_ID)
					{
						askRefresh();
						return;
					}
				}
				// 포트폴리오 아이디 hidden
				$('#detail_port_id').val(port.PORT_ID);
				// 포트폴리오 작성자 아이디 hidden
				$('#writer_port_id').val(port.MEMBER_ID);
				// 포트폴리오 제목
				$('.port-pdf-subject').text(port.PORT_SUBJECT);
				// 포트폴리오 조회수
				$('.port-read-cnt').text(port.PORT_READCOUNT);
				// 포트폴리오 추천 수
				$('.port-recom-cnt').text(port.PORT_LIKECOUNT);
				// 포트폴리오 피드백 수
				$('.port-feed-cnt').text(port.PORT_FEEDCOUNT);
				// 포트폴리오 등록일 
				$('.port-pdf-regidate').text(port.PORT_WRITTEN);
				// 포트폴리오 이미지, 확대 이미지
				var portImgs = port.PORT_IMG_FILES.split('/');
				$('.port-pdf-imglist').empty();
				$('.port-slide-list').empty();
				if(port.PORT_IMG_FILES == '')
				{
					var imgItem =	'<div class="port-pdf-imgitem">';
					imgItem +=			'<img class="imgitem-img" src="/pro/resources/Image/no_img.png">';
					imgItem +=		'</div>';
					$('.port-pdf-imglist').append(imgItem);
					var slideItem =	'<div class="port-slide-item">';
					slideItem +=		'<img class="slideitem-img" src="/pro/resources/Image/no_img.png" style="position:absolute;left:0;right:0;">';
					slideItem += 	'</div>';
					$('.port-slide-list').append(slideItem);
				}
				else{
					$.each(portImgs, function(){
						var imgItem =	'<div class="port-pdf-imgitem">';
						imgItem +=			'<img class="imgitem-img" src="/pro/resources/upload/'+port.PORT_FILE_PATH+this+'">';
						imgItem +=		'</div>';
						$('.port-pdf-imglist').append(imgItem);
						var slideItem =	'<div class="port-slide-item">';
						slideItem +=		'<img class="slideitem-img" src="/pro/resources/upload/'+port.PORT_FILE_PATH+this+'">';
						slideItem += 	'</div>';
						$('.port-slide-list').append(slideItem);
					});	
					doSlick();
				}
				$('.port-slide-list').html();
				// 포트폴리오 작성자 닉네임
				$('.port-pdf-writer').text(port.PORT_WRITER);
				// 포트폴리오 제목
				$('.detail-summary-subject').text(port.PORT_SUBJECT);
				// 포트폴리오 등록일
				$('.detail-summary-regidate').text(port.PORT_WRITTEN);
				// 포트폴리오 추천, 스크랩 버튼
				if(port.PORT_RECOM == 0){
					$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-off.png');
					$('.icon-tail-fit>.recom-tail').text('추천 하기');
				}
				else if(port.PORT_RECOM == 1){
					$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-on.png');
					$('.icon-tail-fit>.recom-tail').text('추천 취소');
				}
				if(port.PORT_SCRAP == 0){
					$('.scrap-icon').attr('src', '/pro/resources/Image/icon/scrap-off.png');
					$('.icon-tail-fit>.scrap-tail').text('스크랩 하기');
				}
				else if(port.PORT_SCRAP == 1){
					$('.scrap-icon').attr('src', '/pro/resources/Image/icon/scrap-on.png');
					$('.icon-tail-fit>.scrap-tail').text('스크랩 취소');
				}
				// 포트폴리오 작성자 이미지 변경
				$('.port-writer-img-wrapper').css({'background-image' : 'url(/pro/resources/upload/'+port.PORT_WRITER_IMG+')'})
				// 포트폴리오 작성자 닉네임
				$('.portfolio-info-writer-nick').text(port.PORT_WRITER);
				// 포트폴리오 작성자 직업
				$('.portfolio-info-writer-job').text(port.PORT_WRITER_JOB);
				// 포트폴리오 제목
				$('.port-summary-title').text(port.PORT_SUBJECT);
				// 포트폴리오 team 개인: 0, 팀: 1 
				if(port.PORT_TEAM == 0)
					$('.port-summary-team').text('개인');
				else if(port.PORT_TEAM == 1)
					$('.port-summary-team').text('팀');
				// 프로젝트 시작 날짜
				$('.port-summary-startday').text(port.PORT_START);
				// 프로젝트 종료 날짜
				$('.port-summary-endday').text(port.PORT_END);
				// 포트폴리오 상세 설명
				$('.port-description-content').text(port.PORT_CONTENT);
				// 포트폴리오 깃 주소
				if(port.PORT_GITHUB == null || port.PORT_GITHUB == '')
					$('.port-github-img').css('visibility', 'hidden');
				else{
					$('.port-github-href').val(port.PORT_GITHUB);
					$('.port-github-img').css('visibility', 'visible');
				}
				// 포트폴리오 사이트 주소
				if(port.PORT_SITE == null || port.PORT_SITE == '')
					$('.port-site-img').css('visibility', 'hidden');
				else{
					$('.port-site-href').val(port.PORT_SITE);
					$('.port-site-img').css('visibility', 'visible');
				}
				if(port.PORT_GIETHUB == null && port.PORT_SITE == null)
					$('.portfolio-info-site').css('display', 'none');
				else
					$('.portfolio-info-site').css('display', 'block');
				// 피드백 수
				$('.portfolio-feedback-cnt').text(port.PORT_FEEDCOUNT);
				if(port.PORT_FEED_NEED == 0)
				{
					$('#feed-icon-tail').removeClass('never-show');
					$('#write-icon-tail').removeClass('never-show');
					$('#portfolio-feedback-wrap').removeClass('no-feed-need');
					$('.portfolio-no-feed-need').css('display', 'none');
					$('.portfolio-feedback-list').css('display', 'block');
					$('#feedPick').css('display', 'inline-block');
					$('#feedOrder').css('display', 'inline-block');
					$('.port-feed-head').text('Feedback');
					$('.port-feed-head2').css('visibility', 'visible');
				}
				else if(port.PORT_FEED_NEED == 1)
				{
					$('#feed-icon-tail').addClass('never-show');
					$('#write-icon-tail').addClass('never-show');
					$('#portfolio-feedback-wrap').addClass('no-feed-need');
					$('.portfolio-no-feed-need').css('display', 'block');
					$('.portfolio-feedback-list').css('display', 'none');
					$('#feedPick').css('display', 'none');
					$('#feedOrder').css('display', 'none');
					$('.port-feed-head').text('Feedback not Needed');
					$('.port-feed-head2').css('visibility', 'hidden');
				}
			}, 
			error: function(){
				errorAlert('포트폴리오 상세페이지를 확인하며');
			}
		});
	}
	feedPick = 'allFeed';
	feedOrder = 'latest';
	// 포트폴리오 id 를 통한 피드백 정보 ajax로 가져오기
	// 피드백 리스트 가져오기
	function getFeedbacks(PORT_ID){
		$.ajax({
			data:{'PORT_ID': PORT_ID, 'feedPick': feedPick, 'feedOrder': feedOrder}, 
			type: 'POST', 
			dataType: 'json', 
			async: false, 
			url: '/pro/portfolio/getFeedbacks', 
			cache: false, 
			success: function(feedbacks){
				$('.portfolio-feedback-list').empty();
				if(feedbacks.length == 0)
				{
					if(feedPick == 'allFeed')
						$('.portfolio-feedback-list').append('<div class="no-feedback-item">아직 등록된 피드백이 없습니다.</div>');
					else
						$('.portfolio-feedback-list').append('<div class="no-feedback-item">아직 베스트 피드백이 없습니다.</div>');
					$('.no-feedback-item').css('display', 'block');
					return;
				}
				$('.no-feedback-item').css('display', 'none');
				$.each(feedbacks, function(){
					var output = '';
					output +=	'<div class="portfolio-feedback-item" id="feedback_'+this.FEEDBACK_ID+'" style="display:none;">';
					output +=		'<input type="hidden" class="FEEDBACK_ID" value="'+this.FEEDBACK_ID+'">';
					output +=		'<input type="hidden" class="FEEDBACK_WRITER" value="'+this.MEMBER_ID+'">';
					output +=		'<div class="feedback-info">';
					output +=			'<div class="feedback-writer-profile">';
					var user_img = '/pro/resources/Image/userdefault.png';
					if(this.FEED_WRITER_IMG != null)
						user_img = this.FEED_WRITER_IMG;
					output +=				'<img class="feedback-writer-img" src="'+user_img+'">';
					output +=				'<span class="feedback-writer-nick">'+this.FEED_WRITER+'</span>';
					output +=				'<img class="activity-score" src="/pro/resources/Image/icon/award.svg">';
					output +=				'<span class="feedback-writer-score">'+this.FEED_WRITER_SCORE+'</span>';
					output +=			'</div>';
					output +=		'</div>';
					output +=		'<div class="feedback-content">';
					output +=			'<div class="feedback-written-date">'+this.FEED_WRITTEN+'</div>';
					output +=			'<div class="feedback-content-text">'+this.FEEDBACK_CONTENT+'</div>';
					output +=		'</div>';
					output +=		'<div class="feedback-controller">';
					output +=			'<div class="feedback-recommend">';
					output +=				'<div class="icon-tail-fit">';
					if(this.FEED_RECOM == 0){
						output +=				'<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-off.png">';
						output +=				'<span class="feed-recom-tail">추천하기</span>';
					}
					else{
						output +=				'<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-on.png">';
						output +=				'<span class="feed-recom-tail">추천취소</span>';
					}
					output +=				'</div>';
					output +=				'<span class="feedback-recommend-cnt">'+this.FEED_LIKECOUNT+'</span>';
					output +=			'</div>';
					if(this.MEMBER_ID == member_id){
						output +=		'<button type="button" class="feedback-delete">삭제</button>';
						output +=		'<button type="button" class="feedback-update">수정</button>';
					}
					output +=		'</div>';
					output +=	'</div>';
					$('.portfolio-feedback-list').append(output);
					$('#feedback_'+this.FEEDBACK_ID).fadeIn(400);
				})
			},
			error: function(){
				errorAlert('피드백 리스트를 가져오는 동안');
			}
		});
	}
	// 베스트 피드백 가져오기
	function getBestFeedback(PORT_ID){
		$.ajax({
			data:{'PORT_ID': PORT_ID}, 
			type: 'POST', 
			dataType: 'json', 
			async: false, 
			url: '/pro/portfolio/getBest3Feedback', 
			cache: false, 
			success: function(feedbacks){
				if(feedbacks.length == 0)
					return;
				$.each(feedbacks, function(){
					var output = '';
					output +=	'<div class="portfolio-feedback-item best-feedback" id="best_feed_'+this.FEEDBACK_ID+'" style="display:none;">';
					output +=		'<input type="hidden" class="FEEDBACK_ID" value="'+this.FEEDBACK_ID+'">';
					output +=		'<input type="hidden" class="FEEDBACK_WRITER" value="'+this.MEMBER_ID+'">';
					output +=		'<div class="feedback-info">';
					output +=			'<span class="best-feedback-span">BEST</span>';
					output +=			'<div class="feedback-writer-profile">';
					var user_img = '/pro/resources/Image/userdefault.png';
					if(this.FEED_WRITER_IMG != null)
						user_img = this.FEED_WRITER_IMG;
					output +=				'<img class="feedback-writer-img" src="'+user_img+'">';
					output +=				'<span class="feedback-writer-nick">'+this.FEED_WRITER+'</span>';
					output +=				'<img class="activity-score" src="/pro/resources/Image/icon/award.svg">';
					output +=				'<span class="feedback-writer-score">'+this.FEED_WRITER_SCORE+'</span>';
					output +=			'</div>';
					output +=		'</div>';
					output +=		'<div class="feedback-content">';
					output +=			'<div class="feedback-written-date">'+this.FEED_WRITTEN+'</div>';
					output +=			'<div class="feedback-content-text">'+this.FEEDBACK_CONTENT+'</div>';
					output +=		'</div>';
					output +=		'<div class="feedback-controller">';
					output +=			'<div class="feedback-recommend">';
					output +=				'<div class="icon-tail-fit">';
					if(this.FEED_RECOM == 0){
						output +=				'<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-off.png">';
						output +=				'<span class="feed-recom-tail">추천하기</span>';
					}
					else{
						output +=				'<img class="feed-recom-icon" src="/pro/resources/Image/icon/recom-on.png">';
						output +=				'<span class="feed-recom-tail">추천취소</span>';
					}
					output +=				'</div>';
					output +=				'<span class="feedback-recommend-cnt">'+this.FEED_LIKECOUNT+'</span>';
					output +=			'</div>';
					if(this.MEMBER_ID == member_id){
						output +=		'<button type="button" class="feedback-delete">삭제</button>';
						output +=		'<button type="button" class="feedback-update">수정</button>';
					}
					output +=		'</div>';
					output +=	'</div>';
					$('.portfolio-feedback-list').prepend(output);	
					$('#best_feed_'+this.FEEDBACK_ID).fadeIn(400);
					$('#feedback_'+this.FEEDBACK_ID).css('display', 'none');
				})			
			},
			error: function(){
				errorAlert('피드백 리스트를 가져오는 동안');
			}
		});
	}
	// 포트폴리오 상세 모달 노출
	function showDetail(){
		$('#portfolioModalContainer').fadeIn();
		$('body').addClass('not-scroll');
		$('#move_top_btn').fadeOut().addClass('never-show');
		$('.port-slide-list').resize();
	}
	function generalDetailFunctionOn(){
		$('.icon-tail-fit').on('click', doActivity);
		$('.feedback-writer-profile').on('click', goProfile);
		$('#feedPick').change(function(){
			feedPick = $('#feedPick').val();
			generalDetailFunctionOff();
			var port_id = $('#detail_port_id').val();
			getFeedbacks(port_id);
			getBestFeedback(port_id);
			generalDetailFunctionOn();
		});
		$('#feedOrder').change(function(){
			feedOrder = $('#feedOrder').val();
			generalDetailFunctionOff();
			var port_id = $('#detail_port_id').val();
			getFeedbacks(port_id);
			getBestFeedback(port_id);
			generalDetailFunctionOn();
		});
		$('.feedback-update').click(function(){
			var feed_id = $(this).parent().parent().children('.FEEDBACK_ID').val();
			feedUpdateConfirm(feed_id);
		});
		$('.feedback-delete').click(function(){
			var feed_id = $(this).parent().parent().children('.FEEDBACK_ID').val();
			feedDeleteConfirm(feed_id);
		});
	}
	function generalDetailFunctionOff(){
		$('.icon-tail-fit').off('click', doActivity);
		$('.feed-writer-profile').off('click', goProfile);
		$('#feedPick').off('change');
		$('#feedOrder').off('change');
		$('.feedback-update').off('click');
		$('.feedback-delete').off('click');
	}
	// 포트폴리오 상세 모달 종료
	function closeDetail(){
		$('#portfolioModalContainer').fadeOut(400, function(){
			if($('.port-slide-list').hasClass('slick-initialized'))
				$('.port-slide-list').slick('unslick');
			$('body').removeClass('not-scroll');
			$('#move_top_btn').removeClass('never-show');
			if($(window).scrollTop() > 500)
			{
				$('#move_top_btn').fadeIn();
			}
			if($('.drag-activity-menu').hasClass('openMenu'))
			{
				$('.drag-activity-menu').trigger('click');
			}
			$('.exit-cover').trigger('click');
		});
		feedPick = 'allFeed';
		$('#feedPick option:eq(0)').prop('selected', true);
		feedOrder = 'latest';
		$('#feedOrder option:eq(0)').prop('selected', true);
		$('.portfolio-feedback-list').scrollTop(0);
		document.getElementsByClassName('portfolio-feedback-list')[0].pageYOffset = 0;
		generalDetailFunctionOff();
	}
	// 포트폴리오 파일 이미지 변환후 slick 출력
	function doSlick()
	{
		$('.port-slide-list').slick({
			  infinite: false,	// 맨끝이미지에서 끝내지 않고 맨앞으로 이동
			  slidesToShow: 1,	// 화면에 보여질 이미지 갯수
			  slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
			  arrows: true,	// 화살표
			  vertical:true,	// 세로방향으로 슬라이드
			  verticalSwiping:true,	// 세로방향 슬라이드 가능
			  swipeToSlide:true, 
			  dots:true,	// 아래 점
			  autoplay: false,	// 자동으로 다음 이미지 보여주기
			  autoplaySpeed:4000,	// 다음 이미지로 넘어갈 시간
			  pauseOnHover:true,	// 마우스 호버시 슬라이드 이동멈춤
			  speed:1000, 			// 다음 이미지로 넘겨질때 걸리는 시간
			  responsive:[
				  {	// 반응형 웹
					  breakpoint:1024,	// 기준화면 사이즈
					  settings:{slidesToShow:1}	// 사이즈에 적용될 설정
				  },
				  {
					  breakpoint:600,
					  settings:{slidesToShow:1}
				  },
				  {
					  breakpoint:500,
					  settings:{slidesToShow:1}
				  }
			  ]
		});
		// 이미지 클릭 시 포트폴리오  확대
		$('.port-slide-item').on('click', function(){
			var index = $(this).index('.port-slide-item');
			var targetI = $('.port-pdf-imgitem').eq(index).position().top;
			console.log(targetI);
			
			$('#portfolio-pdf-enlargement-wrap').on('scroll', function(){
				
			});

			document.getElementById('portfolio-pdf-enlargement-wrap').pageYOffset = targetI;
			$('#portfolio-pdf-enlargement-wrap').animate({scrollTop : targetI}, 100, function(){
				$('#portfolio-pdf-enlargement-wrap').fadeIn();
				$('.exit-modal').stop().fadeOut();
			});
			$('#portfolio-pdf-enlargement-wrap').click(function(e){
				e.stopPropagation();
				$('#portfolio-pdf-enlargement-wrap').fadeOut(400, function(){
					$('#portfolio-pdf-enlargement-wrap').stop().scrollTop(0);
					document.getElementById('portfolio-pdf-enlargement-wrap').pageYOffset = 0;
					$('#portfolio-pdf-enlargement-wrap').off('click');
					$('.exit-modal').stop().fadeIn();
				});				
			});
		});
	}
	// 여러가지 동작을 시행하는 함수
	function doActivity()
	{
		var port_writer_id = $('#writer_port_id').val();
		member_id = $('#userId').val();
		// 추천하기 클릭 시
		if($(this).children('img').hasClass('recom-icon'))
		{
			if(!askLogin(member_id))return;
			if(member_id == port_writer_id){
				notAllowed('포트폴리오를 추천');
				return;
			}
			recommend_portfolio();
		}
		// 스크랩하기 클릭 시
		else if($(this).children('img').hasClass('scrap-icon'))
		{
			if(!askLogin(member_id))return;
			if(member_id == port_writer_id){
				notAllowed('포트폴리오를 스크랩');
				return;
			}
			scrap_portfolio();
		}
		// 작성하기 클릭 시
		else if($(this).children('img').hasClass('write-icon'))
		{
			if(!askLogin(member_id))return;
			feedback_write(member_id, member_name);
		}
		// 피드백 추천 클릭 시
		else if($(this).children('img').hasClass('feed-recom-icon'))
		{
			if(!askLogin(member_id))return;
			var feed_writer_id = $(this).parent().parent().parent().children('.FEEDBACK_WRITER').val();
			if(member_id == feed_writer_id){
				notAllowed('피드백을 추천');
				return;
			}
			var feed_id = $(this).parent().parent().parent().children('.FEEDBACK_ID').val();
			if($(this).children('.feed-recom-tail').text() == '추천하기')
			{
				$(this).children('.feed-recom-icon').attr('src', '/pro/resources/Image/icon/recom-on.png');
				$(this).children('.feed-recom-tail').text('추천취소');
				$(this).parent().children('.feedback-recommend-cnt').text((Number($(this).parent().children('.feedback-recommend-cnt').text()) + 1));
			}
			else
			{
				$(this).children('.feed-recom-icon').attr('src', '/pro/resources/Image/icon/recom-off.png');
				$(this).children('.feed-recom-tail').text('추천하기');
				$(this).parent().children('.feedback-recommend-cnt').text((Number($(this).parent().children('.feedback-recommend-cnt').text()) - 1));
			}
			$.ajax({
				data: {'FEEDBACK_ID' : feed_id, 'MEMBER_ID' : member_id}, 
				type: 'POST', 
				url: '/pro/portfolio/recommendFeedback', 
				cache: false, 
				success: function(rd){
					if(rd != 1)
						errorAlert('피드백 추천 과정에');
				},
				error: function(){
					errorAlert('피드백 추천 과정에');
				}
			});
		}
	}
	
	// 포트폴리오 추천 / 취소
	function recommend_portfolio()
	{
		var port_id = $('#detail_port_id').val();
		$.ajax({
			data: {'PORT_ID' : port_id, 'MEMBER_ID' : member_id}, 
			type: 'POST', 
			url: '/pro/portfolio/port_recommend', 
			cache: false, 
			success: function(rd){
				if(rd != 1)
					errorAlert('포트폴리오 추천을 하는 과정에');
			},
			error: function(){
				errorAlert('포트폴리오 추천을 하는 과정에');
			}
		});
		// 추천이 아직 안되어있을 경우
		if($('.icon-tail-fit>.recom-tail').text() == '추천 하기')
		{
			var recomCnt = Number($('#portfolio-detail-wrap .port-recom-cnt').text()) + 1;
			$('.port-recom-cnt').text(recomCnt);
			$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-on.png');
			$('.icon-tail-fit>.recom-tail').text('추천 취소');
		}
		// 이미 추천을 했을 경우
		else
		{
			var recomCnt = Number($('#portfolio-detail-wrap .port-recom-cnt').text()) - 1;
			$('.port-recom-cnt').text(recomCnt);
			$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-off.png');
			$('.icon-tail-fit>.recom-tail').text('추천 하기');
		}
	}
	// 포트폴리오 스크랩 / 취소
	function scrap_portfolio()
	{
		var port_id = $('#detail_port_id').val();
		$.ajax({
			data: {'PORT_ID' : port_id, 'MEMBER_ID' : member_id}, 
			type: 'POST', 
			url: '/pro/portfolio/port_scrap', 
			cache: false, 
			success: function(rd){
				if(rd != 1)
					errorAlert('포트폴리오  스크랩 하는 과정에');
			},
			error: function(){
				errorAlert('포트폴리오 스크랩 하는 과정에');
			}
		});
		// 스크랩을 아직 안했을 경우
		if($('.icon-tail-fit>.scrap-tail').text() == '스크랩 하기')
		{
			$('.icon-tail-fit>.scrap-icon').attr('src', '/pro/resources/Image/icon/scrap-on.png');
			$('.icon-tail-fit>.scrap-tail').text('스크랩 취소');
		}
		// 스크랩을 이미 했을 경우
		else
		{
			$('.icon-tail-fit>.scrap-icon').attr('src', '/pro/resources/Image/icon/scrap-off.png');
			$('.icon-tail-fit>.scrap-tail').text('스크랩 하기');
		}
	}
	$('.feed-write-cancel').click(feedback_write);
	var feedWriterImg = function getFeedWriterImg(mid){
		var fwimg = '/pro/resources/Image/userdefault.png';
		$.ajax({
			type: 'POST', 
			url: '/pro/portfolio/getProfileImg', 
			data: {'MEMBER_ID': mid}, 
			async: false, 
			success: function(fimg){
				fwimg = fimg;
			},
			error:function(){
				errorAlert('작성자 이미지를 불러오는 과정에');
		    }
		});
		return fwimg;
	}
	// 피드백 작성 클릭 시
	function feedback_write(mid, mname)
	{
		if($('#feed-icon-tail').hasClass('showFeed'))
		{
			$('#feed-icon-tail').trigger('click');
		}
		$('.feed-writer-profile-nick').text(mname);
		$('#write-icon-tail').toggleClass('doFeedWrite');
		if($('#write-icon-tail').hasClass('doFeedWrite'))
		{
			$('.feed-writer-profile-img').attr('src', feedWriterImg(mid));
			$('.icon-tail-fit>.write-icon').attr('src', '/pro/resources/Image/icon/feed-write-on.png');
			$('.icon-tail-fit>.write-tail').text('작성 취소');
			$('.portfolio-feedback-list').css('display', 'none');
			$('.portfolio-feedback-header').css('display', 'none');
			$('.feedback-write-container').css('display', 'block');
			$('#FEED_CONTENT').focus();
			if($(window).height() < 740)
			{
				$('#cover-wrap').fadeIn();
				$('.exit-cover').css('bottom', '41%');
				$('#portfolio-feedback-wrap').stop().animate({top: '60%'}, 500, function(){
					$('.exit-cover').fadeIn();
				});
			}
		}
		else
		{
			$('.icon-tail-fit>.write-icon').attr('src', '/pro/resources/Image/icon/feed-write-off.png');
			$('.icon-tail-fit>.write-tail').text('피드백 작성');
			$('#FEED_CONTENT').val('');
			if($(window).height() < 740)
			{
				$('.exit-cover').fadeOut(250);
				$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
					$('.portfolio-feedback-list').css('display', 'block');
					$('.portfolio-feedback-header').css('display', 'block');
					$('.feedback-write-container').css('display', 'none');
					$('#cover-wrap').fadeOut();
				});
			}
			else
			{
				$('.portfolio-feedback-list').css('display', 'block');
				$('.portfolio-feedback-header').css('display', 'block');
				$('.feedback-write-container').css('display', 'none');
			}
		}
	}
	$('.feed-write-done').click(feedback_write_done);
	// 작성완료 버튼 클릭 시
	function feedback_write_done(){
		generalDetailFunctionOff();
		var port_id = $('#detail_port_id').val();
		var feed_content = $('#FEED_CONTENT').val();
		if(feed_content == null || feed_content ==''){
			$('#FEED_CONTENT').focus();
			feedContentNeedAlert();
			return
		}
		$.ajax({
			data: {'PORT_ID' : port_id, 'MEMBER_ID' : member_id, 'FEEDBACK_CONTENT' : feed_content}, 
			type: 'POST', 
			url: '/pro/portfolio/writeFeedback',
			async: false, 
			cache: false, 
			success: function(rd){
				if(rd != 1)
					errorAlert('피드백 작성 하는 중');
				else if(rd == 1){
					writeDoneAlert();
					$('.portfolio-feedback-cnt').text((Number($('.portfolio-feedback-cnt').text()) + 1));
				}
			},
			error: function(){
				errorAlert('피드백 작성 하는 중');
			}
		});
		getFeedbacks(port_id)
		getBestFeedback(port_id);
		generalDetailFunctionOn();
	}
	// 피드백 수정 완료 클릭 시
	$('.feed-update-done').click(feedUpdateDone);
	function feedUpdateDone(){
		generalDetailFunctionOff();
		var port_id = $('#detail_port_id').val();
		var feed_id = $('#update-feedback-id').val();
		var feed_content = $('#FEED_UPDATE_CONTENT').val();
		member_id = $('#userId').val();
		if(feed_content == null || feed_content ==''){
			$('#FEED_UPDATE_CONTENT').focus();
			feedContentNeedAlert();
			return;
		}
		$.ajax({
			data: {'FEEDBACK_ID': feed_id, 'PORT_ID' : port_id, 'MEMBER_ID' : member_id, 'FEEDBACK_CONTENT' : feed_content}, 
			type: 'POST', 
			url: '/pro/portfolio/updateProcessFeedback',
			async: false, 
			cache: false, 
			success: function(rd){
				if(rd != 1)
					errorAlert('피드백 수정 하는 중');
				else if(rd == 1){
					updateDoneAlert();
				}
			},
			error: function(){
				errorAlert('피드백 수정 하는 중');
			}
		});
		getFeedbacks(port_id)
		getBestFeedback(port_id);
		generalDetailFunctionOn();
	}
	// 피드백 수정 취소 클릭 시
	$('.feed-update-cancel').click(feedUpdateCancel);
	function feedUpdateCancel(){
		$('#FEED_UPDATE_CONTENT').val('');
		$('.feedback-update-container').removeClass('updating');
		if($(window).height() < 740)
		{
			$('.exit-cover').fadeOut(250);
			$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
				$('#cover-wrap').fadeOut();
			});
		}
		$('.portfolio-feedback-list').css('display', 'block');
		$('.portfolio-feedback-header').css('display', 'block');
		$('.feedback-update-container').css('display', 'none');
	}
	// 포트폴리오 콘솔 > 클릭 시
	$('.drag-activity-menu').click(openActivityMenu);
	function openActivityMenu()
	{
		$(this).toggleClass('openMenu');
	    if($(this).hasClass('openMenu'))
	    {
	    	$('.portfolio-detail-activity').css('border', '1px solid darkgrey');
	    	$(this).children('img').attr('src', '/pro/resources/Image/left.png').css('margin-left','-10px');
	    	$(this).stop().animate({left: '120px'}, {duration:400,queue:false});
	    	$('.portfolio-detail-activity').stop().animate({left: '0px'}, {duration:400,queue:false});
	    }
	    else
	    {
	    	$('.portfolio-detail-activity').css('border', '0');
	    	$(this).children('img').attr('src', '/pro/resources/Image/right.png').css('margin-left','0px');
	    	$(this).stop().animate({left: '0px'}, {duration:400,queue:false});
	    	$('.portfolio-detail-activity').stop().animate({left: '-120px'}, {duration:400,queue:false});
	    	
	    }
	}
	
	// portfolio-info-section
	// 프로필 클릭 시
	$('.portfolio-info-writer').click(goProfile);
	function goProfile()
	{
		var writerNick = '';
		var writerId = '';
		if($(this).hasClass('portfolio-info-writer')){
			writerNick = $('.portfolio-info-writer-nick').text();
			writerId = $('#writer_port_id').val();
		}
		else if($(this).hasClass('feedback-writer-profile')){
			writerNick = $(this).children('.feedback-writer-nick').text();
			writerId = $(this).parent().parent().children('.FEEDBACK_WRITER').val();
		}
		else
			return;
		$('#alert-wrap').stop().fadeIn(200, function(){
			$(this).css('opacity', '1');
			$('#alert-wrap .profile-alert').css('display', 'block');
			$('#alert-wrap .profile-nick').text(writerNick);
			$('#alert-wrap .alert-box').stop().fadeIn();
			$('#alert-wrap .goBtn').on('click', function(){
				location.href = '/pro/profile?idch='+writerId;
			});
			$(window).keydown(function(key) {
				if (key.keyCode == 13) {
					$('.goBtn').trigger('click');
					$(window).off('keydown');
			    }
			});
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .profile-alert').css('display', 'none');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					$(window).off('keydown');
				});
			})
		})
	}
	// GitHub 방문하기 클릭시
	$('.port-github-img').click(function(e){
		e.stopPropagation();
		var github = $('.port-github-href').val();
		$('#alert-wrap').stop().fadeIn(200);
		$('#alert-wrap .site-alert').css('display', 'block');
		$('#alert-wrap .site-url').text(github);
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.href = github;
		})
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .site-alert').css('display', 'none');
				$('#alert-wrap .site-url').text('');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
			});
		})
	});
	// 사이트 방문하기 클릭 시
	$('.port-site-img').click(function(e){
		e.stopPropagation();
		var site = $('.port-site-href').val();
		$('#alert-wrap').stop().fadeIn(200, function(){
			$(this).css('opacity', '1');
			$('#alert-wrap .site-alert').css('display', 'block');
			$('#alert-wrap .site-url').text(site);
			$('#alert-wrap .alert-box').stop().fadeIn();
			$('#alert-wrap .goBtn').on('click', function(){
				location.href = site;
			})
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .site-alert').css('display', 'none');
					$('#alert-wrap .site-url').text('');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
				});
			})
		});
	});

	// portfolio-info-section show/hide
	// 정보 보기 / 그만 보기 클릭 시
	$('#info-icon-tail').click(info_show_hide);
	function info_show_hide()
	{
		$('#info-icon-tail').toggleClass('showInfo');
		if($('#info-icon-tail').hasClass('showInfo'))
		{
			$('#info-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/info-show-on.png');
			$('#info-icon-tail').children('span').text('그만 보기');
			if($(window).width() > 640){
				$('.drag-activity-menu').trigger('click');
				$('#cover-wrap').stop().fadeIn();
				$('.exit-cover2').css('left','25%');
				$('#portfolio-info-wrap').stop().animate({left: '40%'}, 500, function(){
					$('.exit-cover2').fadeIn();
				});
			}
			else{
				$('.drag-activity-menu').trigger('click');
				$('#cover-wrap').stop().fadeIn();
				$('.exit-cover2').css('left','12%');
				$('#portfolio-info-wrap').stop().animate({left: '25%'}, 500, function(){
					$('.exit-cover2').fadeIn();
				});
			}
		}
		else
		{
			
			$('.exit-cover2').stop().fadeOut(250);
			$('#info-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/info-show-off.png');
			$('#info-icon-tail').children('span').text('정보 보기');
			$('#portfolio-info-wrap').stop().animate({left: '100%'}, 500, function(){
				$('#portfolio-info-wrap').scrollTop(0);
				document.getElementById('portfolio-info-wrap').pageYOffset = 0;
				$('#cover-wrap').stop().fadeOut();
			});
		}
	}
	// portfolio-feeback-section show/hide
	// 피드백 보기 / 그만 보기 클릭 시
	$('#feed-icon-tail').click(feed_show_hide);
	function feed_show_hide()
	{
		if($('#write-icon-tail').hasClass('doFeedWrite'))
		{
			$('#write-icon-tail').trigger('click');
		}
		$('#feed-icon-tail').toggleClass('showFeed');
		if($('#feed-icon-tail').hasClass('showFeed'))
		{
			$('.portfolio-feedback-list').css('display', 'block');
			$('.portfolio-feedback-header').css('display', 'block');
			$('.feedback-write-container').css('display', 'none');
			$('#feed-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/feed-show-on.png');
			$('#feed-icon-tail').children('span').text('그만 보기');
			$('#cover-wrap').stop().fadeIn();
			$('.exit-cover').css('bottom','81%');
			$('#portfolio-feedback-wrap').stop().animate({top: '20%'}, 500,function(){
				$('.exit-cover').fadeIn();
			});
		}
		else
		{
			$('.exit-cover').stop().fadeOut(250);
			$('#feed-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/feed-show-off.png');
			$('#feed-icon-tail').children('span').text('피드백 보기');
			$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
				$('.portfolio-feedback-list').scrollTop(0);
				document.getElementsByClassName('portfolio-feedback-list')[0].pageYOffset = 0;
				$('#cover-wrap').stop().fadeOut();
			});
		}
	}
	$('.exit-cover').click(function(){
		if($('#write-icon-tail').hasClass('doFeedWrite'))
			feedback_write();
		else if($('#feed-icon-tail').hasClass('showFeed'))
			feed_show_hide();
		if($('.feedback-update-container').hasClass('updating'))
			$('.feed-update-cancel').trigger('click');
	});
	$('.exit-cover2').click(function(){
		if($('#info-icon-tail').hasClass('showInfo'))
			info_show_hide();
	});
	
	// 창 크기 조절 할 경우
	$(window).resize(function(){
		if($(window).height() > 740 && $(window).height() < 1300)
		{
			if($(window).width() < 778)
				$('#portfolio-feedback-wrap').css('top', '70%');
			else
				$('#portfolio-feedback-wrap').css('top', '65%');
		}
		else
		{
			if($(window).height() <= 740)
			{
				$('#cover-wrap').css('bottom', '0').css('display', 'none');
				if($('#feed-icon-tail').hasClass('showFeed'))
				{
					$('#portfolio-feedback-wrap').css('top', '100px');
					$('#feed-icon-tail').trigger('click');
				}
				else
				{
					$('#portfolio-feedback-wrap').css('top', '100%');
				}
				if($('#write-icon-tail').hasClass('doFeedWrite'))
				{
					$('#write-icon-tail').trigger('click');
				}
				if($('.feedback-update-container').hasClass('updating'))
					$('.feed-update-cancel').trigger('click');
			}
			else
			{
				$('#portfolio-feedback-wrap').css('top', '845px');
			}
			
		}
		if($(window).width() > 778)
		{
			$('#portfolio-info-wrap').css('left', '70%');
		}
		else
		{
			if($('#info-icon-tail').hasClass('showInfo'))
			{
				if($(window).width() > 640)
					$('#portfolio-info-wrap').css('left', '60%');
				else
					$('#portfolio-info-wrap').css('left', '50%');
				$('#info-icon-tail').trigger('click');
			}
			else
			{
				$('#portfolio-info-wrap').css('left', '100%');
			}
		}
	});
	
	function slickCheck(){
		var slickInfoObj={
			variableWidth:true,  //width 크기가 서로 다르다는 것을 알림.
			dots: false,
			swipe:false,
			cssEase: 'ease-out',
			infinite: true,
			slidesToShow:6, //한 화면에 보여줄 리스트 개수
			slidesToScroll:1
	}
		// 슬릭이 진행중인지 css로 체크
		if( $('.port-slide-list').hasClass('slick-initialized') )
		{
			$('.port-slide-list').slick('unslick');//슬릭해제
		}
		else
		{
			$('.port-slide-list').slick(slickInfoObj);
		}
	}
	// $('.add-remove').slick('slickRemove', null, null, true);
}); // document.ready end

//login need alert
// 로그인이 필요한 동작을 시행 시
function askLogin(mid)
{
	if(mid != '' && mid != null)
	{
		return true;
	}
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .login-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.href = '/pro/login';
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .login-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// missing-alert
// 포트폴리오의 공개여부가 바뀌거나 삭제되었을 시
function askRefresh()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .missing-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.reload();
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .missing-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
				location.reload();
			});
		})
	})
}
// 본인 포트폴리오, 피드백 추천, 스크랩 시 alert
function notAllowed(msg)
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .not-allowed-message').text(msg);
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .not-allowed-alert').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .not-allowed-alert').css('display', 'none');
				$('#alert-wrap .not-allowed-message').text('');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 에러발생 시 alert
function errorAlert(msg)
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .error-message').text(msg);
		$('#alert-wrap .error-alert').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.reload();
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .error-alert').css('display', 'none');
				$('#alert-wrap .error-message').text('');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 작성 완료 alert
function writeDoneAlert()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .write-done-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .write-done-alert').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 수정 확인 alert
function feedUpdateConfirm(fid){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .feed-update-confirm').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn(400, function(){
			$(window).keydown(function(key) {
				if (key.keyCode == 13) {
					$('.goBtn').trigger('click');
					$(window).off('keydown');
			    }
			});
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .feed-update-confirm').css('display', 'none');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					//$('.exit-cover').trigger('click');
					$(window).off('keydown');
				});
			})
			$('#alert-wrap .goBtn').on('click', function(){
				member_id = $('#userId').val();
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap .feed-update-confirm').css('display', 'none');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					$('.exit-cover').trigger('click');
					$(window).off('keydown');
					$('#alert-wrap').stop().fadeOut(400, function(){
						$.ajax({
							data: {'FEEDBACK_ID' : fid, 'MEMBER_ID' : member_id}, 
							type: 'POST',
							dataType: 'json', 
							async: false, 
							url: '/pro/portfolio/updateFeedback', 
							cache: false, 
							success: function(targetFeed){
								if(!targetFeed.FEEDBACK_ID){
									errorAlert('피드백 정보를 가져오는 중');
									return;
								}
								$('.feedback-update-container').addClass('updating');
								$('#update-feedback-id').val(targetFeed.FEEDBACK_ID);
								$('.feed-writer-profile-img').attr('src', targetFeed.FEED_WRITER_IMG);
								$('.feed-writer-profile-nick').text(targetFeed.FEED_WRITER);
								$('#FEED_UPDATE_CONTENT').val(targetFeed.FEEDBACK_CONTENT);
								$('.portfolio-feedback-list').css('display', 'none');
								$('.portfolio-feedback-header').css('display', 'none');
								$('.feedback-update-container').css('display', 'block');
								$('#FEED_UPDATE_CONTENT').focus();
								if($(window).height() < 740)
								{
									$('#cover-wrap').fadeIn();
									$('.exit-cover').css('bottom', '41%');
									$('#portfolio-feedback-wrap').stop().animate({top: '60%'}, 500, function(){
										$('.exit-cover').fadeIn();
									});
								}
							},
							error: function(){
								errorAlert('피드백 정보를 가져오는 중');
							}
						});
					});
				});
			});
		});
	});
}
// 피드백 수정 완료 alert
function updateDoneAlert()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .update-done-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn(function(){
			$('#alert-wrap .goBtn').on('click', function(){
				$('#alert-wrap .cancelBtn').trigger('click');
			});
			$(window).keydown(function(key) {
				if (key.keyCode == 13) {
					$('.goBtn').trigger('click');
					$(window).off('keydown');
			    }
			});
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					if($(window).height() < 740)
					{
						$('.exit-cover').fadeOut(250);
						$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
							$('#cover-wrap').fadeOut();
						});
					}
					$('.portfolio-feedback-list').css('display', 'block');
					$('.portfolio-feedback-header').css('display', 'block');
					$('.feedback-update-container').css('display', 'none');
					$('.feedback-update-container').removeClass('updating');
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .update-done-alert').css('display', 'none');
					$('#alert-wrap .cancelBtn').css('visibility', 'visible');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					//$('.exit-cover').trigger('click');
					$(window).off('keydown');
				});
			});
		});
	});
}
// 피드백 내용이 비었을 경우 alert
function feedContentNeedAlert(){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .content-need-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .content-need-alert').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 삭제 확인 alert
function feedDeleteConfirm(fid){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .feed-delete-confirm').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .feed-delete-confirm').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap .feed-delete-confirm').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
				member_id = $('#userId').val();
				$.ajax({
					data: {'FEEDBACK_ID' : fid, 'MEMBER_ID' : member_id}, 
					type: 'POST',
					async: false, 
					url: '/pro/portfolio/deleteFeedback', 
					cache: false, 
					success: function(dr){
						if(dr == 1)
						{
							$('#feedback_'+fid).remove();
							$('#best_feed_'+fid).remove();
							var feedCNT = (Number($('.portfolio-feedback-cnt').text()) - 1);
							$('.portfolio-feedback-cnt').text(feedCNT);
							if(feedCNT == '0')
							{
								if(feedPick == 'allFeed')
									$('.portfolio-feedback-list').append('<div class="no-feedback-item" style="display:block;">아직 등록된 피드백이 없습니다.</div>');
								else
									$('.portfolio-feedback-list').append('<div class="no-feedback-item" style="display:block;">아직 베스트 피드백이 없습니다.</div>');
							}
						}
						feedDeleteResult(dr);
					},
					error: function(){
						errorAlert('피드백 삭제 과정에');
					}
				});
			});
		});
	})
}
// 피드백 삭제 결과
function feedDeleteResult(result){
	var resultMsg = '';
	if(result == 0){	// 세션만료로 삭제 실패
		resultMsg = '&nbsp;실패<br>지속적인 오류 발생시 관리자에게 문의바랍니다';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	else if(result == 1){	// 삭제 성공
		resultMsg = '&nbsp;성공';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	else if(result == 2){	// 세션만료로 삭제 실패
		resultMsg = '&nbsp;실패<br>세션만료로 재로그인이 필요합니다.<br>로그인 페이지로 이동하시겠습니까?';
	}
	else if(result == 3){	// 삭제 권한이 없음
		resultMsg = '&nbsp;권한이 없습니다.';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .delete-result-message').append(resultMsg);
		$('#alert-wrap .feed-delete-result').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			if(result == 0){
				$('#alert-wrap .cancelBtn').trigger('click');
			}
			else if(result == 1){
				$('#alert-wrap .cancelBtn').trigger('click');
			}
			else if(result == 2){
				location.href='/pro/login';
			}
			else if(result == 3)$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .feed-delete-result').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .delete-result-message').text('');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
	})
}