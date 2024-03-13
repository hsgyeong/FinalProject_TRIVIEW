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
    <link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
   
    <title>Insert title here</title>
<style>
.login {
	display: flex;
	margin-left:140px;
	justify-content: center;
	margin-top: 100px;
	align-items: flex-start;
}
.id{
	display:inline-flex;
}
.pass{
	display: inline-flex;	
}

.btn.loginbt{
	width:290px;
	height:40px;
	border-radius: 5px;
	background-color: #f7323f;
	color:white;
}
.a{
	color: black;
	text-decoration: none;
}
.s{
	color: black;
	text-decoration: none;
}


.logtitle{
	font-family: 'Jalnan';
	text-align: center;
	margin-top: 20px;
	color: #f7323f;
}
.tb{
	display: flex;
	flex-direction: column;
	align-items:center;
	margin:auto;
	border: 0;
}

.tb td{
	padding: 10px;
	border-bottom: none;
}
.bts{
	display: flex;
	flex-direction: column;
	align-items:center;
	margin:auto;
}
.btnbt{
	display: inline-flex;
}
.select {
	width: 300px;
	display: flex;
}
.select button{
	flex:1;
	width:50%;
}
.b .select button{
	width:50%;
}
.businessId{
	display: flex;
}
.businessPass{
	display: flex;
}

.p
{
	position: static;
}
.b
{
display: none;
position: static;
height: 100%;
}
</style>
</head>
<% 
String id = (String)session.getAttribute("id");
String business_id = (String)session.getAttribute("business_id");
String saveok = (String) session.getAttribute("saveok");

boolean save = true;

if(saveok==null)
{
	id="";
	business_id="";
	save=false;
}
else{
	save=true;	
}


%>
<body>
	<div class="login" style="margin-left: 20px; margin-top: 40px;">

		<table class="table .table-borderless tb" style="width: 700px;">

			<tr>
				<td>
					<div class="logtitle">
						<h2>
							<a href="/"
								style="font-family: 'Jalnan'; text-align: center; margin-top: 20px; color: #f7323f; cursor: pointer; text-decoration: none; outline: none;">TRIVIEW</a>
						</h2>
					</div> <br>
				<br>
					<div class="select">
						<button type="button" class="btn" id="personBtn"
							style="background-color: #f7323f; color: white; font-family: 'Jalnan'; width: 50%;">개인</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn" id="businessBtn"
							style="background-color: #f7323f; color: white; font-family: 'Jalnan'; width: 50%;">사업자</button>
					</div>
				</td>
			</tr>

			<tr>
				<td><br>
					<div class="memberLogin">
						<form action="member-login" method="post">
							<span class="id">아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="text" name="id" style="width: 200px;" class="form-control"
								required="required"></span> <br>
							<br> <span class="pass">비밀번호&nbsp;&nbsp;&nbsp; <input
								type="password" name="pass" style="width: 200px;"
								class="form-control" required="required"></span>
							<br><br>
							<button type="submit" class="btn loginbt">
							<i class="bi bi-door-open"></i>&nbsp;&nbsp;로그인
							</button>
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="businessLogin">
						<form action="business-login" method="post">
							<span class="businessId">사업자번호 &nbsp;&nbsp; <input
								type="text" name="business_id" id="bNum" required="required"
								style="width: 190px;" class="form-control"></span> <br> <span
								class="businessPass">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="password" name="business_pass" required="required"
								style="width: 190px;" class="form-control"></span> <br>
							<br>
							<button type="submit" class="btn loginbt">
								<i class="bi bi-door-open"></i>&nbsp;&nbsp;로그인
							</button>
						</form>
					</div>
				</td>
			</tr>
			</div>

			<tr>
				<td>
					<div class="bts">
						<div class="btnbt">
							<a class="s" href="location.href='search'">아이디/비밀번호 찾기</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
								class="a" href="/member/joinform"><b>회원가입</b></a>
						</div>
					</div>
				</td>
			</tr>
		</table>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".businessLogin").hide();
	
	$("#businessBtn").click(function(){
		
		$(".businessLogin").show();
		$(".memberLogin").hide();
	});
	
	$("#personBtn").click(function(){
		
		$(".memberLogin").show();
		$(".businessLogin").hide();
	});
	
	$("#bNum").keyup(function() {

		var bNum = $(this).val();
		//alert(bNum);
		
		if (bNum.length > 10) {
			$(this).val(bNum.slice(0,10));

		} 
	});
	
	
});


</script>
</html>