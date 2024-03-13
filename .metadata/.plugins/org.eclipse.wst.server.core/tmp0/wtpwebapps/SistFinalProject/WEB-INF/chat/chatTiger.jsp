<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">--%>
<%--    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->--%>

<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">--%>

<%--    <link href="/messagejscss/emoji_jk.css" type="text/css" rel="stylesheet">--%>
<%--    <script type="text/javascript" src="/messagejscss/emoji_jk.js"></script>--%>

<%--    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->--%>
<%--    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--    <title>Insert title here</title>--%>

<%--    <meta charset="UTF-8">--%>
<%--    <title>Chating</title>--%>
<%--    <style>--%>
<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>

<%--        .container {--%>
<%--            width: 500px;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 25px--%>
<%--        }--%>

<%--        .chatlist{--%>
<%--            height: 500px;--%>
<%--            overflow: auto;--%>
<%--        }--%>

<%--        .messagefooter {--%>
<%--            background: white;--%>
<%--            /* height: 55px; */--%>
<%--            width: 80%;--%>
<%--            position: inherit;--%>
<%--            bottom: 0;--%>
<%--            display: inline-flex;--%>
<%--            align-items: center;--%>
<%--            padding-left: 10px;--%>
<%--        }--%>

<%--        .chatuploadicon {--%>
<%--            cursor: pointer;--%>
<%--            color: #3582D3;--%>
<%--        }--%>

<%--        .chatinputbox {--%>
<%--            width: 80%;--%>
<%--            height: 35px;--%>
<%--            line-height: 35px;--%>
<%--            background-color: #F0F2F5;--%>
<%--            border-radius: 60px;--%>
<%--            text-align: center;--%>
<%--            margin-left: 10px;--%>
<%--            margin-right: 10px;--%>
<%--            border: 1px solid;--%>
<%--        }--%>

<%--        .chatinputbox input {--%>
<%--            width: 90%;--%>
<%--            background: none;--%>
<%--            border: none;--%>
<%--            outline: none;--%>
<%--            /*font-size: 1.5em;*/--%>
<%--        }--%>

<%--        .container h1 {--%>
<%--            text-align: left;--%>
<%--            padding: 5px 5px 5px 15px;--%>
<%--            color: #FFBB00;--%>
<%--            border-left: 3px solid #FFBB00;--%>
<%--            margin-bottom: 20px;--%>
<%--            margin-top: 50px;--%>
<%--        }--%>

<%--        .chating {--%>
<%--            overflow: auto;--%>
<%--            /*font-size: 2em;*/--%>
<%--        }--%>

<%--        .chating .me {--%>
<%--            color: #black;--%>
<%--            text-align: right;--%>
<%--        }--%>

<%--        .chating .others {--%>
<%--            color: black;--%>
<%--            text-align: left;--%>
<%--        }--%>

<%--        .chating img{--%>
<%--            height:75px;--%>
<%--        }--%>

<%--        input {--%>
<%--            width: 330px;--%>
<%--            height: 25px;--%>
<%--        }--%>

<%--        .messagefilepreview {--%>
<%--            position: inherit;--%>
<%--            background: white;--%>
<%--            box-shadow: 0px 0px 10px lightgray;--%>
<%--            border-bottom: 1px solid lightgray;--%>
<%--            width: 100%;--%>
<%--            height: 100px;--%>
<%--            display: inline-flex;--%>
<%--            align-items: center;--%>
<%--            bottom: 0;--%>
<%--            margin-bottom: 55px;--%>
<%--            z-index: 5p;--%>
<%--            /* display: none; */--%>
<%--        }--%>

<%--        .messagefilepreview div {--%>
<%--            height: 75px;--%>
<%--            margin: 0 auto;--%>
<%--            margin-left: 15px;--%>
<%--            display: inline-flex;--%>
<%--            align-items: flex-end;--%>
<%--        }--%>

<%--        .messagefilepreview img {--%>
<%--            height: 75px;--%>
<%--        }--%>

<%--        .messagefilepreview span {--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--        #sendBtn{--%>
<%--            cursor: pointer;--%>
<%--            font-size: 1.5em;--%>
<%--        }--%>
<%--    </style>--%>


