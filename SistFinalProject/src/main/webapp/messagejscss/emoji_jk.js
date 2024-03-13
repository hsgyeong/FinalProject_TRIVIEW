$(function(){

// 입력창에 아무 입력도 없을 경우 'Add comment'를 기본으로 세팅
 var input_area_default = $('#input_area').html();

 if(input_area_default == ''){
   var default_text = 'Add comment'
   $('#chatting').html(default_text)
 }

});


// 입력을 시작하면 기본 세팅인 'Add comment'를 제거
$(document).on("focus","#input_area",function() {

  var input_area_default = $('#input_area').html()

  if(input_area_default == 'Add comment'){
    $('#chatting').html('')
  }

});


// 이모지 버튼에 마우스 올리면 표정 바뀜
$(document).on("mouseenter",".emoji_pickup",function() {

    $('#emoji_pickup_before').css("display","none");
    $('#emoji_pickup_after').css("display","block");
  }).on("mouseleave",".emoji_pickup",function() {
    $('#emoji_pickup_after').css("display","none");
    $('#emoji_pickup_before').css("display","block");
  });


// 이모지 버튼 클릭시 이모지 목록 popup
$(document).on("click",".emoji_pickup",function(){
	if($("#emoji_popup").css("display")=="none"){
		// popup div의 size를 가져와서 위치 선정에 활용
	  var popupdiv_width = $('#emoji_popup').width();
	  var popupdiv_height = $('#emoji_popup').height();
	
	  // popup div의 위치를 설정
	  var position = $('.emoji_pickup').position();
	  //$('#emoji_popup').css("left",position.left - 202);
	  //$('#emoji_popup').css("top",position.top - 202);
	  $("#emoji_popup").css("background-color","#FFFFFF")
	  $('#emoji_popup').css("display","block");	
	}else{
		$("#emoji_popup").css({"display":"none"});
	}

});


// input area에서 esc 누르면 popup div가 사라짐
$(document).on("keyup","#chatting",function() {
  if (event.keyCode === 27) {
    $("#emoji_popup").css({"display":"none"});
 	  }
});



// emoji_pick
$(document).on("click",".emoji_list", function(e) {
  var emoji_id = $(this).attr('id');
  var chat_content=$('#chatting').val();
  $('#chatting').val(chat_content+emoji_id);
  $('#chatting').focus();

});
