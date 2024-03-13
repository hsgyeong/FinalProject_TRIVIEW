<%@page import="sist.last.service.MemberService"%>
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

.btn.bt{
	width:180px;
	height:60px;
	border-radius: 5px;
	background-color: #f7323f;
	color:white;
	align-items: center;
}

.success{
	font-family: 'Jalnan';
	color: #f7323f;
	font-size: 20px;
}
    </style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>

<h3><a href="/"	style="font-family: 'Jalnan'; text-align: center;
					margin-top: 20px; color: #f7323f; cursor:pointer; text-decoration: none;
 					outline: none;">TRIVIEW</a></h3><br>
${sessionScope.nickname }<br>
${sessionScope.hp }<br>
${sessionScope.email }<br>
<span class="success">가입을 환영합니다.</span><br><br>
<button type="button" class="btn bt" onclick="location.href='/'">메인으로</button>
</body>
</html>