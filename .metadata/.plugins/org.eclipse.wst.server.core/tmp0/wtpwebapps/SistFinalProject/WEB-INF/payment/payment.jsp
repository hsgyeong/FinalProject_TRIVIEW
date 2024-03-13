<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <script type="text/javascript">
    	$(function(){
    		
    		var track3 = new Audio();
    		track3.src = '../music/goodnight.mp3';
    		
    		// 클릭 이벤트를 i 태그에 바로 추가
    		$('i.bi-check2').on('click', function(){
    		  if( track3.paused )
    		    track3.play();
    		  else
    		    track3.pause();
    		});
    	});
    </script>

</head>
<body>
	<div align="center">
		<!-- i 태그를 클릭하면 음악이 재생되도록 수정 -->
		<i class="bi bi-check2" style="font-size: 200px; cursor: pointer; color: #E34647;"></i><br>
		${reserveDto.info_id }님, 예약번호(<a href="/member/myreservation" style="text-decoration: none;">${reserveDto.reserve_id }</a>)를 결제해주셔서 감사합니다.<br>
	</div>
</body>
</html>