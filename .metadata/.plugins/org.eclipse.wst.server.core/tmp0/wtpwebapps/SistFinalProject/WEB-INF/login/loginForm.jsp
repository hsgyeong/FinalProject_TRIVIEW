<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@page import="javax.swing.text.Document"%>
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
	justify-content: center;
	align-items: flex-start;
	margin-left: 20px; 
	width: 400px; 
	border:3px solid #f7323f;
	border-radius: 20px;
}
.id{
	display:inline-flex;
}
.pass{
	display: inline-flex;	
}

.btn.loginbt{
	width:305px;
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
.businessId {
	display: flex;
}

.p {
	position: static;
}
.b {
	display: none;
	position: static;
	height: 100%;
}

.businessPass {
	position:relative;
	display: flex;

}

.memberPass {
	position:relative;
	display: flex;
}

.businessShowPass {
	position: absolute;
	left:253px;
	top:5px;
	cursor:pointer;
}

.memberShowPass {
	position: absolute;
	left:253px;
	top:5px;
	cursor:pointer;
}

</style>
</head>
<% 
String info_id = (String)session.getAttribute("info_id");
String business_id = (String)session.getAttribute("business_id");
String saveok = (String)session.getAttribute("saveok");

boolean save = true;

if(saveok==null)
{
	info_id="";
	business_id="";
	save=false;
}
else{
	save=true;	
}

%>
<body>
<div align="center">
	<div class="login">

		<table class="table .table-borderless tb" style="width: 300px;">

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
						<form action="/login/member-login" method="post">
							<span class="id">아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="text" name="info_id" style="width: 200px;" class="form-control"
								required="required" value="${sessionScope.saveok==null?'':sessionScope.info_id }">
							</span>
							 <br><br>
							<span class="member input-group">	
							<div class="memberPass">비밀번호&nbsp;&nbsp;&nbsp;
							<input type="password" name="info_pass" style="width: 200px;"
								class="form-control" required="required" id="member_pass">&nbsp;&nbsp;
							<i class="bi bi-eye memberShowPass" style="color:gray" ></i>
							</div>
							</span>
							<br>
							<input type="checkbox" name ="cbsave" ${sessionScope.saveok == null?"":"checked"  } >&nbsp;아이디 저장
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
						<form action="/login/business-login" method="post" >
							<span class="businessId">사업자번호 &nbsp;&nbsp; 
							<input type="text" name="business_id" id="bNum" required="required"
								style="width: 190px;" class="form-control" value="${sessionScope.saveok==null?'':sessionScope.business_id }">
							</span>	
							 <br> 
							<span class="business input-group">
							<div class="businessPass">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="password" name="business_pass" required="required"
								style="width: 190px;" class="form-control" id="business_pass">&nbsp;&nbsp;
								<i class="bi bi-eye businessShowPass" style="color:gray"></i>
							</div>
							</span>
							<br>
							<input type="checkbox" name ="cbsave" ${sessionScope.saveok == null?"":"checked"  } >&nbsp;아이디 저장
							<br><br>
							<button type="submit" class="btn loginbt">
								&nbsp;&nbsp;로그인
							</button>
							<br>
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
								<br>
								<br>
						</div>
						</div>
					<!-- /	
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=	f74ba8d7ae81ba39d038f11c32d7c6ae&redirect_uri=http://localhost:9000/login/kakaoMember">
							<img alt="" src="../loginsave/kakao.png" style="cursor: pointer;">
					</a>
					/ -->	
					<div style="display: flex;">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=f74ba8d7ae81ba39d038f11c32d7c6ae&redirect_uri=http://localhost:9000/login/kakao-member&response_type=code">
					<img alt="" src="../loginsave/kakao.png" style="cursor: pointer; width:145px;height:40px;">
					</a>
					&nbsp;&nbsp;&nbsp;
					<% 
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();
					%>
					<a href="/login/naverLogin">
					<img alt="" src="../loginsave/naver.png" style="cursor: pointer; width:145px;height:40px;">
					</a>
					</div>
					</div>
				</td>
			</tr>
		</table>
		</div>
	</div>	
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

	$(".businessShowPass").click(function(){ 
		
		var businessPass = $("#business_pass");
		
		if(businessPass.attr("type")=="password"){
			businessPass.attr("type","text");
		}else
			{
			businessPass.attr("type","password");
			}

	})
	
	$(".memberShowPass").click(function(){
		
		var memberPass = $("#member_pass");
		
		if(memberPass.attr("type")=="password"){
			memberPass.attr("type","text");
		}else
			{
			memberPass.attr("type","password");
			}

	})
});

</script>
</html>