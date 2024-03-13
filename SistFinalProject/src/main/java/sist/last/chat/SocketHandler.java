//package sist.last.chat;
//
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;
//import org.springframework.stereotype.Component;
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import java.util.HashMap;
//
//@Component
//public class SocketHandler extends TextWebSocketHandler {
//
//    HashMap<String,WebSocketSession> sessionMap=new HashMap<>(); // 웹소켓 세션을 담아둘 맵
//
//    @Override
//    public void handleTextMessage(WebSocketSession session, TextMessage message){
//        // 메시지 발송
//        String msg=message.getPayload();
//        for (String key:sessionMap.keySet()){
//            WebSocketSession wss=sessionMap.get(key);
//            try {
//                wss.sendMessage(new TextMessage(msg));
//            } catch (Exception e){
//                e.printStackTrace();
//            }
//        }
//    }
//
//    @SuppressWarnings("uncheked")
//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception{
//        // 소켓 연결
//        super.afterConnectionEstablished(session);
//        sessionMap.put(session.getId(),session);
//
//        JSONObject obj=new JSONObject();
//        obj.put("type","getId");
//        obj.put("sessionId",session.getId());
//        session.sendMessage(new TextMessage(obj.toJSONString()));
//    }
//
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
//        // 소켓 종료
//        sessionMap.remove(session.getId());
//        super.afterConnectionClosed(session,status);
//    }
//
//    public static JSONObject JsonToObjectParser(String jsonStr){
//        JSONParser parser=new JSONParser();
//        JSONObject obj=null;
//
//            try {
//                obj=(JSONObject) parser.parse(jsonStr);
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//
//        return obj;
//    }
//}



//////////////////////////////////////////////////////////////////////
package sist.last.chat;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import sist.last.dto.ChatDto;
import sist.last.mapper.ChatMapperInter;
import sist.last.mapper.ChatRoomMapperInter;


// 구현체에 등록할 SocketHandler 입니다.
// 이 코드는 Spring Framework에서 WebSocket핸들러를 정의하는 'SocketHandler' 클래스 입니다. 이 핸들러는 웹소켓 연결, 메시지 수신, 소켓 종료 등과 관련된 로직을 구현하고 있습니다. 아래 코드는 주요 부분에 대한 설명입니다.

// afterConnectionEstablished 메소드는 웹소켓 연결이 되면 동작합니다.
// afterConnectionClosed 메소드는 반대로 웹소켓이 종료되면 동작합니다.
// handleTextMessage 메소드는 메시지를 수신하면 실행됩니다. 상속받은 TextWebSocketHandler는 handleTextMEssage를 실행시키며, 메시지 타입에 따라 HandleBinaryMessage 또는 handleTextMessage가 실행됩니다.

@Component
public class SocketHandler extends TextWebSocketHandler {

    HashMap<String,WebSocketSession> sessionMap=new HashMap<>(); // 웹 소켓 세션을 담아둘 맵

    @Autowired
    ChatMapperInter chatMapperInter;

    @Autowired
    ChatRoomMapperInter roomMapperInter;

    // 웹 소켓 연결이 되면 동작하는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결 시
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(),session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료 시
        sessionMap.remove(session.getId());
        super.afterConnectionClosed(session,status);
    }

    // 메시지를 발송하면 동작하는 메소드
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        String msg=message.getPayload();
//        System.out.println("gdgd"+msg);
        JSONObject ob=new JSONObject(msg);

        // 메시지 구분(보낸사람:내용), default로 채팅방에 receiver는 숙소 주인이 되고, sender는 구매자가 됨
        String myid=ob.getString("myid"); // 보낸사람
        int room_num=ob.getInt("room_num"); // 그룹
        String receiver=roomMapperInter.getChatRoom(room_num).getReceiver_id(); // 받는사람 num
        String content=ob.getString("msg"); // 내용
        String type=ob.getString("type");

        if (myid.equals(receiver)){ // 판매자가 채팅창에 들어올 때, 즉 구매자각 판매자의 메시지를 받는 사람이 됨.
            receiver=roomMapperInter.getChatRoom(room_num).getSender_id();
        }

        // 메시지 저장
        ChatDto chatDto=new ChatDto();

        String user_id=myid;
        chatDto.setSender_id(user_id);
        chatDto.setReceiver_id(receiver);
        chatDto.setRoom_num(room_num);

        // 사진을 보냈다면
        if (type.equals("img")){
            content="<img src='/chatsave/"+content+"'>";
        }
        chatDto.setMess_content(content);
        chatMapperInter.insertChat(chatDto);

        for (String key : sessionMap.keySet()){
            WebSocketSession wss=sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(msg));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

