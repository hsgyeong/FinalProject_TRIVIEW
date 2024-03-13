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
    }
    table {
		margin-left: 450px;
	}
	
	.img {
	margin-left: 100px;
	}
	
	.id, .name, .company, .hp{
	font-size: 24px;
	}
    </style>
</head>
<body>
<b>내 정보</b>
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
		${businessDto.business_name }
		<br><br>
		</td>
	</tr>
	<tr class="company">
		<td>
		상호명
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		${businessDto.business_company }
		<br><br>
		</td>
	</tr>
	<tr class="hp">
		<td>
		연락처
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp; 
		${businessDto.business_hp }
		<br><br>
		</td>
	</tr>
	<br>
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
		<a>정보수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a>로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="x">회원탈퇴</a>
		</td>
	</tr>
	</table>
</body>
</html>