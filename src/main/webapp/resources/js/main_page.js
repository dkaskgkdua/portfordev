$(window).load(function(){
   generalMainFunctionOn();
   var member_id = $('#userId').val();
   var member_name = $('#userNick').val();

   // 베스트 포트폴리오 필터 변경시
   $('.best-port-filter').click(function(){
      if($(this).hasClass('filter-disable'))
         return;
      generalMainFunctionOff();
      $('.best-port-filter').removeClass('filter-active');
      $(this).addClass('filter-active');
      if($(this).text() == 'Daily')
      {
         $('.best-portfolio-list').css('display', 'none');
         $('.loading-list').stop().fadeIn(100, function(){
            $(this).css('opacity', '1');
            getBestPortfolios('daily');
            generalMainFunctionOn();
         });
      }
      else if($(this).text() == 'Weekly')
      {
         $('.best-portfolio-list').css('display', 'none');
         $('.loading-list').stop().fadeIn(100, function(){
            $(this).css('opacity', '1');
            getBestPortfolios('weekly');
            generalMainFunctionOn();
         });
      }
      else if($(this).text() == 'Monthly')
      {
         $('.best-portfolio-list').css('display', 'none');
         $('.loading-list').stop().fadeIn(100, function(){
            $(this).css('opacity', '1');
            getBestPortfolios('monthly');
            generalMainFunctionOn();
         });
      }
   });
   function getBestPortfolios(cd){
      $.ajax({
         data: {'condition' : cd}, 
         type: 'POST', 
         url: 'best_port',
         async: false,
         dataType: 'json', 
         cache: false, 
         success: function(best_ports){
            if(best_ports == null || best_ports.length == 0){
               errorAlert('베스트 포트폴리오를 가져오는 과정에');
               return;
            }
            $('.best-portfolio-list').empty();
            $.each(best_ports, function(){
               var output = '';
               output +=   '<div class="best-portfolio-item" id="best-port'+this.PORT_ID+'">';
               output +=      '<input type="hidden" class="hidden_PORT_ID" value="'+this.PORT_ID+'">';
               output +=      '<div class="bp-img-wrapper" style="background-image:url(/pro/resources/'+this.PORT_THUMBNAIL+'"></div>';
               output +=      '<div class="bp-info-wrapper">';
               output +=         '<img class="bp-info-writer-img" src="/pro/resources/'+this.PORT_WRITER_IMG+'">';
               output +=         '<div class="bp-writer-info">';
               output +=            '<span class="bp-info-writer">'+this.PORT_WRITER+'</span>';
               output +=            '<span class="bp-info-writer-job">'+this.PORT_WRITER_JOB+'</span>님';
               output +=         '</div>';
               output +=         '<span class="bp-info-subject">'+this.PORT_SUBJECT+'</span>';
               output +=         '<img class="bp-icon" src="/pro/resources/Image/icon/view-gray.png">';
               output +=         '<span class="bp-info-view bp-count">'+this.PORT_READCOUNT+'</span>';
               output +=         '<img class="bp-icon" src="/pro/resources/Image/icon/like-gray.png">';
               output +=         '<span class="bp-info-like bp-count">'+this.PORT_LIKECOUNT+'</span>';
               if(this.PORT_FEED_NEED == 0){
                  output +=       '<img class="bp-icon" src="/pro/resources/Image/icon/comment-gray.png">';
                  output +=      '<span class="bp-info-feed bp-count">'+this.PORT_FEEDCOUNT+'</span>';
               }
               output +=      '</div>';
               output +=   '</div>';
               $('.best-portfolio-list').append(output);
            });
         },
         error: function(){
            errorAlert('베스트 포트폴리오를 불러오는 과정에');
         }
      });
   }
   function generalMainFunctionOn(){
      // slide-item hover 시
      $('.best-portfolio-item').hover(function(){
         $(this).children('.bp-info-wrapper').stop().fadeIn();
      }, function(){
         $(this).children('.bp-info-wrapper').stop().fadeOut();
      });
      $('.best-portfolio-list').css('display', 'none').on('init', function(event, slick){
         $('.loading-list').css('display', 'none');
         $('.best-portfolio-list').resize();
         $('.best-portfolio-list').stop().fadeIn();
      });
      // 베스트 포트폴리오 슬라이드
      $('.best-portfolio-list').slick({
           infinite: true,   // 맨끝이미지에서 끝내지 않고 맨앞으로 이동
           slidesToShow: 1,   // 화면에 보여질 이미지 갯수
           slidesToScroll: 1, // 스크롤시 이동할 이미지 갯수
           arrows: true,   // 화살표
           dots:true,   // 아래 점
           variableWidth:true, 
           centerMode:true, 
           centerPadding:'60px',
           swipeToSlide:true, 
           autoplay: true,   // 자동으로 다음 이미지 보여주기
           autoplaySpeed:5000,   // 다음 이미지로 넘어갈 시간
           pauseOnHover:true,   // 마우스 호버시 슬라이드 이동멈춤
           speed:1000,          // 다음 이미지로 넘겨질때 걸리는 시간
           // vertical:true      // 세로방향으로 슬라이드를 원하면 추가
           responsive:[
              {   // 반응형 웹
                 breakpoint:960,   // 기준화면 사이즈
                 settings:{slidesToShow:1}   // 사이즈에 적용될 설정
              },
              {
                 breakpoint:768,
                 settings:{slidesToShow:1}
              }
           ]
      });
   }
   function generalMainFunctionOff(){
      // slide-item hover 종료
      $('.best-portfolio-item').off('mouseenter').off('mouseleave');
      // 슬라이드 슬릭 종료
      if($('.best-portfolio-list').hasClass('slick-initialized'))
         $('.best-portfolio-list').slick('unslick');
   }
   // feature 기능 구현
   $(window).resize(function(){
      $('.feature').off('click');
      $('.feature').off('mouseenter');
      $('.feature').off('mouseleave');
      // 모바일
      if($(window).width() > 580){
         $('.feature').on('mouseenter', feature_detail_show);
         $('.feature').on('mouseleave', feature_detail_hide);
      }else
         $('.feature').click(feature_click);
   });
   // 모바일
   if($(window).width() > 580){
      $('.feature').on('mouseenter', feature_detail_show);
      $('.feature').on('mouseleave', feature_detail_hide);
   }
   else
      $('.feature').click(feature_click);
   function feature_click(){
      $('.feature-summary').css('opacity', 1);
      $('.feature-detail').stop().fadeOut(300);
      $(this).children('.feature-summary').css('opacity', 0.7);
      $(this).children('.feature-detail').stop().fadeIn();
   }
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
      location.href='/pro/profile?idch='+member_id;
   }
   $('.new_port').click(function(){
      if(!askLogin(member_id))return;
      location.href='/pro/portfolio_add';
   });
});