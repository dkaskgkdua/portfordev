$(document).ready(function(){
	var member_id = $('#MEMBER_ID').val();
	var member_name = $('#MEMBER_NAME').val();
	// 포트폴리오 상세 출력
	$('.portfolio-list-item').click(function(){
		showDetail();
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
	// 포트폴리오 상세 모달 노출
	function showDetail(){
		$('#portfolioModalContainer').fadeIn();
		$('body').addClass('not-scroll');
		$('#move_top_btn').fadeOut().addClass('never-show');
		doSlick();
		$('.port-slide-list').resize();
		$('.icon-tail-fit').on('click', doActivity);
	}
	// 포트폴리오 상세 모달 종료
	function closeDetail(){
		$('#portfolioModalContainer').fadeOut();
		$('.port-slide-list').slick('unslick');
		$('body').removeClass('not-scroll');
		$('#move_top_btn').removeClass('never-show');
		if($(window).scrollTop() > 500)
		{
			$('#move_top_btn').fadeIn();
		}
		
		$('.icon-tail-fit').off('click', doActivity);
	}
	// 포트폴리오 파일 이미지 변환후 slick 출력
	function doSlick()
	{
		$('.port-slide-list').slick({
			  infinite: false,	// 맨끝이미지에서 끝내지 않고 맨앞으로 이동
			  slidesToShow: 3,	// 화면에 보여질 이미지 갯수
			  slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
			  arrows: true,	// 화살표
			  dots:true,	// 아래 점
			  autoplay: true,	// 자동으로 다음 이미지 보여주기
			  autoplaySpeed:4000,	// 다음 이미지로 넘어갈 시간
			  pauseOnHover:true,	// 마우스 호버시 슬라이드 이동멈춤
			  speed:1500, 			// 다음 이미지로 넘겨질때 걸리는 시간
			  // vertical:true		// 세로방향으로 슬라이드를 원하면 추가
			  responsive:[
				  {	// 반응형 웹
					  breakpoint:1024,	// 기준화면 사이즈
					  settings:{slidesToShow:2}	// 사이즈에 적용될 설정
				  },
				  {
					  breakpoint:600,
					  settings:{slidesToShow:2}
				  },
				  {
					  breakpoint:500,
					  settings:{slidesToShow:1}
				  }
			  ]
		});
	}
	function doActivity()
	{
		if($(this).children('img').hasClass('recom-icon'))
		{
			recommend_portfolio();
		}
		else if($(this).children('img').hasClass('scrap-icon'))
		{
			scrap_portfolio();
		}
		else if($(this).children('img').hasClass('write-icon'))
		{
			feedback_write(member_id, member_name);
		}
		else if($(this).children('img').hasClass('feed-recom-icon'))
		{
			var feed_id = $(this).parent().parent().parent().children('.FEEDBACK_ID').val();
			feedback_recommend(member_id, feed_id);
		}
	}
	// 포트폴리오 추천 / 취소
	function recommend_portfolio()
	{
		// 추천이 아직 안되어있을 경우
		if($('.icon-tail-fit>.recom-tail').text() == '추천 하기')
		{
			var recomCnt = Number($('.port-recom-cnt').text()) + 1;
			$('.port-recom-cnt').text(recomCnt);
			$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-on.png');
			$('.icon-tail-fit>.recom-tail').text('추천 취소');
		}
		// 이미 추천을 했을 경우
		else
		{
			var recomCnt = Number($('.port-recom-cnt').text()) - 1;
			$('.port-recom-cnt').text(recomCnt);
			$('.recom-icon').attr('src', '/pro/resources/Image/icon/heart-off.png');
			$('.icon-tail-fit>.recom-tail').text('추천 하기');
		}
	}
	// 포트폴리오 스크랩 / 취소
	function scrap_portfolio()
	{
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
		$('.feed-writer-profile-nick').text(mname);
		if($('.icon-tail-fit>.write-tail').text() == '피드백 작성')
		{
			$('.icon-tail-fit>.write-tail').text('작성 취소');
			$('.portfolio-feedback-list').css('display', 'none');
			$('.portfolio-feedback-header').css('display', 'none');
			$('.feedback-write-container').css('display', 'block');
		}
		else
		{
			$('.icon-tail-fit>.write-tail').text('피드백 작성');
			$('.portfolio-feedback-list').css('display', 'block');
			$('.portfolio-feedback-header').css('display', 'block');
			$('.feedback-write-container').css('display', 'none');
		}
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
	    	$('.portfolio-detail-activity').css('display', 'block');
	    	$(this).children('img').attr('src', '/pro/resources/Image/left.png').css('margin-left','-10px');
	    	$(this).stop().animate({left: '0px'}, {duration:400,queue:false});
	    	$('.portfolio-detail-activity').stop().animate({left: '0px'}, {duration:400,queue:false});
	    }
	    else
	    {
	    	$(this).children('img').attr('src', '/pro/resources/Image/right.png').css('margin-left','0px');
	    	$(this).stop().animate({left: '-119px'}, {duration:400,queue:false});
	    	$('.portfolio-detail-activity').stop().animate({left: '-119px'}, {duration:400,queue:false});
	    	
	    }
	}
	
	
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