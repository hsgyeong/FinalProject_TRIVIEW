<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Room</title>--%>
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
<%--            width: 350px;--%>
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
<%--    </style>--%>
<%--</head>--%>

<%--<script type="text/javascript">--%>
<%--    var ws;--%>
<%--    window.onload = function(){ // 페이지 초기화 : 창이 로드될 때 호출할 함수를 설정하여 페이지를 초기화하고 기존 방을 가져오고 방 생성을 설정합니다.--%>
<%--        getRoom();--%>
<%--        createRoom();--%>
<%--    }--%>

<%--    function getRoom(){ // 서버에서 채팅방 목록을 가져와 표시합니다.--%>
<%--        commonAjax('/chat/getRoom', "", 'post', function(result){ // AJAX 요청을 수행하는 일반적인 함수입니다. jQuery의 '$.ajax' 메서드를 사용하여 비동기적으로 요청을 보냅니다.--%>
<%--            // 'getRoom' 함수는 '/chat/getRoom' 경로로 비동기적인 POST 요청을 보냅니다. 데이터는 비어있음("").--%>
<%--            createChatingRoom(result);--%>
<%--        });--%>
<%--    }--%>

<%--    function createRoom(){ // 방 생성 프로세스를 처리하며 사용자가 입력한 방 이름을 가져와 서버에 방 생성 요청을 보낸 후, 그 결과를 받아와 UI를 업데이트합니다.--%>
<%--        $("#createRoom").click(function(){ // "방 만들기" 버튼('#createRoom')의 클릭 이벤트에 바인딩 됩니다.--%>
<%--            var msg = {	roomName : $('#roomName').val()	}; // 사용자가 입력한 방 이름을 가져와 JavaScript 객체 'msg'에 저장합니다.--%>

<%--            commonAjax('/chat/createRoom', msg, 'post', function(result){ // 'commonAjax' 함수를 사용하여 서버에 '/chat/createRoom'경로로 POST 방식으로 요청을 보냅니다.--%>
<%--                // '/chat/createRoom' : 서버의 방 생성 엔드포인트--%>
<%--                // msg : 방 이름을 포함한 데이터--%>
<%--                // post : HTTP 요청의 타입--%>
<%--                // function(result){} : AJAX 요청이 성공한 경우 실행될 콜백 함수. 'createChatingRoom(result)' 을 호출하여 UI를 update 합니다.--%>
<%--                createChatingRoom(result);--%>
<%--            });--%>

<%--            $("#roomName").val(""); // 방 이름을 입력한 입력 필드('#roomName')의 값을 비워 초기화합니다.--%>
<%--        });--%>
<%--    }--%>

<%--    function goRoom(number, name){ // "참여"버튼을 클릭하면 특정 채팅 방으로 이동합니다.--%>
<%--        location.href="/chat/moveChating?roomName="+name+"&"+"roomNumber="+number;--%>
<%--    }--%>

<%--    function createChatingRoom(res){ // 서버로부터 받은 채팅방 목록 정보를 사용하여 UI를 업데이트 합니다.--%>
<%--        if(res != null){ // 서버에서 받아온 목록('res')이 비어있지 않은 경우에만 업데이트 작업을 수행합니다. 이는 예기치 않은 데이터가 없도록 안정석을 고려한 것입니다.--%>
<%--            var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>"; // 'tag' 변수는 HTML 문자열로 시작하며, 채팅방 목록을 나타내는 테이블의 첫 번째 행을 정의합니다.--%>
<%--            res.forEach(function(d, idx){ // 서버에서 받아온 목록('res')을 순회하며 각 채팅방에 대한 정보를 HTML 문자열로 추가합니다.--%>
<%--                var rn = d.roomName.trim();--%>
<%--                var roomNumber = d.roomNumber;--%>
<%--                tag += "<tr>"+--%>
<%--                    "<td class='num'>"+(idx+1)+"</td>"+--%>
<%--                    "<td class='room'>"+ rn +"</td>"+--%>
<%--                    "<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>참여</button></td>" +--%>
<%--                    "</tr>";--%>
<%--            });--%>
<%--            $("#roomList").empty().append(tag); // 기존의 채팅방 목록을 지우고, 새로운 HTML 문자열로 업데이트된 목로을 추가합니다. 이를 통해 채팅방 목로이 동적으로 갱신됩니다.--%>
<%--        }--%>
<%--    }--%>

<%--    function commonAjax(url, parameter, type, calbak, contentType){--%>
<%--        $.ajax({--%>
<%--            url: url, // 요청을 보낼 URL--%>
<%--            data: parameter, // 요청에 포함될 데이터--%>
<%--            type: type, // 요청의 타입(여기서는 'post')--%>
<%--            contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8', // 요청의 콘텐츠 타입 (여기서는 기본값으로 'application/x-www-form-urlencoded; charset=UTF-8'을 사용)--%>
<%--            success: function (res) {--%>
<%--                calbak(res); // 요청 성공 시 호출될 콜백함수 // 'success' 콜백 함수에서는 서버로부터 받은 결과('res')를 'createChatingRoom' 함수에 전달하여 채팅방 목록을 생성하고 UI에 표시합니다.--%>
<%--            },--%>
<%--            error : function(err){--%>
<%--                console.log('error');--%>
<%--                calbak(err); // 요청 실패 시 호출될 콜백함수--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>채팅방</h1>--%>
<%--    <div id="roomContainer" class="roomContainer">--%>
<%--        <table id="roomList" class="roomList"></table> &lt;%&ndash; 채팅방목록은 여기에 표시됩니다. 방은 서버 응답을 기반으로 JavaScript를 사용하여 동적으로 채워집니다. &ndash;%&gt;--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <table class="inputTable">--%>
<%--            <tr>--%>
<%--                <th>방 제목</th>--%>
<%--                <th><input type="text" name="roomName" id="roomName"></th>--%>
<%--                <th><button id="createRoom">방 만들기</button></th>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>


<%--</body>--%>
<%--</html>--%>