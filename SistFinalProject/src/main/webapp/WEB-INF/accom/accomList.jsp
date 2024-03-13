<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
a:link {
	text-decoration: none;
}

a:hover {
	color: gray !important;
}

.scrolling-text-container {
    width: 100%;
    overflow: hidden;
    position: relative;
    background-color: none;
    height: 12vh;
    font-size: 1.5em;
}

.scrolling-text {
    white-space: nowrap;
    animation: scroll 30s linear infinite;
    color: black;
}

@keyframes scroll {
    0% {
        transform: translateX(0%);
    }
    100% {
        transform: translateX(100%);
    }
}

.accom_list_box{
	
}

.accom_list_box img {
    max-width: 10vh;
    max-height: 10vh;
}

.accom_list_box table {
    width: 100%;
}

.accom_list_btn1 {
	width: 8vh;
	height: 5vh;
	border: 1px solid silver;
	color: black;
	font-weight: bold;
	background-color: white;
	border-radius: 1vh;
	font-size: 0.8em;
}

.accom_list_btn2 {
	width: 8vh;
	height: 5vh;
	border: 1px solid silver;
	color: black;
	font-weight: bold;
	background-color: white;
	border-radius: 1vh;
	font-size: 0.8em;
}

.accom_list_btn1:hover,
.accom_list_btn2:hover,
.accom_list_add:hover,
.accom_list_go:hover{
	background-color: rgb(228, 231, 235);
}

.accom_list_add{
			margin-top: 5vh;
        	width: 12vh;
            height: 6vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            font-size: 0.9em;
            background-color: white;
            border-radius: 1vh;
        }
.accom_list_go{
			margin-top: 5vh;
        	width: 12vh;
            height: 6vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            font-size: 0.9em;
            background-color: white;
            border-radius: 1vh;
        }
</style>
</head>
<body>
<div class="scrolling-text-container">
    <div class="scrolling-text">숙소가 ${totalCount }개 등록되어 있어요!</div>
</div>

<div class="accom_list_box" align="center">
			
            <table class="table table-bordered">
	            <tr>
	                <td align="center" style="width: 10%; height: 5vh;">종류</td>
	                <td align="center" style="width: 20%; height: 5vh;">이름</td>
	                <td align="center" style="width: 20%; height: 5vh;">사진</td>
	                <td align="center" style="width: 20%; height: 5vh;">위치</td>
	                <td align="center" style="width: 20%; height: 5vh;">수정 & 삭제</td>
	            </tr>
           	
           	
	        <c:if test="${totalCount>0 }">
	        <c:forEach var="dto" items="${list}" varStatus="i">
	        <c:if test="${dto.business_id eq sessionScope.business_id}">
                <tr>
                    <td align="center" valign="middle" style="width: 10%; height: 15vh;">${dto.accom_category }</td>
                    <td align="center" valign="middle" style="width: 20%; height: 15vh;">
                    <a href="/room/room-list?accom_num=${dto.accom_num }" style="color: black;">${dto.accom_name }
                    </a>
                    </td>
                                        
<td align="center" valign="middle" style="width: 20%; height: 15vh;">
                        <img src="../accomsave/${dto.accom_photo}" alt="">
                    </td>
                    <td align="center" valign="middle" style="width: 20%; height: 15vh;">${dto.accom_location }&nbsp;${dto.accom_address }</td>
                    <td align="center" valign="middle" style="width: 20%; height: 15vh;">
                    <button type="button" class="accom_list_btn1"
                    onclick="location.href='accom-update?accom_num=${dto.accom_num}'">수정</button>
                    <button type="button" class="accom_list_btn2"
                    onclick="location.href='delete?accom_num=${dto.accom_num}'">삭제</button>
                    </td>
                </tr>
                </c:if>
            </c:forEach>
            </c:if>
            </table>
            <button type="button" onclick="location.href='/accom/accom-insert?business_id=${dto.business_id}'"
				class="accom_list_add">숙소등록</button>
			<button type="button" onclick="location.href='/'"
				class="accom_list_go">메인으로</button>
</div>
</body>
</html>
