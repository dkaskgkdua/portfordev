$(function(){
/* 	var out="";
	var searchword = $('#searchword').val();
	$.each($('.search_board_span'),function(index,item){
		var text=$('.search_board_span').text();
		var result = text.split(searchword);
		 var test=text.split("하");
		console.log("한글자는 왜 안되는거임"+test); 
		console.log("검색할 문자 "+searchword);
		console.log("text"+text);
		console.log("result[0]"+result[0]);
		console.log("result[1]"+result[1]);
		if(result[1]){
			out+="<span class='search_board_span'>";
			out+="<span style='background:yellow'>";
			out+=searchword+" ";
			out+="</span>"+result[1]+"</span>";
			$(this).text('');
			$(this).html(out);
		}
		 if(result[0]){
			out+="<span class='search_board_span'>";
			out+="<span style='background:yellow'>";
			out+=searchword+" ";
			out+="</span>"+result+"</span>";
			$(this).text('');
			$(this).html(out);
		} 
	}) 
	*/


	$("#sidebar_btn").click(function(){
		if($("#sidebar_btn").attr("src")==="resources/Image/left.png"){
			close();
		}else {
			open();
		}
			
		
	});
	function close(){
		$("#sidebar").css("display","none");
		$(".inner").css("marginLeft","150px");
		$("#adside").css("width","10px");
		$("#sidebar_btn").css("left","0px");
		$("#sidebar_btn").attr("src","resources/Image/right.png");
	
	};
	function open(){ 
		$("#sidebar").css("display","block");
		$(".inner").css("marginLeft","350px");
		$("#adside").css("width","300px");
		$("#sidebar_btn").css("left","240px");
		$("#sidebar_btn").attr("src","resources/Image/left.png");
	
	
	};
	$('.context_text span').each(function(index, item){
		var length=$(this).height();
		var span_length=$(this).text().length;
		/*console.log("span글자수:"+$(this).text().length);*/
		if(length>="100"){
			

			/*console.log("줄바꿈 작동");*/
			var span = $(this).text().trim().substr(0,(length-length+100)*2.0);
			$(this).text("");
			$(this).html(jQuery.trim(span)+"<span style='font-weight:bold'>. . .</span>")
		}
		
		
	})
	

	
	
	
})