<%--    <script type="text/javascript">--%>
<%--        $(function(){--%>

<%--            wsOpen();//웹소켓 오픈--%>
<%--            getChatting("${room_num}");//기존 채팅방 가져오기--%>
<%--            $(".messagefilepreview").hide();--%>


<%--            //사진 업로드--%>
<%--            $(".chatuploadicon").click(function() {--%>
<%--                $(".chatupload input").trigger("click");--%>
<%--            })--%>

<%--            //사진 선택 <--여기서부터~!--%>
<%--            $("#msgfileupload").change(function(event) {--%>
<%--                var input=event.target;--%>

<%--                //미리보기 띄우기--%>
<%--                if (input.files && input.files[0]) {--%>
<%--                    var reader = new FileReader();--%>
<%--                    reader.onload = function(e) {--%>
<%--                        $(".messagefilepreview").show();--%>
<%--                        var out="<div><img src='"+e.target.result+"'>";--%>
<%--                        out+="<span class='bi bi-file-x fileselcancel'></div>"--%>
<%--                        $(".messagefilepreview").html(out);--%>
<%--                    };--%>
<%--                    reader.readAsDataURL(input.files[0]);--%>
<%--                } else {--%>
<%--                    out="";--%>
<%--                }--%>
<%--            });--%>

<%--            //사진 선택 취소--%>
<%--            $(document).on("click",".fileselcancel",function(){--%>
<%--                $(".messagefilepreview").hide();--%>
<%--                $("#msgfileupload").val(null);--%>
<%--            });--%>


<%--        });--%>



<%--        //상대방과 하던 채팅 가져오기--%>
<%--        function getChatting(room_num, scrollPos){--%>

<%--            //alert(room_num);--%>

<%--            if(room_num==0){--%>
<%--                return;--%>
<%--            }--%>

<%--            $.ajax({--%>
<%--                type:"get",--%>
<%--                dataType:"json",--%>
<%--                url:"/message/chatting",--%>
<%--                data:{"room_num":room_num},--%>
<%--                success:function(res){--%>
<%--                    var chatContent="";--%>
<%--                    $.each(res, function(i,ele){--%>

<%--                        if(ele.sender_id=="${sessionScope.myid}"){--%>
<%--                            chatContent+="<p class='me' style='text-align: right;'>("+ele.mess_time+")&nbsp;&nbsp;나:"+ele.mess_content+"</p>";--%>
<%--                        }else{--%>
<%--                            chatContent+="<p class='other' style='text-align: left;'>("+ele.mess_time+")&nbsp;&nbsp; 상대:"+ele.mess_content+"</p>";--%>
<%--                        }--%>
<%--                    });--%>

<%--                    $("#chatShow").html(chatContent);--%>

<%--                    if (scrollPos == null) {--%>
<%--                        setTimeout(function(){--%>
<%--                            $(".chatlist").scrollTop($(".chatlist").prop('scrollHeight'));--%>
<%--                        },300)--%>
<%--                        //$(".chatlist").scrollTop($(".chatlist")[0].scrollHeight); //스크롤 맨 아래로 내리기--%>
<%--                    } else {--%>
<%--                        setTimeout(function(){--%>
<%--                            $(".chatlist").scrollTop(scrollPos);--%>
<%--                        },300)--%>
<%--                    }--%>
<%--                }--%>
<%--            });--%>


<%--        };--%>





<%--        //웹소켓 오픈--%>
<%--        function wsOpen() {--%>

<%--            ws = new WebSocket("ws://" + location.host + "/chating");--%>
<%--            wsEvt();--%>
<%--        }--%>

