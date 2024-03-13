<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link href="/messagejscss/emoji_jk.css" type="text/css" rel="stylesheet">--%>
<%--    <link href="/messagejscss/chat.css" type="text/css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">--%>
<%--    <script type="text/javascript" src="/messagejscss/emoji_jk.js"></script>--%>
<%--    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Chating</title>--%>
<%--</head>--%>

<%--<script type="text/javascript">--%>

<%--    $(function () {--%>
<%--        wsOpen(); // 웹 소켓 오픈--%>
<%--        getChatting("${room_num}"); // 기존 채팅방 가져오기--%>
<%--        $(".messagefilepreview").hide();--%>

<%--        // 사진 업로드--%>
<%--        $(".chatuploadicon").click(function (){--%>
<%--           $(".chatupload input").trigger("click");--%>
<%--        });--%>

<%--        // 사진 선택 시작--%>
<%--        $("#msgfileupload").change(function (event){--%>
<%--           var input=event.target;--%>

<%--           // 미리보기 띄우기--%>
<%--            if (input.files && input.files[0]){--%>
<%--                var reader = new FileReader();--%>
<%--                reader.onload=function (e){--%>
<%--                    $(".messagefilepreview").show();--%>
<%--                    var out="<div><img src='"+e.target.result+"'>";--%>
<%--                    out+="<span class='bi bi-file-x fileselcansel'></div>"--%>
<%--                    $(".messagefilepreview").html(out);--%>
<%--                }--%>
<%--                reader.readAsDataURL(input.files[0]);--%>
<%--            } else {--%>
<%--                out="";--%>
<%--            }--%>

<%--        });--%>

<%--        // 사진 선택 취소--%>
<%--        $(document).on("clikc",".fileselcancel",function (){--%>
<%--            $(".messagefilepreview").hide();--%>
<%--            $("#msgfileupload").val(null);--%>
<%--        });--%>
<%--    });--%>

