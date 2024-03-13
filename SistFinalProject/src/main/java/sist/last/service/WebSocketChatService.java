//package sist.last.service;
//
//import org.springframework.stereotype.Service;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//import java.util.Collections;
//import java.util.HashSet;
//import java.util.Set;
//
//@Service
//@ServerEndpoint(value = "/chat")
//public class WebSocketChatService {
//
//    private static Set<Session> clients= Collections.synchronizedSet(new HashSet<>());
//
//    @OnMessage
//    public void onMessage(String msg, Session session) throws Exception{
//        System.out.println("receive message : "+msg);
//        for(Session s:clients){
//            System.out.println("send data : "+msg);
//            s.getBasicRemote().sendText(msg);
//        }
//    }
//
//    @OnOpen
//    public void onOpen(Session session){
//        System.out.println("open session : "+session.toString());
//        if (!clients.contains(session)){
//            clients.add(session);
//            System.out.println("session open : "+session);
//        } else {
//            System.out.println("이미 연결된 session 입니다.");
//        }
//    }
//
//    @OnClose
//    public void onClose(Session session){
//        System.out.println("session close : "+session);
//        clients.remove(session);
//    }
//
//}
