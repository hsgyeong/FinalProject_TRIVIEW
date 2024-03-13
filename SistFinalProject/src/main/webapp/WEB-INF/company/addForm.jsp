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
</head>
<body>
<form action="companyjoin" method="post">
		<table class="tb">
			<h3>
				<div class="t">TRIVIEW</div>
			</h3>
			<br>
			<caption align="top" class="cap">
				<b><h6>기업 회원가입</h6></b>
			</caption>
			<tr>
				<td>
					<div class="content">

						사업자등록번호<br> 
						<span class="i"><input type="text" name="companyid"
							id="companyid" class="form-control" required="required"
							style="width: 280px;" placeholder="사업자등록번호를 입력해주세요">&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn" id="idchk"
								style="background-color: #f7323f; color: white; font-family: 'Jalnan';">중복체크</button></span>
						<span class="companyidok" style="color: green; font-size: 12px;"></span><br><br>
						 사업자 비밀번호<br> 
						<input type="password" name="companypass"	id="cpass1" class="form-control" required="required"
							style="width: 280px;" placeholder="비밀번호를 입력해주세요">&nbsp;&nbsp;<br>
						비밀번호 확인<br>
						<div style="display: flex;">
							<input type="password" name="cpass2" id="cpass2"
								class="form-control" required="required" style="width: 280px;"
								placeholder="비밀번호를 다시 입력해주세요">&nbsp;&nbsp;<br> 
							<span class="cpassok" style="color: green; font-size: 12px;"></span>
						</div>
						<br> 대표자명<br> 
						<span class="cname"> 
						<input	type="text" name="cname" id="cname" class="form-control"
						required="required" style="width: 280px;" placeholder="대표자명을 입력해주세요">&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn" id="nickchk" style="background-color: #f7323f; color: white; 
							font-family: 'Jalnan';">중복체크</button></span>
						<br><br>
						 상호명<br> 
						 <input type="text" name="companyname"	class="form-control" required="required" style="width: 280px;"
							placeholder="상호명을 입력해주세요"><br> 
						연락처<br> 
						<select	style="width: 80px; height: 31px;" name="chp1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						- 
						<input type="text" name="chp2" id="chp2" class="form-conrol"	required="required" style="width: 80px;">
						- 
						<input type="text" name="chp3" id="hp3" class="form-conrol"	required="required" style="width: 80px;"><br><br> 
						이메일 <br> 
						<input type="text" name="cemail1" id="cemail1" class="form-conrol" required="required"	style="width: 130px;">&nbsp;
						&nbsp; 
						<select style="width: 130px; height: 31px;" name="cemail2" id="cemail2" >
							<option value="naver.com" selected="selected">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
						</select> <br><br> 
					</div>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<div class="bt">
			<button type="submit" class="btn"
				style="background-color: #f7323f; color: white; width: 200px; font-family: 'Jalnan';">회원가입</button>
		</div>
	</form>
</body>
</html>