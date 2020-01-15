$(function(){
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