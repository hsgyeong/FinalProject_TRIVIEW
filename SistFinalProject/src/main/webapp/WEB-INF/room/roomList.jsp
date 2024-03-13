<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
            margin-top: 2.5vh;
        }

        @keyframes scroll {
            0% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(100%);
            }
        }

        .room_array {
            width: 140%;
            margin: 0 0 0 -20%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .room_array table {
            width: 52vh;
            height: 60vh;
            margin: 5vh 5vh 0vh 5vh;
            float: left;
        }
        
         .room_array table td {
         	width: 5vh;
         }

        .room_array img {
            max-width: 15vh;
            max-height: 10vh;
        }

        .room_list_update {
            width: 8vh;
            height: 5vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            background-color: white;
            border-radius: 1vh;
            font-size: 0.8em;
        }

        .room_list_delete {
            width: 8vh;
            height: 5vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            background-color: white;
            border-radius: 1vh;
            font-size: 0.8em;
        }

        .room_list_update:hover,
        .room_list_delete:hover,
        .room_list_add:hover,
        .room_list_go:hover {
            background-color: rgb(228, 231, 235);
        }
        
        .room_list_add{
        	position: fixed;
        	right: 16.1%;
        	bottom: 10%;
        	z-index: 2;
        	width: 12vh;
            height: 6vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            font-size: 0.9em;
            background-color: white;
            border-radius: 1vh;
        }
        
        .room_list_go{
        	position: fixed;
        	right: 10%;
        	bottom: 10%;
        	z-index: 2;
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
    <div class="scrolling-text">${totalCount}개의 방을 등록하셨어요!</div>
</div>
<div class="room_array" align="center">
				
				<c:forEach var="dto" items="${list }" varStatus="i">
				
				<table class="table table-bordered">
					<tr>
						<td colspan="2" align="center" style="height: 3vh;"><b>${i.count }번방</b></td>
					</tr>
					<tr>
						<td align="center" valign="middle" style="height: 6vh;">이름</td>
						<td align="center" valign="middle">${dto.room_name }</td>
					</tr>
					
					<tr>
						<td align="center" valign="middle" style="height: 6vh;">가격</td>
						<td align="center" valign="middle">
						<fmt:formatNumber value="${dto.room_price }"/>
						</td>
					</tr>

                    <tr>
                        <td align="center" valign="middle" style="height: 6vh;">인원</td>
                        <td align="center" valign="middle">${dto.room_minpeople }명 ~ ${dto.room_maxpeople }명</td>
                    </tr>
					<tr>
						<td align="center" valign="middle" style="height: 6vh;">방갯수</td>
						<td align="center" valign="middle">${dto.room_count }</td>
					</tr>
					
					<tr>
						<td align="center" valign="middle" style="height: 6vh;">위치</td>
						<td align="center" valign="middle">${dto.room_location }</td>
					</tr>
					
					<tr>
						<td align="center" valign="middle" style="height: 6vh;">시간</td>
						<td align="center" valign="middle">${dto.room_checkin } ~ ${dto.room_checkout }</td>
					</tr>
					
					<tr>
						<td align="center" valign="middle" style="height: 20vh;">사진</td>
						<td align="center" valign="middle">
						
						
					    <c:forEach var="photo" items="${dto.room_photo }">
   
    					<img src="../roomsave/${photo}" alt="">

					    </c:forEach>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center" valign="middle" style="height: 10vh;">
							<button type="button" class="room_list_update"
								onclick="location.href='room-update?room_num=${dto.room_num}'">수정</button>
							<button type="button" class="room_list_delete"
								onclick="location.href='delete?num=${dto.room_num}'">삭제</button>
						</td>
					</tr>
				</table>
				
				
				</c:forEach>
				
				<button type="button" onclick="location.href='/room/room-insert?accom_num=${accom_num}'"
				class="room_list_add">방등록</button>
				<button type="button" onclick="location.href='/accom/accom-list?business_id=${dto.business_id}'"
				class="room_list_go">숙소목록</button>
	</div>
	
</body>
</html>