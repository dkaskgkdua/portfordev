$(document).ready(function(){
	$('.portfolio-list-item').click(function(){
		showDetail();
	});
	$('.exit-detail').click(function(){
		closeDetail();
	});
	$('#portfolioModalContainer').click(function(){
		closeDetail();
	});
	$('#portfolioModalContainer>section').click(function(e){
		e.stopPropagation();
	});
	function showDetail(){
		$('#portfolioModalContainer').fadeIn();
		$('body').addClass('not-scroll');
		$('#move_top_btn').fadeOut();
		$('.port-slide-list').resize();
	}
	function closeDetail(){
		$('#portfolioModalContainer').fadeOut();
		$('body').removeClass('not-scroll');
		if($(window).scrollTop() > 500)
		{
			$('#move_top_btn').fadeIn();
		}
	}
	
	$('.port-slide-list').slick({
		  infinite: false,	// 맨끝이미지에서 끝내지 않고 맨앞으로 이동
		  slidesToShow: 3,	// 화면에 보여질 이미지 갯수
		  slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
		  arrows: true,	// 화살표
		  dots:true,	// 아래 점
		  autoplay: true,	// 자동으로 다음 이미지 보여주기
		  autoplaySpeed:5000,	// 다음 이미지로 넘어갈 시간
		  pauseOnHover:true,	// 마우스 호버시 슬라이드 이동멈춤
		  speed:2000, 			// 다음 이미지로 넘겨질때 걸리는 시간
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


		//슬릭이 진행중인지 css로 체크
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
});