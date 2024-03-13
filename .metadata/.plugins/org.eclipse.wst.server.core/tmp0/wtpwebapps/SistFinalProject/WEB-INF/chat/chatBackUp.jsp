<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Chating</title>--%>
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
<%--        .chating{--%>
<%--            background-color: #000;--%>
<%--            width: 500px;--%>
<%--            height: 500px;--%>
<%--            overflow: auto;--%>
<%--        }--%>
<%--        .chating .me{--%>
<%--            color: #F6F6F6;--%>
<%--            text-align: right;--%>
<%--        }--%>
<%--        .chating .others{--%>
<%--            color: #FFE400;--%>
<%--            text-align: left;--%>
<%--        }--%>
<%--        input{--%>
<%--            width: 330px;--%>
<%--            height: 25px;--%>
<%--        }--%>
<%--        #yourMsg{--%>
<%--            display: none;--%>
<%--        }--%>
<%--        .msgImg{--%>
<%--            width: 200px;--%>
<%--            height: 125px;--%>
<%--        }--%>
<%--        .clearBoth{--%>
<%--            clear: both;--%>
<%--        }--%>
<%--        .img{--%>
<%--            float: right;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<script type="text/javascript">--%>
<%--    var ws;--%>

<%--    function wsOpen(){ // 웹 소켓을 연결하고, 연결이 열릴 때와 메시지를 수신할 때의 이벤트 핸들러를 정의합니다.--%>
<%--        //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.--%>
<%--        // 웹 소켓 연결 URL을 생성합니다. 현재 방의 번호를 포함하여 서버에 연결합니다.--%>
<%--        ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val()); // 현재 호스트와 채팅 방 번호를 포함한 웹 소켓 연결 URL 을 나타냅니다.--%>

<%--        // 웹 소켓 이벤트 핸들러를 설정하는 함수를 호출합니다.--%>
<%--        wsEvt(); // 함수 내부에서는 서버로부터 받은 메시지를 파싱하여 메시지 유형에 따라 다른 동작을 수행합니다.--%>
<%--    }--%>

