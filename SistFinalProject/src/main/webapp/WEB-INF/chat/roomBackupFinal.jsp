<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>ChatRoom</title>--%>
<%--    <style>--%>
<%--        *{--%>
<%--            margin:0;--%>
<%--            padding:0;--%>
<%--        }--%>
<%--        .container{--%>
<%--            width: 500px;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 25px--%>
<%--        }--%>
<%--        .container h1{--%>
<%--            text-align: left;--%>
<%--            padding: 5px 5px 5px 15px;--%>
<%--            color: #FFBB00;--%>
<%--            border-left: 3px solid #FFBB00;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>
<%--        .roomContainer{--%>
<%--            background-color: #F6F6F6;--%>
<%--            width: 500px;--%>
<%--            height: 500px;--%>
<%--            overflow: auto;--%>
<%--        }--%>
<%--        .roomList{--%>
<%--            border: none;--%>
<%--        }--%>
<%--        .roomList th{--%>
<%--            border: 1px solid #FFBB00;--%>
<%--            background-color: #fff;--%>
<%--            color: #FFBB00;--%>
<%--        }--%>
<%--        .roomList td{--%>
<%--            border: 1px solid #FFBB00;--%>
<%--            background-color: #fff;--%>
<%--            text-align: left;--%>
<%--            color: #FFBB00;--%>
<%--        }--%>
<%--        .roomList .num{--%>
<%--            width: 75px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        .roomList .room{--%>
<%--            /*width: 350px;*/--%>
<%--        }--%>
<%--        .roomList .go{--%>
<%--            width: 71px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        button{--%>
<%--            background-color: #FFBB00;--%>
<%--            font-size: 14px;--%>
<%--            color: #000;--%>
<%--            border: 1px solid #000;--%>
<%--            border-radius: 5px;--%>
<%--            padding: 3px;--%>
<%--            margin: 3px;--%>
<%--        }--%>
<%--        .inputTable th{--%>
<%--            padding: 5px;--%>
<%--        }--%>
<%--        .inputTable input{--%>
<%--            width: 330px;--%>
<%--            height: 25px;--%>
<%--        }--%>
<%--        table{--%>
<%--            border: 2px solid pink;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<%--%>
<%--    String sender_id=(String) session.getAttribute("info_id");--%>
<%--%>--%>

<%--<script type="text/javascript">--%>
<%--    &lt;%&ndash;$(function (){&ndash;%&gt;--%>
<%--    &lt;%&ndash;   infoCheck();&ndash;%&gt;--%>
<%--    &lt;%&ndash;});&ndash;%&gt;--%>

<%--    &lt;%&ndash;function infoCheck(${chatRoomList}.room_num){&ndash;%&gt;--%>
<%--    &lt;%&ndash;    &ndash;%&gt;--%>

<%--    &lt;%&ndash;}&ndash;%&gt;--%>

<%--    // mv.addObject("roomName",roomName);--%>
<%--    // mv.addObject("accom_num",accom_num);--%>
<%--    // mv.addObject("room_num",room_num);--%>

<%--    function goChatting(room_num,accom_num,roomName){--%>

<%--        location.href="goChattingRoom?room_num="+room_num;--%>
<%--    }--%>




<%--</script>--%>
<%--<body>--%>
<%--    <div class="container">--%>
<%--        <h1>채팅방</h1>--%>
<%--        <div id="roomContainer" class="roomContainer">--%>
<%--            <table id="roomList" class="roomList">--%>
<%--                <tr>--%>
<%--                    <th class="num" width="150">순서</th>--%>
<%--                    <th class="room" width="250">방 이름</th>--%>
<%--                    <th class="go"width="100"></th>--%>
<%--                </tr>--%>
<%--                <c:forEach var="chatRoom" items="${chatRoomList}" varStatus="idx">--%>
<%--                    <tr>--%>
<%--                        <td class="num">${idx.count}</td>--%>
<%--                        <td class="room"><b>${roomName}_${chatRoom.room_num}</b></td>--%>
<%--                        <td class="go"><button type="button" id="goRoomBtn" onclick="goChatting(${chatRoom.room_num})" accom_num="${chatRoom.accom_num}" >참여</button> </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</body>--%>
<%--</html>--%>