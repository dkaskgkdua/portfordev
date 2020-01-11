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
		$(".inner").css("marginLeft","100px");
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
	
	
})