<%--    function wsEvt() {--%>
<%--        ws.onopen = function(data){ // 웹 소켓 연결이 열릴 때 동작하는 부분--%>
<%--            // 예시: 연결이 열리면 어떤 작업을 수행하거나 초기화를 진행합니다.--%>
<%--        }--%>

<%--        ws.onmessage = function(data) {--%>
<%--            // 웹 소켓으로 메시지를 수신했을 때 동작하는 부분--%>
<%--            // 예시 : 서버로부터 받은 메시지에 따라 다양한 동작을 수행합니다.--%>
<%--            var msg = data.data;--%>
<%--            if(msg != null && msg.trim() != ''){--%>
<%--                // 메시지가 비어있지 않으면 처리합니다.--%>

<%--                // 서버에서 받은 메시지를 JSON 형태로 파싱합니다.--%>
<%--                var d = JSON.parse(msg);--%>
<%--                if(d.type == "getId"){--%>
<%--                    // 서버로부터 받은 메시지의 타입이 "getId"인 경우--%>
<%--                    // 세션ID를 가져와서 #sessionId 필드에 설정합니다.--%>
<%--                    var si = d.sessionId != null ? d.sessionId : "";--%>
<%--                    if(si != ''){--%>
<%--                        $("#sessionId").val(si);--%>
<%--                    }--%>
<%--                }else if(d.type == "message"){--%>
<%--                    // 서버로부터 받은 메시지의 타입이 "message"인 경우--%>
<%--                    // 해당 메시지를 채팅 창에 추가합니다.--%>
<%--                    if(d.sessionId == $("#sessionId").val()){--%>
<%--                        // 만약 메시지를 보낸 사용자의 세션 ID가 현재 세션 ID와 일치하면--%>
<%--                        // "나" 로 표시하여 채팅창에 추가합니다.--%>
<%--                        $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");--%>
<%--                    }else{--%>
<%--                        // 다른 사용자의 메시지인 경우 해당 사용자 이름과 함께 채팅창에 추가합니다.--%>
<%--                        $("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");--%>
<%--                    }--%>
<%--                }else{--%>
<%--                    // 알수없는 메시지 타입인 경우 콘솔에 경고 메시지를 출력합니다.--%>
<%--                    console.warn("unknown type!")--%>
<%--                }--%>
<%--            }else {--%>
<%--                // 파일 업로드한 경우 업로드한 파일을 채팅방에 추가합니다.--%>
<%--                var url=URL.createObjectURL(new Blob([msg]));--%>
<%--                $("#chating").append("<div class='img'><img class='msgImg' src="+url+"></div><div class='clearBoth'></div>");--%>
<%--            }--%>
<%--        }--%>

<%--        // enter 키를 눌렀을 때 send 함수를 호출합니다.--%>
<%--        document.addEventListener("keypress", function(e){--%>
<%--            if(e.keyCode == 13){ //enter 키 코드--%>
<%--                send();--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    function chatName(){ // 사용자 이름을 입력하고, 웹 소켓을 열어 채팅에 참가합니다.--%>
<%--        var userName = $("#userName").val(); // 사용자가 입력한 사용자 이름을 가져옵니다.--%>
<%--        if(userName == null || userName.trim() == ""){ // 입력된 사용자 이름이 없거나 공백으로만 이루어져 있으면 경고를 표시하고 함수를 종료합니다.--%>
<%--            alert("사용자 이름을 입력해주세요.");--%>
<%--            $("#userName").focus(); // 포커스를 사용자 이름 입력 필드로 이동합니다.--%>
<%--        }else{ // 사용자 이름이 유효하면 웹 소켓을 연결하고, UI를 업데이트합니다.--%>
<%--            wsOpen(); // 웹 소켓을 열고 연결 이벤트 및 메시지 수신 이벤트를 설정하는 함수--%>
<%--            $("#yourName").hide(); // 사용자 이름 입력창을 숨깁니다.--%>
<%--            $("#yourMsg").show(); // 메시지 입력 창을 보이게 합니다.--%>
<%--        }--%>
<%--    }--%>

<%--    function send() { // 채팅 메시지를 서버로 전송합니다.--%>
<%--        var option ={--%>
<%--            type: "message", // 메시지의 유형을 나타내는 속성--%>
<%--            roomNumber: $("#roomNumber").val(), // 현재 채팅 방의 번호--%>
<%--            sessionId : $("#sessionId").val(), // 사용자의 세션 ID--%>
<%--            userName : $("#userName").val(), // 사용자의 이름--%>
<%--            msg : $("#chatting").val() // 사용자가 입력한 채팅 메시지--%>
<%--        }--%>
<%--        ws.send(JSON.stringify(option)) // 수집한 정보를 JSON 형태로 문자열화하고 웹 소켓을 통해 서버로 전송합니다.--%>
<%--        $('#chatting').val(""); // 채팅 입력 창을 비워 바로 입력할 수 있도록 함.--%>
<%--    }--%>

<%--    function fileSend(){ // 파일업로드 입력 필드에서 선택한 파일을 변수 'file'에 저장합니다.--%>
<%--        var file=document.querySelector("#fileUpload").files[0]; // 파일 업로드 입력 필드에서 선택한 파일을 가져옵니다.--%>
<%--        var fileReader=new FileReader(); // FileReader 객체를 생성하여 파일을 비동기적으로 읽어들이는 작업을 수행합니다.--%>
<%--        fileReader.onload=function (){ // 파일이 로드될 때 실행되는 이벤트 핸들러를 정의합니다.--%>
<%--            var param={ // 파일과 관련된 정보를 수집하여 객체 param에 저장합니다.--%>
<%--                type: "fileUpload", // 메시지 유형을 나타내는 속성--%>
<%--                file:file, // 업로드할 파일 객체--%>
<%--                roomNumber: $("#roomNumber").val(), // 현재 채팅방의 번호--%>
<%--                sessionId: $("#sessionId").val(), // 사용자의 세션 ID--%>
<%--                msg: $("#chatting").val(), // 사용자가 입력한 채팅 메시지--%>
<%--                userName: $("#userName").val() // 사용자 이름--%>
<%--            }--%>
<%--            ws.send(JSON.stringify(param)); // 파일을 전송하기 전에 파일 관련 정보를 포함한 메시지를 먼저 보냅니다.--%>
<%--            arrayBuffer=this.result; // 파일 데이터를 ArrayBuffer로 변환하여 웹 소켓을 통해 서버로 전송합니다.--%>
<%--            ws.send(arrayBuffer); // 파일 소켓 전용--%>
<%--        }--%>
<%--        fileReader.readAsArrayBuffer(file); // 파일을 ArrayBuffer로 일어들입니다.--%>
<%--    }--%>
<%--</script>--%>
<%--<body>--%>
<%--<div id="container" class="container">--%>
<%--    <h1>${roomName}의 채팅방</h1>--%>
<%--&lt;%&ndash;  '#sessionId' , '#roomNumber' 등의 히든 필드는 사용자의 세션 ID 및 현재 채팅 방의 번호를 저장합니다.&ndash;%&gt;--%>
<%--    <input type="hidden" id="sessionId" value="">--%>
<%--    <input type="hidden" id="roomNumber" value="${roomNumber}">--%>

<%--    <div id="chating" class="chating">--%>
<%--    </div>--%>

<%--    <div id="yourName">--%>
<%--        <table class="inputTable">--%>
<%--            <tr>--%>
<%--                <th>사용자명</th>--%>
<%--                <th><input type="text" name="userName" id="userName"></th>--%>
<%--                <th><button onclick="chatName()" id="startBtn">이름 등록</button></th>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div id="yourMsg">--%>
<%--        <table class="inputTable">--%>
<%--            <tr>--%>
<%--                <th>메시지</th>--%>
<%--                <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>--%>
<%--                <th><button onclick="send()" id="sendBtn">보내기</button></th>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>파일업로드</th>--%>
<%--                <th><input type="file" id="fileUpload"></th>--%>
<%--                <th><button onclick="fileSend()" id="sendFileBtn">파일업로드</button></th>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>