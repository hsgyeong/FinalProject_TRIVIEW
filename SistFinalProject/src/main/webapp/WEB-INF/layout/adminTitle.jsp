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
    <style type="text/css">
    	header {
    		font-family: 'Jalnan';
    	}
    	div.admin-title{
    		background: black;
    		width: 100%;
    	}
    	div.title-tab{
    		margin-left: 3%;
    		font-size : 30px;
    		padding:  30px 30px 30px 30px;
    		cursor: pointer;
    	}
    	
    	.title-tab>a{
    		
    		color: white;
    		text-decoration: none;
    	}
    </style>
    <script type="text/javascript">
    
    $(function() {
    	 $(".title-tab").hover(function(){
    	        $(this).css("background-color","gray");
    	        $(this).find("a").css("color","black")
    	    }, function(){
    	        // 마우스가 벗어날 때 원래 스타일로 되돌리기
    	        $(this).css("background-color","black");
    	        $(this).find("a").css("color","white")
    	    });
	})
   
    </script>
</head>
<body>
	<header>
		<div class="admin-title d-inline-flex">
			<div class="title-tab">
				<a href="/admin/admin-accom-approval-page?currentPage=${currentPage }">숙소승인</a>
			</div>
			<div class="title-tab">
				<a href="/admin/admin-pay-info-page?currentPage=${currentPage }">결제정보</a>
			</div>
			<div class="title-tab">
				<a href="/admin/admin-business-info-page?currentPage=${currentPage }">사업자관리</a>
			</div>
			<div class="title-tab">
				<a href="/admin/admin-member-info-page?currentPage=${currentPage }">회원관리</a>
			</div>
		</div>
	</header>
</body>
</html>