//
//
//
//
//
//
//    //HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
//    List<HashMap<String, Object>> rls = new ArrayList<>(); // 웹소켓 세션을 방 단위로 관리하기 위한 list ---roomListSessions. 각 항목은 방 번호와 해당 방에 속한 세션들의 맵입니다.
//    private static final String FILE_UPLOAD_PATH="/chatsave/";// 이미지 파일을 저장 할 디렉토리 경로입니다.
//    static int fileUploadIdx=0; // 이미지 파일 업로드시 사용되는 인덱스
//    static String fileUploadSession=""; // 이미지 파일 업로드시 사용되는 세션정보
//
//    @Override
//    public void handleTextMessage(WebSocketSession session, TextMessage message) {
//        // 이 메서드는 클라이언트로부터 메시지를 받았을 때 실행되는 부분입니다.
//        // 수신한 메시지를 JSON 형식으로 파싱한 후, 해당 메시지의 방 번호를 추출합니다.
//        // 방 번호에 해당하는 방의 세션 리스트에서 각 세션에게 메시지를 전송합니다.
//
//        //메시지 발송
//        String msg = message.getPayload(); // WebSocket에서 받은 메시지의 텍스트 내용을 가져옵니다.
//        JSONObject obj = jsonToObjectParser(msg); // 받은 텍스트를 JSON 형식으로 파싱하여 JSONObject로 변환합니다.
//
//        String rN = (String) obj.get("roomNumber"); // JSON 객체에서 'roomNumber' 키를 통해 방번호를 추출합니다.
//        HashMap<String, Object> temp = new HashMap<String, Object>(); // 방에 속한 세션들을 저장할 임시 맵입니다.
//        if(rls.size() > 0) { // 저장된 세션 리스트를 순회하며 해당 방의 세션들을 찾습니다.
//            for(int i=0; i<rls.size(); i++) {
//                String roomNumber = (String) rls.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
//                if(roomNumber.equals(rN)) { // 메시지에 명시된 방 번호와 같은값의 방이 존재한다면
//                    temp = rls.get(i); // 해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
//                    break;
//                }
//            }
//
//            //해당 방의 세션들만 찾아서 메시지를 발송해준다.
//            for(String k : temp.keySet()) {
//                if(k.equals("roomNumber")) { //다만 방번호일 경우에는 건너뛴다.
//                    continue;
//                }
//
//                WebSocketSession wss = (WebSocketSession) temp.get(k);
//                if(wss != null) {
//                    try {
//                        wss.sendMessage(new TextMessage(obj.toJSONString())); // 메시지를 해당 세션에게 전송
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        }
//    } // 찾은 세션들에게 수신한 메시지를 다시 전송하여 해당 방의 모든 클라이언트에게 메시지를 브로드캐스트 합니다.
//    // 브로드캐스트 : 자신의 호스트가 속해 있는 네트워크 전체를 대상으로 패킷을 전송하는 일대다 통신방식
//
//    @Override
//    public  void handleBinaryMessage(WebSocketSession session, BinaryMessage message){
//        // 클라이언트로부터 수신된 바이너리 메시지를 처리합니다.
//        // 파일 업로드를 수행하며, 서버에 이미지 파일을 저장하고 해당 이미지를 채팅방의 모든 세션에게 전송합니다.
//        // BinaryMessage : 처음에 웹 소켓을 시작하면서 서버단을 구성할 때, 구현체 부분인 SocketHandler 부분을 구성할때 TextWebSocketHandler를 상속받고 메시지 타입에 따라 handleBinaryMessage 또는 handlerTextMessage가 실행된다고 했는데, 지금까지 JSON 형태의 String메시지만 전송하다보니 바이너리메시지는 다룰일이 없었습니다. 이번 장에서는 바이너리메시지를 사용하여 파일을 받고 서버에 저장도 하고 채팅방에 전송된 이미지를 표출하는 부분까지 구성해보자
//        ByteBuffer byteBuffer=message.getPayload();
//        // message.getPayload() : WebSocket에서 받은 바이너리 메시지의 데이터를 가져옵니다.
//        // ByteBuffer : 데이터를 읽고 쓰기 위한 바이트 버퍼 입니다.
//
//        String fileName="temp.jpg"; // 저장할 파일 이름
//        File dir=new File(FILE_UPLOAD_PATH);
//
//        // 저장할 디렉터리가 없으면 생성!
//        if (!dir.exists()){
//            dir.mkdirs();
//        }
//
//        File file=new File(FILE_UPLOAD_PATH,fileName);
//        FileOutputStream out=null;
//        FileChannel outChannel=null;
//        try {
//            byteBuffer.flip(); // byteBuffer를 읽기 위해 세팅(버퍼를 읽기 모드로 전환합니다.)
//            out=new FileOutputStream(file,true); // 이미지 파일을 생성하기 위한 'FileOutputStream'을 초기화 합니다. 'true'는 파일을 이어씌 모드로 엽니다.
//            outChannel=out.getChannel(); // 채널을 열고
//            byteBuffer.compact(); // 파일을 복사한다. // 버퍼를 읽기모드로 전환하면서 읽은 데이터를 제외한 나머지 데이터를 버퍼의 앞쪽으로 이동시킵니다.
//            outChannel.write(byteBuffer); // 파일을 쓴다. // 파일에 데이터를 씁니다.
//        } catch (Exception e){
//            e.printStackTrace();
//        } finally {
//            try {
//                if (out!=null){
//                    out.close();
//                }
//                if (outChannel!=null){
//                    outChannel.close();
//                }
//            } catch (IOException e){
//                e.printStackTrace();
//            }
//        }
//        byteBuffer.position(0); // 파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
//
//        // 파일 쓰기가 끝나면 이미지를 발송한다.
//        HashMap<String,Object>temp=rls.get(fileUploadIdx);
//        for (String k:temp.keySet()){
//            if (k.equals("roomNumber")){
//                continue;
//            }
//            WebSocketSession wss=(WebSocketSession) temp.get(k);
//            try {
//                wss.sendMessage(new BinaryMessage(byteBuffer)); // 초기화된 버퍼를 발생힌다.
//            } catch (IOException e){
//                e.printStackTrace();
//            }
//        }
//    } // 이미지를 저장한 후 해당 이미지를 채팅방의 모든 세션에게 전송합니다. 파일을 발송하기 위해 'BinaryMessage'를 사용합니다.
//
//    @SuppressWarnings("unchecked")
//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        // 웹 소켓 연결이 성공적으로 이루어지면 호출되는 메서드 입니다.
//        // 연결된 세션을 등록하고, 해당 세션에게 세션 ID를 메시지로 전송합니다.
//
//        super.afterConnectionEstablished(session); // 부모 클래스의 메서드 호출
//
//        boolean flag = false;
//        String url = session.getUri().toString(); // 연결된 세션의 URI를 문자열로 가져옵니다.
//        System.out.println(url);
//        String roomNumber = url.split("/chating/")[1]; // URI에서 "/chating" 다음에 오는 부분을 추출하여 방 번호로 사용합니다.
//        int idx = rls.size(); //방의 사이즈를 조사한다.
//        if(rls.size() > 0) {
//            for(int i=0; i<rls.size(); i++) {
//                String rN = (String) rls.get(i).get("roomNumber");
//                if(rN.equals(roomNumber)) {
//                    flag = true;
//                    idx = i;
//                    break;
//                }
//            }
//        }
//
//        if(flag) { //존재하는 방이라면 세션만 추가한다. // 연결된 방이 이미 존재하는지 확인하고, 존재하면 해당 방에 세션을 추가하고, 존재하지 않으면 새로운 방을 생성하고 세션을 추가합니다.
//            HashMap<String, Object> map = rls.get(idx);
//            map.put(session.getId(), session);
//        }else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
//            HashMap<String, Object> map = new HashMap<String, Object>();
//            map.put("roomNumber", roomNumber);
//            map.put(session.getId(), session);
//            rls.add(map);
//        }
//
//        //세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
//        JSONObject obj = new JSONObject();
//        obj.put("type", "getId");
//        obj.put("sessionId", session.getId());
//        session.sendMessage(new TextMessage(obj.toJSONString()));
//    }
//
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//        // 웹 소켓 연결이 종료되면 호출되는 메서드입니다.
//        // 종료된 세션을 세션 리스트에서 제거합니다.
//        if(rls.size() > 0) { // 세션 리스트에 방이 존재하는지 확인합니다.
//            for(int i=0; i<rls.size(); i++) {
//                rls.get(i).remove(session.getId()); // 현재 세션 ID에 해당하는 세션을 세션 리스트에서 제거합니다.
//            }
//        }
//        super.afterConnectionClosed(session, status); // 부모 클래스의 'afterConnectionClosed' 메서드를 호출하여 정리 작업을 수행합니다.
//    }
//
//    // 주어진 JSON 형식의 문자열을 파싱하여 JSON 객체로 변환하는 메서드입니다.
//    private static JSONObject jsonToObjectParser(String jsonStr) { // JSON 형식의 문자열을 파싱하여 JSON 객체로 변환합니다.
//        JSONParser parser = new JSONParser(); // JSON데이터를 파싱하기 위핸 JSON파서 객체를 생성합니다.
//        JSONObject obj = null; // JSON 객체를 저장할 변수를 선언하고 초기화 합니다.
//        try {
//            obj = (JSONObject) parser.parse(jsonStr); // 주어진 JSON 문자열(jsonStr)을 'JSONParser'를 이용하여 파싱하고, 그 결과를 'JSONObject'로 캐스팅하여 'obj'에 저장합니다. 만약 파싱중에 오류가 발생하면 'ParseException'이 발생할 수 있습니다.
//            // 주어진 JSON 문자열을 파싱하여 JSON 객체로 변환합니다.
//        } catch (ParseException e) {
//            // ParseException이 발생하면 JSON 콘솔에 문자열을 파싱에 실패했음을 나타냅니다.
//            e.printStackTrace(); // 예외 정보를 출력합니다.
//        }
//        return obj; // 최종적으로 파싱된 JSON 객체를 반환합니다.
//    }

}