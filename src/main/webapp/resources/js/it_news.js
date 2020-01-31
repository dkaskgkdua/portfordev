$(document).ready(function(){
	// 네이버 뉴스 속보
	$('.brNewsItem').click(function(){
		window.open($(this).children('.hiddenlink').val(), "_blank");
	});
	$('.brNews-filter').click(function(){
		$('.brNews-filter').removeClass('filter-active');
		$(this).addClass('filter-active');
		$('.brNewsItem').off('click');
		var category = $(this).text();
		getBreakingNews(category);
	});
	function getBreakingNews(cg)
	{
		$.ajax({
			data: {category : cg}, 
			type: 'get', 
			url: 'getBreakingNews', 
		    dataType : 'json',
			cache: false, 
			contentType: false, 
			success : function(news){
				$('.brNewsList').empty();
				var output = '';
				$.each(news, function(){
					output += '<div class="brNewsItem clickable"> ';
					output += '<div class="brNewsImg"> ';
					output += '<img src="' + this.image + '"></div>';
					output += '<div class="brNewsHeadline">' + this.headLine + '</div> ';
					output += '<input type="hidden" class="hiddenlink" value="' + this.link + '"></div> ';
				});
				$('.brNewsList').append(output);
				$('.brNewsItem').click(function(){
					window.open($(this).children('.hiddenlink').val(), "_blank");
				});
			}
		});	
	}
	
	// 네이버 뉴스 API
	$('.newsItem').click(function(){
		window.open($(this).children('a').attr('href'), "_blank");
	});	
	$('.newsItem a').click(function(e){
		e.preventDefault();
	});		
	var newsPage = 1;
	$('#searchedNews .prevList').click(function(){
		if(newsPage != 1)
		{
			newsPage -= 1;
			getNextNews(newsPage);
			if(newsPage == 1)
				$(this).removeClass('clickable');
		}
		else
		{
			alert('첫 페이지 입니다.');
		}
	});
	$('#searchedNews .nextList').click(function(){
		newsPage += 1;
		$('#searchedNews .prevList').addClass('clickable');
		getNextNews(newsPage);
	});
	function getNextNews(np)
	{
		$.ajax({
			data: {
				display: 10, 
				start: (1 + (np-1)*10)
			}, 
			type: 'get', 
			url: 'getNextNews', 
			cache: false, 
			contentType: false, 
			success : function(news){
				$('.newsItem').off('click');
				$('.newsList').empty();
				$.each(news, function(i){
					var output = '';
					output += '<div class="newsItem clickable" id="news_'+i+'"> '
					output += 	'<div class="newsItemHeader"> ';
					output += 		'<span class="newsTitle">'+this.title+'</span> ';
					output +=		'<span class="newsDate">'+this.pubDate+'</span></div> ';
					output +=	'<p>'+this.description+'</p> ';
					output +=	'<a href="'+this.originallink+'" class="button special small">보러가기</a></div> ';
					$('.newsList').append(output);
					$('#news_'+i).css('opacity', 0).animate({'opacity':1}, 1000);
				});
				$('html').animate({scrollTop : $('#searchedNews .newsHeader').offset().top}, 400);
				$('.newsItem').click(function(){
					window.open($(this).children('a').attr('href'), "_blank");
				});	
				$('.newsItem a').click(function(e){
					e.preventDefault();
				});
			}
		});	
	}
});