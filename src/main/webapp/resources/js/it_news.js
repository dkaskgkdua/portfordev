$(document).ready(function(){
	$('.brNewsItem').click(function(){
		window.open($(this).children('.hiddenlink').val(), "_blank");
	});
	// 네이버 뉴스 속보
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
	
	$('.newsItem').click(function(){
		window.open($(this).children('a').attr('href'), "_blank");
	});			
	// 네이버 뉴스 API
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
				$('.newsList').empty();
				var output = '';
				$.each(news, function(){
					output += '<div class="newsItem clickable"> '
					output += 	'<div class="newsItemHeader"> ';
					output += 		'<span class="newsTitle">'+this.title+'</span> ';
					output +=		'<span class="newsDate">'+this.pubDate+'</span></div> ';
					output +=	'<p>'+this.description+'</p> ';
					output +=	'<a href="'+this.originallink+'" class="button special small">보러가기</a></div> ';
				});
				$('.newsList').append(output);
				$('html').animate({scrollTop : $('#searchedNews .newsHeader').offset().top}, 400);
			}
		});	
	}
});