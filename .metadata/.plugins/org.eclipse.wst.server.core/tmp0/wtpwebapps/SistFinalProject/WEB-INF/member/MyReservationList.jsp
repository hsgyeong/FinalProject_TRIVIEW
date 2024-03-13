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
    <script type="text/javascript">
$(document).ready(function(){
	
	$(".room_detail_reserve_btn").click(function(){
		
		var reserve_id = $("#reserve-cancle").val();
		var reserve_status = "예약취소";
		
		var ans = confirm("예약 취소하시겠습니까?");
		//alert(reserve_id);		
		if(ans){
	
	$.ajax({
		
		type:"post",
		url:"update-reserve",
		dataType:"html",
		data:{
			"reserve_id":reserve_id,
			"reserve_status":reserve_status
		},
		success:function(res){
			
			alert("예약 취소되었습니다.");
			history.back();
			
		}
		
	})
		
	}
	
})

})
</script>
<style type="text/css">
.room_detail_reserve_btn{

	width: 13vh;
	height: 6vh;
	border: 1px solid silver;
	color: white;
	font-weight: bold;
	font-size: 0.85em;
	background-color: #FF3333;
	border-radius: 1vh;
	
}

.room_detail_reserve_btn:hover {
            background-color: #e00000;
        }
</style>
</head>
<body>
<h4><b>예약내역</b></h4>
<br>
<div style="display: flex; flex-wrap: wrap; width: 100%;
            justify-content: space-between;">
<c:forEach items="${list }" var="reserveDto" varStatus="i">
												<!-- i.count는 몇번쨰인지 알려줌. varStatus는 첫번째가 0번째임  -->
		
		
			<div>
			<table class="table table-bordered" style="width: 55vh; margin: 3vh 3vh;
            float: left;">
			
			
				<tr>
					<td align="center" valign="middle" colspan="2">${reserveDto.accom_name } / ${reserveDto.room_name }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">예약자</td>
					<td align="center" valign="middle">${reserveDto.reserve_name }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">숙소타입</td>
					<td align="center" valign="middle">${reserveDto.room_name }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">체크인</td>
					<td align="center" valign="middle">${reserveDto.reserve_checkin }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">체크아웃</td>
					<td align="center" valign="middle">${reserveDto.reserve_checkout }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">결제금액</td>
					<td align="center" valign="middle">
						<fmt:formatNumber value="${reserveDto.reserve_amount }"/>
					</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">쿠폰할인</td>
					<td align="center" valign="middle">${reserveDto.reserve_coupon }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">현재상태</td>
					<td align="center" valign="middle">${reserveDto.reserve_status }</td>
				</tr>
				
				<tr>
					<td align="center" valign="middle">결제일</td>
					<td align="center" valign="middle">
						<fmt:formatDate value="${reserveDto.reserve_day }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<c:if test="${reserveDto.reserve_status eq '예약완료' }">
				<tr>
					<td align="right" valign="middle" colspan="2"><button type="button" class="room_detail_reserve_btn" id="reserve-cancle"
						value="${reserveDto.reserve_id}">예약취소</button></td>
				</tr>
				</c:if>
			</table>
		</div>
		
	</c:forEach>
	</div>
</body>
</html>