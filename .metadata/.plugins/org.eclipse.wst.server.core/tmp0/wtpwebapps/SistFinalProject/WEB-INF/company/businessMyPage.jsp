<%@page import="sist.last.dto.MemberDto"%>
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
    .m {
    font-size: 12px;
    color: gray;
    }
    
    .x { 
    text-decoration:none;
    color: gray;
    cursor:pointer;
    }
    
    table {
		margin: auto;
	}
	
	.img {
	margin-left: 100px;
	}
	
	.id, .name, .company, .hp, .email {
	font-size: 24px;
	}
	
	.up, .out {
	text-decoration: none;
	color:black;
	}
	
	.in {
	text-align: center;
	}
	
	.up {
	font: bord;
	font-weight: bold;
	}
	
	#bbtndelete {
	cursor: pointer;
	}
	
	.mine {
	text-decoration: none;
	color: black;
	font-weight: bold;
	font-size: 20px;
	}
	
	.a, .b, .c, .d {
	font-size: 20px;
	}
    </style>
</head>
<body>
<div class="in"><b>내 정보</b></div>
<br>

<table>
	<tr>
		<td>
			<img alt="" src="../loginsave/s7.png"  
			class="img" width="150px;" height="150px;"> 
			<br><br><br><br>
		</td>
	</tr>
	<tr class="name">
		<td>
		대표자
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		<span class="a">${businessDto.business_name }</span>
		<br><br>
		</td>
	</tr>
	<tr class="company">
		<td>
		상호명
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		<span class="b">${businessDto.business_company }</span>
		<br><br>
		</td>
	</tr>
	<tr class="hp">
		<td>
		연락처
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp; 
		<span class="c">${businessDto.business_hp }</span>
		<br><br>
		</td>
	</tr>
	<br>
		<tr class="email">
		<td>
		이메일
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp; 
		<span class="d">${businessDto.business_email }</span>
		<br><br>
		</td>
	</tr>
	<br>
	<tr>
		<td>
		<button class="btn" style="background-color:#f7323f; width:380px; color:white;" onclick="location.href='/accom/accom-list?business_id=${businessDto.business_id}'">나의 등록 숙소</button>
		</td>
	</tr>
	<br><br>
	<tr>
		<td>
		<hr>
		<span class="m">개인정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</span>
		<br>
		<hr>
		</td>
	</tr>
	<tr>	
		<td>
		<a href="/member/business-update?business_id=${businessDto.business_id }" class="up">정보수정</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/login/logout" class="out">로그아웃</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="x" name="mx" value="${businessDto.business_id }">회원탈퇴</a>
			<br><br><br>
		</td>
	</tr>

	</table>
	
		<!-- The Modal -->
<div class="modal" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">회원탈퇴</h5>
        <button type="button" class="btn-close cs" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      정말 탈퇴하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      
      <button type="button" class="btn del" id="bbtndelete" style="background-color: white;"
      onclick="location.href=/company/delete-business">회원탈퇴</button>
        <button type="button" class="btn cc" data-bs-dismiss="modal" style="background-color: white;">취소</button>
      </div>
      
  </div>
 </div>
 </div> 
</body>
<script>
$(document).ready(function(){
	
	$(document).on("click",".x",function(){
	
	$("#deleteModal").show();
	
	}); 

	$(document).on("click","#bbtndelete",function(){

		business_id = "${sessionScope.business_id}";

		$.ajax({
			
			type:"get",
			dataType:"html",
			url:"/company/delete-business",
			data:{"business_id":business_id},
			success:function(){
			}
			})
		
		
	$("#deleteModal").hide();	
	
	setTimeout(function(){
	alert("안녕히가세요!");
	
	window.location.href="/login/logout";
		
	},300)
	
})

	$(document).on("click",".cc",function(){
		
		$("#deleteModal").hide();
		
	})
	
	$(document).on("click",".cs",function(){
		
		$("#deleteModal").hide();
		
	})
});
</script>
</html>