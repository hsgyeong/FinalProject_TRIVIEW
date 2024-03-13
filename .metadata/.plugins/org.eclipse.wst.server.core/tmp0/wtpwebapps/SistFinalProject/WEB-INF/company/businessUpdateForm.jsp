<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		$("#hp2").keyup(function() {

			if ($(this).val().length == 4)
				$("#hp3").focus();
		})

		$("#hp3").keyup(function() {

			var hp3 = $(this).val();
			if (hp3.length == 4) {
				$(this).attr("maxlength", 4);

			}
		})
		
			$("#hp2, #hp3").on("input", function(){
			
			var hpnum = $(this).val().replace(/[^0-9]/g,'');
			$(this).val(hpnum);
		});

		$("#pass2").keyup(function() {
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			
			var passval = $("span.passvalid").text();

			//alert(pass1+","+pass2)
			if(passval=="비밀번호는 8~12자리의 영소문자 또는 대문자, 숫자, 특수문자를 포함해야합니다.")
			{
				$("span.passok").text("");
			}else{
				
			if (pass1 == pass2 && ValidPassword(pass1)) {
				$("span.passok").text("비밀번호가 일치합니다.").css("color","green");
				
			} else {
				$("span.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
				$("#pass2").focus();
				
				}
			}

		})
		
		$("#updateBusiness").submit(function(e){
			
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			
			if(!ValidPassword(pass1)){
				alert("유효하지 않은 비밀번호입니다. 다시 입력해주세요.");
				
				e.preventDefault();
				
				return;
			}
			
			if(pass1 !== pass2) {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
				
			 	e.preventDefault();
			}
		})

	});
</script>
<style type="text/css">

.i {
	display: inline-flex;
}

.t{
	text-align: center;
}
.bt {
	margin-left: 395px;
}

.cap {
	text-align: center;
	align-items:center;
	font-weight: bold;
}

.nickch {
	display: inline-flex;
}

h3{
    text-align: center;
    font-family: 'Jalnan';
    margin-top: 20px;
    color: #f7323f;
    cursor: pointer;
    text-decoration: none;
    outline: none;
}

.content {
	margin: auto;
	width: 60%;	
}

.accommodation{
	display: flex;
}

.tb {
	border: none;
	width: 100%;
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	
}
</style>
</head>
<body>
	<form action="update-business" method="post" id="updateBusiness">
	<input type="hidden" name="business_id" value="${businessDto.business_id }">
		<table class="tb">
			<h3><a href="/"	class="t" style="font-family: 'Jalnan'; text-align: center;
					margin-top: 20px; color: #f7323f; cursor:pointer; text-decoration: none;
 					outline: none;">TRIVIEW</a></h3>
			<br>
		
			<caption align="top" class="cap">
				<h6><b>회원가입</b></h6>
			</caption>
			
			<tr>
				<td>
					<div class="content">
						<br> 상호명<br> 
						<span class="accommodation"> 
						<input	type="text" value="${businessDto.business_company}" name="business_company" id="accom" class="form-control"
						required="required" style="width: 300px;" placeholder="상호명을 입력해주세요">&nbsp;&nbsp;&nbsp;
							</span>
					<br>

						 비밀번호<br> 
						<input type="password" name="business_pass" value="${businessDto.business_pass }"	id="pass1" class="form-control" required="required"
							style="width: 300px;" placeholder="비밀번호를 입력해주세요">&nbsp;&nbsp;<br>
						비밀번호 확인<br>
						<div style="display: flex;">
							<input type="password" name="pass2" id="pass2"
								class="form-control" required="required" style="width: 300px;"
								placeholder="비밀번호를 다시 입력해주세요">&nbsp;&nbsp;<br> 
							<span class="passok" style="color: green; font-size: 12px;"></span>
						</div>
					<br>
						 대표자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						${businessDto.business_name }<br> <br>
						휴대폰<br> 
						<select	style="width: 80px; height: 31px;" name="hp1" value="${hp1 }">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						- 
						<input type="text" name="hp2" value="${hp2 }" id="hp2" class="form-conrol"	required="required" style="width: 80px;">
						- 
						<input type="text" name="hp3" value="${hp3 }" id="hp3" class="form-conrol"	required="required" style="width: 80px;"><br><br> 
						이메일 <br> 
						<input type="text" name="email1" value="${email1 }" id="email1" class="form-conrol" required="required"	style="width: 130px;">&nbsp;
						&nbsp; 
						<select style="width: 130px; height: 31px;" name="email2" value="${email2 }" id="email2" >
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
				style="background-color: #f7323f; color: white; width: 200px; font-family: 'Jalnan';">회원정보 수정</button>
		</div>
	</form>
</body>
</html>