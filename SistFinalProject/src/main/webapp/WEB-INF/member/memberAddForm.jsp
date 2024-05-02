<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"rel="stylesheet">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css"rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
		
	function ValidId(id) {
		var idRegex = /^[a-z0-9]{4,12}$/;
		return idRegex.test(id);
	}
		
	$("#id").keyup(function() {
			
		var id = $(this).val();
		var validId = ValidId(id);
		if(validId) {
				$("span.validid").text("");
		}else {
				$("span.validid").text("4~12자의 영문 소문자와 숫자만 가능합니다.").css("color","red")
		}
	})
		
	$("#idchk").click(function() {

		var id = $("#id").val();
		//alert(id);

		$.ajax({

			type : "get",
			dataType : "json",
			url : "idcheck",
			data : {"info_id" : id},
			success : function(res) {
				//alert(id);
				if (res.count == 0) {
					alert("사용 가능한 아이디입니다.");
					$("span.idok").text("사용 가능한 아이디입니다.").css("color","green");
				} else {
					alert("사용중인 아이디입니다. 다시 입력해주세요.");
					$("span.idok").text("사용중인 아이디입니다.").css("color","red");
				}
			}
		})
	});
		
	$("#joinForm").submit(function(e) {
			
		var idval = $("span.idok").text();
			
		if(idval == "사용중인 아이디입니다.")	{
			alert("사용중인 아이디입니다. 다시 입력해주세요.");
			e.preventDefault();
			return;
		}
	})
		

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

	$("#pass1").keyup(function(){
			
		var pass1=$(this).val();
		var validPass = ValidPassword(pass1);
		if(validPass){
			$("span.passvalid").text("");		
		}else{
			$("span.passvalid").text("비밀번호는 8~12자리의 영소문자 또는 대문자, 숫자, 특수문자를 포함해야합니다.").css("color","red");
		}
	})
		
	function ValidPassword(password) {
		var passwords = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/;
		return passwords.test(password);
	}
		
	$("#pass2").keyup(function() {
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
			
		var passval = $("span.passvalid").text("");
		
		//alert(pass1+","+pass2)
			
			
		if (pass1 == pass2 && ValidPassword(pass1)) {
			$("span.passok").text("비밀번호가 일치합니다.").css("color","green");	
		} else {
			$("span.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
			$("#pass2").focus();
			
		}

	}); 
		
/*	$("#pass2").keyup(function() {
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
			
		var passval = $("span.passvalid").text();
		
		//alert(pass1+","+pass2)
			
		if(passval=="비밀번호는 8~12자리의 영소문자 또는 대문자, 숫자, 특수문자를 포함해야합니다.")	{
			$("span.passok").text("");
		}else{
			if (pass1 == pass2 && ValidPassword(pass1)) {
				$("span.passok").text("비밀번호가 일치합니다.").css("color","green");
			} else {
				$("span.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
				$("#pass2").focus();	
			}
		}
	}); 
*/
		
	$("#joinForm").submit(function(e){
			
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
		
	$("#nickchk").click(function() {

		var nickname = $("#nick").val();
		//alert(nick);

		$.ajax({

			type : "get",
			dataType : "json",
			url : "nickcheck",
			data : {
				"info_nickname" : nickname
			},
			success : function(res) {

				if (res.count == 0) {

					$("span.nickok").text("사용 가능한 닉네임입니다.").css("color","green");
				} else {
					$("span.nickok").text("사용중인 닉네임입니다.").css("color","red");
				}
			}
		})

	})
		
	$("#joinForm").submit(function(e){
			
		var nicknameval = $("span.nickok").text();
			
		if(nicknameval == "사용중인 닉네임입니다."){
			alert("사용중인 닉네임입니다. 다시 입력해주세요");
			e.preventDefault();
			return;
		}
	})
	
});
</script>
<style type="text/css">

.i, .nickch {
	display: inline-flex;
}

.t {
	text-align: center;
}

.bt {
	margin: auto;
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
.cap {
	text-align: center;
	align-items:center;
	font-weight: bold;
}

.content {
	margin: auto;
	width: 60%;
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
<h3><a href="/"	class="t" id="t" style="font-family: 'Jalnan'; text-align: center;	margin-top: 20px; color: #f7323f; cursor:pointer; text-decoration: none; outline: none;">TRIVIEW</a></h3>
<br>	
	<form action="join-member" method="post" id="joinForm">
		<table class="tb">
			<caption align="top" class="cap">
				<h6><b>회원가입</b></h6><br>
			</caption>
			<tr>
				<td>
					<div class="cs"  style="margin: auto;">
						<div class="content" style="width:480px;" align="left">	아이디
						<br>
							<span class="i">
								<input type="text" name="info_id" id="id" class="form-control" required="required" style="width: 330px;" placeholder="아이디를 입력해주세요">&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn" id="idchk" style="background-color: #f7323f; color: white; width:30%; font-family: 'Jalnan';">중복체크</button>
							</span>	
							<br>
							<span class="idok validid" style="color: green; font-size: 12px;"></span>
							<!--<span class="validid"  style="font-size: 12px;"></span>-->
							<br>
							 비밀번호
							 <br>
							<input type="password" name="info_pass"	id="pass1" class="form-control" required="required" style="width: 300px;" placeholder="비밀번호를 입력해주세요">
							<span class="passvalid" style="font-size: 12px;"></span>
							&nbsp;&nbsp;
							<br>	
							비밀번호 확인
							<br>
							<div style="display: flex;">
								<input type="password" name="pass2" id="pass2" class="form-control" required="required" style="width: 300px;"placeholder="비밀번호를 다시 입력해주세요">&nbsp;&nbsp;
								<br> 
								<span class="passok" style="color: green; font-size: 12px;"></span>
							</div>
							<br> 
							닉네임
							<br>
							<span class="nickch"> 
								<input	type="text" name="info_nickname" id="nick" class="form-control"	required="required" style="width: 330px;" placeholder="닉네임을 입력해주세요">&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn" id="nickchk" style="background-color: #f7323f; color: white; 	font-family: 'Jalnan'; width:30%;">중복체크</button>
							</span>
							<br>
							<span class="nickok" style="color: green; font-size: 12px;"></span>
							<br>
							<br>
							<span class="line">이름<br></span> 
								 <input type="text" name="info_name" class="form-control" required="required" style="width: 300px;"	placeholder="이름을 입력해주세요">
								 <br> 
								휴대폰
								<br>
								<select	style="width: 80px; height: 31px;" name="hp1">
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> 
									- 
								<input type="text" name="hp2" id="hp2" class="form-conrol"	required="required" style="width: 80px;">
									- 
								<input type="text" name="hp3" id="hp3" class="form-conrol"	required="required" style="width: 80px;"><br><br> 
								이메일 
								<br>
								<input type="text" name="email1" id="email1" class="form-conrol" required="required"	style="width: 130px;">&nbsp;&nbsp; 
								<select style="width: 130px; height: 31px;" name="email2" id="email2" >
									<option value="naver.com" selected="selected">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
								</select> 
								<br>
								<br> 
								<label for="birth">생년월일</label>&nbsp;&nbsp;<span style="font-size: 12px; color: gray;">(선택사항)<br> </span>
								<input type="date" name="info_birth" id="birth">
							</div>
						</div>
					</td>
				</tr>
		</table>
		<br>
		<br>
		<div class="bt" style="text-align: center;">
			<button type="submit" class="btn" style="background-color: #f7323f; color: white; width: 200px; font-family: 'Jalnan';">회원가입</button>
		</div>
	</form>
</body>
</html>