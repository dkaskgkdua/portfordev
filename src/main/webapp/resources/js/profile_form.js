var cnt = 0 ;
$("#start_btn").click(function(){
	$('.slick-next').click();
	$(this).css('display','none');
	$('#progress').css('display','block');
	$('#per').text('');
	$('#per').text(0*cnt+'%');
	$('#per').animate({
		width:(10*cnt)+'%'
	},1000)
	$('.pre-next').css('display','inline-block');

})
/*이전버튼 */ 
var precnt=0;
$('#pre').click(function(){
	cnt--;
	console.log(cnt);
	if(cnt==0){
		alert("첫번째 페이지 입니다.");
		return false;
	}
	$('.slick-prev').click();
	$('#per').text('');
	$('#per').text((20*cnt)+'%');
	$('#per').animate({
		width:(20*cnt)+'%'
	},1000)

})
/*다음 버*/ 
$('#next').click(function(){
	if(cnt<=5){
	cnt++;
	}
	console.log(cnt);
	if(cnt>5){
		cnt=5;
		return false;
	}
	
	$('.slick-next').click();
	$('#per').text('');
	$('#per').text(20*cnt+'%');
	$('#per').animate({
		width:(20*cnt)+'%'
	},1000)

})
console.log("클릭 횟수 "+cnt);

$('#submit').click(function(){ 
	var data=$('#profile_form').serialize();
	console.log("보낸 데이터 "+data);
 $.ajax({
	 type:'post',
	 enctype: 'multipart/form-data',
	 url:'profile_insert',
	 data: data,
	 success: function(item){

      alert("에이젝스 성공="+item.result);
	 },
	 error:function(){
		 alert("오류");
	 }


 })

})