<%--        function wsEvt() {--%>
<%--            ws.onopen = function(data) {--%>
<%--                //소켓이 열리면 초기화 세팅하기--%>
<%--            }--%>

<%--            //메시지 잘 들어왔을 때 실행하는 내용--%>
<%--            ws.onmessage = function(data) {--%>
<%--                var msg = data.data;--%>
<%--                var msgJson = JSON.parse(msg)--%>

<%--                var room_num = $("#room_num").val();//현제 선택된 채팅방--%>

<%--                getChatting(room_num);--%>
<%--            }--%>

<%--            //채팅 입력창에서 엔터 누르면 채팅 보내짐--%>
<%--            $("#chatting").keyup(function(e) {--%>
<%--                if (e.keyCode == 13) { //enter press--%>
<%--                    if ($("#chatting").val() != '') {--%>
<%--                        send();--%>
<%--                    }--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>

<%--        //메시지 보내면 동작하는 코드--%>
<%--        function send() {--%>

<%--            var room_num=$("#room_num").val();--%>
<%--            var msg = $("#chatting").val();--%>
<%--            var mynum = "${sessionScope.myid}";--%>


<%--            //alert(room_num);--%>

<%--            //만약 사진을 선택하지 않았다면--%>
<%--            if(!$("#msgfileupload").val()){--%>
<%--                //글만 작성 했을 떄--%>
<%--                if(msg!=""){--%>
<%--                    ws.send(JSON.stringify({--%>
<%--                        "room_num" : room_num,--%>
<%--                        "msg" : msg,--%>
<%--                        "mynum" : mynum,--%>
<%--                        "type" : "chat"--%>
<%--                    }));--%>
<%--                }--%>
<%--                else{//아무것도 작성하지 않을 때--%>
<%--                    alert("메시지를 입력해 주세요.");--%>
<%--                }--%>


<%--            }else{--%>
<%--                //사진부터 업로드...--%>
<%--                var form=new FormData();--%>
<%--                form.append("upload",$("#msgfileupload")[0].files[0]); //선택한 1개만 추가--%>

<%--                $.ajax({--%>
<%--                    type:"post",--%>
<%--                    dataType:"json",--%>
<%--                    url:"/message/fileupload",--%>
<%--                    processData:false,--%>
<%--                    contentType:false,--%>
<%--                    data:form,--%>
<%--                    success:function(res){--%>

<%--                        ws.send(JSON.stringify({--%>
<%--                            "room_num" : room_num,--%>
<%--                            "msg" : res.upload,--%>
<%--                            "mynum" : mynum,--%>
<%--                            "type" : "img"--%>
<%--                        }));--%>

<%--                        $(".messagefilepreview").hide();--%>
<%--                        $("#msgfileupload").val(null);--%>
<%--                    }--%>
<%--                });--%>

<%--                //메시지도 적었다면 한 번 더 전송--%>
<%--                if(msg!=""){--%>
<%--                    ws.send(JSON.stringify({--%>
<%--                        "room_num" : room_num,--%>
<%--                        "msg" : msg,--%>
<%--                        "mynum" : mynum,--%>
<%--                        "type" : "chat"--%>
<%--                    }));--%>
<%--                }--%>
<%--            }--%>


<%--            $("#chatting").val("");--%>

<%--            getChatting(room_num);--%>

<%--        }--%>


<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="container" class="container">--%>
<%--    <h1>${sangdto.j_title}의 채팅방</h1>--%>
<%--    <input type="hidden" id="room_num" value="${room_num}">--%>

<%--    <!-- 채팅보이는 구간 -->--%>
<%--    <div class="chatlist">--%>
<%--        <div id="chatShow" class="chating w-75"></div>--%>
<%--    </div>--%>

<%--    <div class="messagefilepreview"></div>--%>

<%--    <div class="messagefooter">--%>
<%--        <!-- 이모지 시작-->--%>
<%--        <div class="chatemoji">--%>
<%--            <img class="emoji_pickup" id="emoji_pickup_before"--%>
<%--                 src="/messagejscss/img/emoji/1f642.png"> <img--%>
<%--                class="emoji_pickup" id="emoji_pickup_after"--%>
<%--                src="/messagejscss/img/emoji/1f600.png">--%>

<%--            <div id="emoji_popup">--%>
<%--                <!-- emoji popup div start -->--%>
<%--                <div id="people">--%>
<%--                    <h5>People</h5>--%>
<%--                </div>--%>
<%--                <span class="emoji_list" id="&#x1F601;">&#x1F601;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F602;">&#x1F602;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F603;">&#x1F603;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F604;">&#x1F604;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F605;">&#x1F605;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F606;">&#x1F606;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F609;">&#x1F609;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F60A;">&#x1F60A;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F60B;">&#x1F60B;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F60C;">&#x1F60C;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F60D;">&#x1F60D;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F60F;">&#x1F60F;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F612;">&#x1F612;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F613;">&#x1F613;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F614;">&#x1F614;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F616;">&#x1F616;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F618;">&#x1F618;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F61A;">&#x1F61A;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F61C;">&#x1F61C;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F61D;">&#x1F61D;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F61E;">&#x1F61E;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F620;">&#x1F620;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F621;">&#x1F621;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F622;">&#x1F622;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F623;">&#x1F623;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F624;">&#x1F624;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F625;">&#x1F625;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F628;">&#x1F628;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F629;">&#x1F629;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F62A;">&#x1F62A;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F62B;">&#x1F62B;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F62D;">&#x1F62D;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F630;">&#x1F630;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F631;">&#x1F631;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F632;">&#x1F632;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F633;">&#x1F633;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F635;">&#x1F635;</span> <span--%>
<%--                    class="emoji_list" id="&#x1F637;">&#x1F637;</span>--%>
<%--                <!-- emoji popup div end -->--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- 이모지 끝 -->--%>
<%--        <!-- 사진 올리기 -->--%>
<%--        <div class="chatupload">--%>
<%--            <input type="file" accept="image/jpeg,.png,.gif" id="msgfileupload" style="display: none;">--%>
<%--            <i class="bi bi-image chatuploadicon" style="font-size: 2em;"></i>--%>
<%--        </div>--%>
<%--        <div class="chatinputbox">--%>
<%--            <input type="text" id="chatting" placeholder="채팅 입력">--%>
<%--        </div>--%>
<%--        <i class="bi bi-send" onclick="send()" id="sendBtn"></i>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>