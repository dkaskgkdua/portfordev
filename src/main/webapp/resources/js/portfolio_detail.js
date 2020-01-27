$(document).ready(function(){
	var member_id = $('#userId').val();
	var member_name = $('#userNick').val();
	// 포트폴리오 상세 출력
	// portfolio collection page
	$('.portfolio-list').on('click', '.portfolio-list-item', function(){
		var port_id = Number($(this).children('.hidden_PORT_ID').val());
		getDetail(port_id);
		if(getFeedbacks(port_id))
			getBestFeedback(port_id);
		showDetail();
	});
	// main page
	$('.best-portfolio-item').click(function(){
		// showDetail();
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
				console.log(port);
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
				// 포트폴리오 확대 이미지 들어갈 자리
				$('.port-pdf-imglist').html();
				// 포트폴리오 작성자 닉네임
				$('.port-pdf-writer').text(port.PORT_WRITER);
				// 포트폴리오 제목
				$('.detail-summary-subject').text(port.PORT_SUBJECT);
				// 포트폴리오 등록일
				$('.detail-summary-regidate').text(port.PORT_WRITTEN);
				// 포트폴리오 이미지 들어갈 자리
				$('.port-slide-list').html();
				// 포트폴리오 추천, 스크랩 버튼
				if(port.PORT_RECOM == 0){
					$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-off.png');
					$('.icon-tail-fit>.recon-tail').text('추천 하기');
				}
				else if(port.PORT_RECOM == 1){
					$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-on.png');
					$('.icon-tail-fit>.recon-tail').text('추천 취소');
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
				$('.port-writer-img-wrapper').css({'background-image' : 'url'+port.PORT_PROFILE_IMG+')'})
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
				// 피드백 수
				$('.portfolio-feedback-cnt').text(port.PORT_FEEDCOUNT);
				if(port.PORT_FEED_NEED == 0)
				{
					$('#feed-icon-tail').removeClass('never-show');
					$('#write-icon-tail').removeClass('never-show');
					$('.portfolio-no-feed-need').css('display', 'none');
					$('.portfolio-feedback-container').css('display', 'block');
				}
				else if(port.PORT_FEED_NEED == 1)
				{
					$('#feed-icon-tail').addClass('never-show');
					$('#write-icon-tail').addClass('never-show');
					$('.portfolio-no-feed-need').css('display', 'block');
					$('.portfolio-feedback-container').css('display', 'none');
				}
			}, 
			error: function(){
				errorAlert('포트폴리오 상세페이지를 확인하며');
			}
		});
	}
	var feedPick = 'allFeed';
	var feedOrder = 'latest';
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
					$('.portfolio-feedback-list').append('<div class="no-feedback-item">아직 등록된 피드백이 없습니다.</div>');
					$('.no-feedback-item').css('display', 'block');
					return false;
				}
				$('.no-feedback-item').css('display', 'none');
				$.each(feedbacks, function(){
					var output = '';
					output +=	'<div class="portfolio-feedback-item" id="feedback_'+this.FEEDBACK_ID+'">';
					output +=		'<input type="hidden" class="FEEDBACK_ID" name="FEEDBACK_ID" value="'+this.FEEDBACK_ID+'">';
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
					if(this.MEMBER_ID = member_id){
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
					output +=	'<div class="portfolio-feedback-item" id="best_feed_'+this.FEEDBACK_ID+'">';
					output +=		'<input type="hidden" class="FEEDBACK_ID" name="FEEDBACK_ID" value="'+this.FEEDBACK_ID+'">';
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
					output +=			'<div class="feedback-content-text">'+this.FEED_CONTENT+'</div>';
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
					if(this.MEMBER_ID = member_id){
						output +=		'<button type="button" class="feedback-delete">삭제</button>';
						output +=		'<button type="button" class="feedback-update">수정</button>';
					}
					output +=		'</div>';
					output +=	'</div>';
					$('.portfolio-feedback-list').prepend(output);	
					$('#best_feed_'+this.FEEDBACK_ID).fadeIn(400);
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
		doSlick();
		$('.port-slide-list').resize();
		$('.icon-tail-fit').on('click', doActivity);
		$('.feedback-writer-profile').on('click', goProfile);
		$('#feedPick').change(function(){
			feedPick = $('#feedPick').val();
			var port_id = $('.hidden_PORT_ID').val();
			if(getFeedbacks(port_id))
				getBestFeedback(port_id);
		});
		$('#feedOrder').change(function(){
			feedOrder = $('#feedOrder').val();
			var port_id = $('.hidden_PORT_ID').val();
			if(getFeedbacks(port_id))
				getBestFeedback(port_id);
		});
	}
	// 포트폴리오 상세 모달 종료
	function closeDetail(){
		$('#portfolioModalContainer').fadeOut(400, function(){
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
		});
		$('.icon-tail-fit').off('click', doActivity);
		$('.feed-writer-profile').off('click', goProfile);
		$('#feedPick').off('change');
		$('#feedOrder').off('change');
		feedPick = 'allFeed';
		$('#feedPick option:eq(0)').prop('selected', true);
		feedOrder = 'latest';
		$('#feedOrder option:eq(0)').prop('selected', true);
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
		$('.port-slide-list').on('swipe', function(event, slick, direction){
			console.log('swiped');
		});
		// 이미지 클릭 시 포트폴리오  확대
		$('.port-slide-item').on('click', function(){
			$('#portfolio-pdf-enlargement-wrap').fadeIn();
			$('.exit-modal').fadeOut();
			$('#portfolio-pdf-enlargement-wrap').click(function(e){
				e.stopPropagation();
				$('#portfolio-pdf-enlargement-wrap').fadeOut();
				$('.exit-modal').fadeIn();
			});
		});
	}
	// 여러가지 동작을 시행하는 함수
	function doActivity()
	{
		var port_writer_id = $('#writer_port_id').val();
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
			var feed_writer_id = '';
			if(!askLogin(member_id))return;
			if(member_id == feed_writer_id){
				notAllowed('피드백을 추천');
				return;
			}
			var feed_id = $(this).parent().parent().parent().children('.FEEDBACK_ID').val();
			feedback_recommend(member_id, feed_id);
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
		var port_id = $('#detail_port_id').val();
		var feed_content = $('#FEED_CONTENT').val();
		if(feed_content == null || feed_content ==''){
			$('#FEED_CONTENT').focus();
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
				else if(rd == 1)
					writeDoneAlert();
			},
			error: function(){
				errorAlert('피드백 작성 하는 중');
			}
		});
		if(getFeedbacks(port_id))
			getBestFeedback(port_id);
	}
	// 피드백 추천 클릭 시
	function feedback_recommend(mid, fid)
	{
		var clicked = $('#FEEDBACK_' + fid).parent().children('.feedback-controller').children('.feedback-recommend').children('.icon-tail-fit');
		if(clicked == null)console.log('null');
		if(clicked.children('.feed-recom-tail').text() == '추천하기')
		{
			clicked.children('.feed-recom-icon').attr('src', '/pro/resources/Image/icon/recom-on.png');
			clicked.children('.feed-recom-tail').text('추천취소');
			clicked.parent().children('.feedback-recommend-cnt').text((Number(clicked.parent().children('.feedback-recommend-cnt').text()) + 1));
		}
		else
		{
			clicked.children('.feed-recom-icon').attr('src', '/pro/resources/Image/icon/recom-off.png');
			clicked.children('.feed-recom-tail').text('추천하기');
			clicked.parent().children('.feedback-recommend-cnt').text((Number(clicked.parent().children('.feedback-recommend-cnt').text()) - 1));
		}
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
		if($(this).hasClass('portfolio-info-writer'))
		{
			writerNick = $('.portfolio-info-writer-nick').text();
		}
		else if($(this).hasClass('feedback-writer-profile'))
		{
			writerNick = $(this).children('.feedback-writer-nick').text();
		}
		else
		{
			return;
		}
		$('#alert-wrap').fadeIn(200, function(){
			$('#alert-wrap .profile-alert').css('display', 'block');
			$('#alert-wrap .profile-nick').text(writerNick);
			$('#alert-wrap .alert-box').fadeIn();
			$('#alert-wrap .goBtn').on('click', function(){
				location.href = '/pro/profile';
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
	}
	// GitHub 방문하기 클릭시
	$('.port-github-img').click(function(e){
		e.stopPropagation();
		var github = $('.port-github-href').val();
		$('#alert-wrap').fadeIn(200);
		$('#alert-wrap .site-alert').css('display', 'block');
		$('#alert-wrap .site-url').text(github);
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.href = github;
		})
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
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
		$('#alert-wrap').fadeIn(200, function(){
			$('#alert-wrap .site-alert').css('display', 'block');
			$('#alert-wrap .site-url').text(site);
			$('#alert-wrap .alert-box').fadeIn();
			$('#alert-wrap .goBtn').on('click', function(){
				location.href = site;
			})
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').fadeOut(200, function(){
					$('#alert-wrap').fadeOut();
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
			if($(window).width() > 640)
				$('#portfolio-info-wrap').stop().animate({left: '60%'}, {duration:500,queue:false});
			else
				$('#portfolio-info-wrap').stop().animate({left: '50%'}, {duration:500,queue:false});
		}
		else
		{
			$('#info-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/info-show-off.png');
			$('#info-icon-tail').children('span').text('정보 보기');
			$('#portfolio-info-wrap').stop().animate({left: '100%'}, 500, function(){
				$('#portfolio-info-wrap').scrollTop(0);
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
			$('#cover-wrap').fadeIn();
			$('.exit-cover').css('bottom','81%');
			$('#portfolio-feedback-wrap').stop().animate({top: '20%'}, 500,function(){
				$('.exit-cover').fadeIn();
			});
		}
		else
		{
			$('.exit-cover').fadeOut(250);
			$('#feed-icon-tail').children('img').attr('src', '/pro/resources/Image/icon/feed-show-off.png');
			$('#feed-icon-tail').children('span').text('피드백 보기');
			$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
				$('.portfolio-feedback-list').scrollTop(0);
				$('#cover-wrap').fadeOut();
			});
		}
	}
	$('.exit-cover').click(function(){
		if($('#write-icon-tail').hasClass('doFeedWrite'))
			feedback_write();
		else if($('#feed-icon-tail').hasClass('showFeed'))
			feed_show_hide();
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
	$('#alert-wrap').fadeIn(200, function(){
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
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .login-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
			});
		})
	})
}
// missing-alert
function askRefresh()
{
	$('#alert-wrap').fadeIn(200, function(){
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
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .missing-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
			});
		})
	})
}
// not-allowed alert
function notAllowed(msg)
{
	$('#alert-wrap').fadeIn(200, function(){
		$('#alert-wrap .not-allowed-message').text(msg);
		$('#alert-wrap .not-allowed-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
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
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
			});
		})
	})
}
// error-alert
function errorAlert(msg)
{
	$('#alert-wrap').fadeIn(200, function(){
		$('#alert-wrap .error-message').text(msg);
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .error-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
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
				$('#alert-wrap .error-alert').css('display', 'none');
				$('#alert-wrap .error-message').text('');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
			});
		})
	})
}
// write-done-alert
function writeDoneAlert()
{
	$('#alert-wrap').fadeIn(200, function(){
		$('#alert-wrap .write-done-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').fadeIn();
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
				$('#alert-wrap .write-done-alert').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
			});
		})
	})
}