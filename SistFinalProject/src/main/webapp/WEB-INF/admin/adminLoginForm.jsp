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
	border:3px solid black;
	border-radius: 20px;
}
.id{
	display:inline-flex;
}
.pass{
	display: inline-flex;	
}
.loginbt{
	width:305px;
	height:40px;
	border-radius: 5px;
	background-color: black;
	color:white;
}

.memberPass {
	position:relative;
	display: flex;
}

</style>

</head>
<body>
<div align="center">
	<div class="login">

		<table class="table .table-borderless tb" style="width: 300px;">

			<tr>
				<td>
					<div class="logtitle">
						<h2>
							<h3 style="font-family: 'Jalnan'; text-align: center; margin-top: 20px; color: black; outline: none;">TRIVIEW</h3>
						</h2>
					</div>
				</td>
			</tr>

			<tr>
				<td><br>
					<div class="memberLogin">
						<form action="/admin/admin-login" method="post">
							<span class="id">아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="admin_id" style="width: 200px;" class="form-control" required="required">
							</span>
							 <br><br>
							<span class="member">	
							<div class="memberPass">비밀번호&nbsp;&nbsp;&nbsp;
							<input type="password" name="admin_pass" style="width: 200px;"
								class="form-control" required="required" id="member_pass">&nbsp;&nbsp;
							</div>
							</span>
							<br>
							<button type="submit" class="loginbt">
							<i class="bi bi-door-open"></i>&nbsp;&nbsp;로그인
							</button>
						</form>
					</div>
				</td>
			</tr>
			</div>
		</table>
		</div>
	</div>	
</body>
</html>