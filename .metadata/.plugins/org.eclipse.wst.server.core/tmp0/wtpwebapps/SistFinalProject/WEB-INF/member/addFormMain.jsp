<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
<style type="text/css">
.joinTitle{
	font-family: 'Jalnan';
	text-align: center;
	margin-top: 20px;
	color: #f7323f;
}

.select{
	display: flex;
	width: 50%;
	margin: auto;
 }
 .h{
 	text-align: center;
 }
.tb{
	border: none;
	width: 100%;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<table class="tb">
			<tr>
				<td>
				<div class="joinTitle">
				<h2><a href="/"	style="font-family: 'Jalnan'; text-align: center;
					margin-top: 20px; color: #f7323f; cursor:pointer; text-decoration: none;
 					outline: none;">TRIVIEW</a></h2>
				</div>
				<br><br>
				<div class="h"><b>회원가입</b></div>
				<br><br>
				<div class="select">
				<button type="button" class="btn" id="memberJoin" style="background-color: #f7323f; color: white; 
							font-family: 'Jalnan'; width:40%; height: 70px;">개인</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn" id="businessJoin" style="background-color: #f7323f; color: white; 
							font-family: 'Jalnan'; width:40%; height: 70px;">사업자</button>
				</div>	
				</td>
			</tr>		
	</table>			
</body>
<script type="text/javascript">
$(function(){
	
	$("#memberJoin").click(function(){
		
	location.href ="/member/member-join"
		
	})
	
	$("#businessJoin").click(function(){
		
	location.href = "/member/business-join"
		
	})
	
})

</script>
</html>