$(window).load(function(){

	var member_id = $('#userId').val();
	var member_name = $('#userNick').val();
	// 베스트 포트폴리오 슬라이드
	$('.best-portfolio-list').slick({
		  infinite: true,	// 맨끝이미지에서 끝내지 않고 맨앞으로 이동
		  slidesToShow: 3,	// 화면에 보여질 이미지 갯수
		  slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
		  arrows: true,	// 화살표
		  dots:true,	// 아래 점
		  autoplay: true,	// 자동으로 다음 이미지 보여주기
		  autoplaySpeed:5000,	// 다음 이미지로 넘어갈 시간
		  pauseOnHover:true,	// 마우스 호버시 슬라이드 이동멈춤
		  speed:1000, 			// 다음 이미지로 넘겨질때 걸리는 시간
		  // vertical:true		// 세로방향으로 슬라이드를 원하면 추가
		  responsive:[
			  {	// 반응형 웹
				  breakpoint:960,	// 기준화면 사이즈
				  settings:{slidesToShow:2}	// 사이즈에 적용될 설정
			  },
			  {
				  breakpoint:768,
				  settings:{slidesToShow:1}
			  }
		  ]
		});
	// 베스트 포트폴리오 필터 변경시
	$('.best-port-filter').click(function(){
		$('.best-port-filter').removeClass('filter-active');
		$(this).addClass('filter-active');
		if($(this).text() == 'Daily')
		{
			// alert('dd');
		}
		else if($(this).text() == 'Weekly')
		{
			// alert('ww');
		}
		else if($(this).text() == 'Monthly')
		{
			// alert('MM');
		}
	});
	
	// feature 기능 구현
	$('.feature').hover(feature_detail_show, feature_detail_hide);
	function feature_detail_show(){
		$(this).children('.feature-summary').css('opacity', 0.7);
		$(this).children('.feature-detail').stop().fadeIn();
	}
	function feature_detail_hide(){
		$(this).children('.feature-summary').css('opacity', 1);
		$(this).children('.feature-detail').stop().fadeOut();
	}
	$('.my_profile').click(my_profile);
	function my_profile(){
		if(!askLogin(member_id))return;
		location.href="/pro/profile";
	}
	$('.my_port').click(my_portfolio);
	function my_portfolio(){
		if(!askLogin(member_id))return;
		location.href="/pro/profile";
	}
});