<%--    // 상대방과 하던 채팅 가져오기--%>
<%--    function getChatting(room_num,scrollPos){--%>
<%--        if (room_num==0){--%>
<%--            return;--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            type:"get",--%>
<%--            dataType:"json",--%>
<%--            url:"/chat/chatting",--%>
<%--            data:{"room_num":room_num},--%>
<%--            success:function (res){--%>
<%--                // alert("res확인"+res);--%>
<%--                var chatContent="";--%>
<%--                $.each(res,function (i,ele){--%>
<%--                   if (ele.sender_id=="${sessionScope.info_id}"||ele.sender_id=="${sessionScope.business_id}"){--%>
<%--                       chatContent+="<div class='me-box'><p class='me' style='text-align: right;'>("+ele.mess_time+")&nbsp;&nbsp;나:"+ele.mess_content+"</p></div>";--%>
<%--                   } else {--%>
<%--                       chatContent+="<div class='others-box'><p class='others' style='text-align: left;'>상대:"+ele.mess_content+"("+ele.mess_time+")&nbsp;&nbsp;</p></div>";--%>
<%--                   }--%>
<%--                });--%>

<%--                $("#chatShow").html(chatContent);--%>
<%--                if (scrollPos==null){--%>
<%--                    setTimeout(function (){--%>
<%--                        $(".chatlist").scrollTop($(".chatlist").prop('scrollHeight'));--%>
<%--                    },300)--%>
<%--                } else {--%>
<%--                    setTimeout(function (){--%>
<%--                        $(".chatlist").scrollTop(scrollPos);--%>
<%--                    },300)--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    // 웹소켓 오픈--%>
<%--    function wsOpen(){--%>
<%--        ws=new WebSocket("ws://"+location.host+"/chat/chating");--%>
<%--        wsEvt();--%>
<%--    }--%>

<%--    function wsEvt(){--%>
<%--        ws.onopen=function (data){--%>
<%--            // 소켓이 열리면 초기화 세팅하기--%>
<%--        }--%>

<%--        // 메시지가 잘 들어왔을 때 실행하는 내용--%>
<%--        ws.onmessage = function (data){ // handler 에서 메시지 보내는게 완료 되면 여기로 넘어온다.--%>
<%--            var msg=data.data;--%>
<%--            var msgJson=JSON.parse(msg);--%>

<%--            var room_num=$("#room_num").val(); // 현재 선택된 채팅방--%>

<%--            getChatting(room_num);--%>
<%--        }--%>

<%--        // 채팅 입력창에서 엔터 누르면 채팅 보내짐--%>
<%--        $("#chatting").keyup(function (e){--%>
<%--           if(e.keyCode==13){--%>
<%--               if ($("#chatting").val()!=''){--%>
<%--                   send();--%>
<%--               }--%>
<%--           }--%>
<%--        });--%>
<%--    }--%>

<%--    // 메시지 보내면 동작하는 코드--%>
<%--    function send(){--%>
<%--        var room_num=$("#room_num").val();--%>
<%--        var msg=$("#chatting").val();--%>
<%--        &lt;%&ndash;var mynum="${sessionScope.myid}";&ndash;%&gt;--%>

<%--        var info_id="${sessionScope.info_id}";--%>
<%--        var business_id="${sessionScope.business_id}";--%>
<%--        var myid="${sessionScope.myid}";--%>

<%--        if (info_id!=null){--%>
<%--            myid=info_id--%>
<%--        } else if (business_id!=null) {--%>
<%--            myid=business_id;--%>
<%--        } else if (myid!=null) {--%>
<%--            myid=myid;--%>
<%--        }--%>

<%--        // alert(myid);--%>

<%--        // 만약 사진을 선택하지 않았다면--%>
<%--        if (!$("#msgfileupload").val()){--%>
<%--            // 글만 작성 했을 때--%>
<%--            if (msg!=""){--%>
<%--                // alert(msg);--%>
<%--                ws.send(JSON.stringify({ // handler로 보내는 ajax. ws 라는게 websocket 서버로 보내는 역할--%>
<%--                    // handleTextMessage method로 보내는 것.--%>
<%--                    "room_num" : room_num,--%>
<%--                    "msg" : msg,--%>
<%--                    "myid" : myid,--%>
<%--                    "type" : "chat"--%>
<%--                }));--%>
<%--            } else { // 아무것도 작성하지 않을 때--%>
<%--                alert("메시지를 입력해 주세요.");--%>
<%--            }--%>
<%--        } else {--%>
<%--            // 사진부터 업로드..--%>
<%--            var form=new FormData();--%>
<%--            form.append("upload",$("#msgfileupload")[0].files[0]); // 선택한 1개만 추가--%>

<%--            $.ajax({--%>
<%--                type:"post",--%>
<%--                dataType: "json",--%>
<%--                url: "/chat/fileupload",--%>
<%--                processData: false,--%>
<%--                contentType:false,--%>
<%--                data: form,--%>
<%--                success:function (res){--%>
<%--                    ws.send(JSON.stringify({--%>
<%--                        "room_num" : room_num,--%>
<%--                        "msg" : res.upload,--%>
<%--                        "myid" : myid,--%>
<%--                        "type" : "img"--%>
<%--                    }));--%>

<%--                    $(".messagefilepreview").hide();--%>
<%--                    $("#msgfileupload").val(null);--%>
<%--                }--%>
<%--            });--%>

<%--            // 메시지도 적었다면 한번 더 전송--%>
<%--            if (msg!=""){--%>
<%--                ws.send(JSON.stringify({--%>
<%--                    "room_num" : room_num,--%>
<%--                    "msg" : msg,--%>
<%--                    "myid" : myid,--%>
<%--                    "type" : "chat"--%>
<%--                }));--%>
<%--            }--%>
<%--        }--%>

<%--        getChatting(room_num);--%>
<%--        $("#chatShow.chating").focus(getChatting(room_num));--%>
<%--        $("#chatting").val("");--%>

<%--    }--%>

<%--</script>--%>
<%--<body>--%>

<%--<div class="chatting-box">--%>
<%--    <div class="room-name-box">--%>
<%--        <h1 class="room-name">${roomName} 문의하기</h1>--%>
<%--    </div>--%>

<%--    <input type="hidden" id="room_num" value="${room_num}">--%>
<%--    &lt;%&ndash;    채팅이 보이는 구간    &ndash;%&gt;--%>
<%--    <div class="chatlist">--%>
<%--        <div id="chatShow" class="chating"></div>--%>
<%--    </div>--%>
<%--    <div class="messagefilepreview"></div>--%>
<%--    <div class="footer-outline-box">--%>
<%--    <div class="messagefooter">--%>
<%--        <div class="chatinputbox d-inline-flex">--%>
<%--            <input type="text" id="chatting" placeholder="채팅 입력">&nbsp;&nbsp;--%>
<%--            <i class="bi bi-send" onclick="send()" id="sendBtn"></i>--%>
<%--        </div>--%>
<%--        &lt;%&ndash;     이모지 시작       &ndash;%&gt;--%>
<%--        <div class="chatemoji d-inline-flex">--%>
<%--            &lt;%&ndash; 이모지 버튼 &ndash;%&gt;--%>
<%--            <i class="bi bi-emoji-smile emoji_pickup emoji_i" id="emoji_pickup_before"></i>--%>
<%--            <i class="bi bi-emoji-smile-fill emoji_pickup emoji_i" id="emoji_pickup_after"></i>&nbsp;&nbsp;--%>
<%--&lt;%&ndash;            <img class="emoji_pickup" id="emoji_pickup_before" src="/messagejscss/img/emoji/1f642.png">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <img class="emoji_pickup" id="emoji_pickup_after" src="/messagejscss/img/emoji/1f600.png">&ndash;%&gt;--%>
<%--            &lt;%&ndash; 첨부파일 버튼 &ndash;%&gt;--%>
<%--            <div class="chatupload">--%>
<%--            <input type="file" accept="image/jpeg,.png,.gif,.jpg" id="msgfileupload" style="display: none;">--%>
<%--            <i class="bi bi-image chatuploadicon" style="font-size: 2em;"></i>--%>
<%--            </div>--%>
<%--            <div id="emoji_popup">--%>
<%--&lt;%&ndash;                emoji popup div start &ndash;%&gt;--%>
<%--                <div id="people">--%>
<%--                    <h5>People</h5>--%>
<%--                </div>--%>
<%--                <span class="emoji_list" id="&#x1F601;">&#x1F601;</span>--%>
<%--                <span class="emoji_list" id="&#x1F602;">&#x1F602;</span>--%>
<%--                <span class="emoji_list" id="&#x1F603;">&#x1F603;</span>--%>
<%--                <span class="emoji_list" id="&#x1F604;">&#x1F604;</span>--%>
<%--                <span class="emoji_list" id="&#x1F605;">&#x1F605;</span>--%>
<%--                <span class="emoji_list" id="&#x1F606;">&#x1F606;</span>--%>
<%--                <span class="emoji_list" id="&#x1F609;">&#x1F609;</span>--%>
<%--                <span class="emoji_list" id="&#x1F60A;">&#x1F60A;</span>--%>
<%--                <span class="emoji_list" id="&#x1F60B;">&#x1F60B;</span>--%>
<%--                <span class="emoji_list" id="&#x1F60C;">&#x1F60C;</span>--%>
<%--                <span class="emoji_list" id="&#x1F60D;">&#x1F60D;</span>--%>
<%--                <span class="emoji_list" id="&#x1F60F;">&#x1F60F;</span>--%>
<%--                <span class="emoji_list" id="&#x1F612;">&#x1F612;</span>--%>
<%--                <span class="emoji_list" id="&#x1F613;">&#x1F613;</span>--%>
<%--                <span class="emoji_list" id="&#x1F614;">&#x1F614;</span>--%>
<%--                <span class="emoji_list" id="&#x1F616;">&#x1F616;</span>--%>
<%--                <span class="emoji_list" id="&#x1F618;">&#x1F618;</span>--%>
<%--                <span class="emoji_list" id="&#x1F61A;">&#x1F61A;</span>--%>
<%--                <span class="emoji_list" id="&#x1F61C;">&#x1F61C;</span>--%>
<%--                <span class="emoji_list" id="&#x1F61D;">&#x1F61D;</span>--%>
<%--                <span class="emoji_list" id="&#x1F61E;">&#x1F61E;</span>--%>
<%--                <span class="emoji_list" id="&#x1F620;">&#x1F620;</span>--%>
<%--                <span class="emoji_list" id="&#x1F621;">&#x1F621;</span>--%>
<%--                <span class="emoji_list" id="&#x1F622;">&#x1F622;</span>--%>
<%--                <span class="emoji_list" id="&#x1F623;">&#x1F623;</span>--%>
<%--                <span class="emoji_list" id="&#x1F624;">&#x1F624;</span>--%>
<%--                <span class="emoji_list" id="&#x1F625;">&#x1F625;</span>--%>
<%--                <span class="emoji_list" id="&#x1F628;">&#x1F628;</span>--%>
<%--                <span class="emoji_list" id="&#x1F629;">&#x1F629;</span>--%>
<%--                <span class="emoji_list" id="&#x1F62A;">&#x1F62A;</span>--%>
<%--                <span class="emoji_list" id="&#x1F62B;">&#x1F62B;</span>--%>
<%--                <span class="emoji_list" id="&#x1F62D;">&#x1F62D;</span>--%>
<%--                <span class="emoji_list" id="&#x1F630;">&#x1F630;</span>--%>
<%--                <span class="emoji_list" id="&#x1F631;">&#x1F631;</span>--%>
<%--                <span class="emoji_list" id="&#x1F632;">&#x1F632;</span>--%>
<%--                <span class="emoji_list" id="&#x1F633;">&#x1F633;</span>--%>
<%--                <span class="emoji_list" id="&#x1F635;">&#x1F635;</span>--%>
<%--                <span class="emoji_list" id="&#x1F637;">&#x1F637;</span>--%>
<%--&lt;%&ndash;                emoji popup div end &ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>
<%--&lt;%&ndash;        이모지 끝 &ndash;%&gt;--%>
<%--    </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>