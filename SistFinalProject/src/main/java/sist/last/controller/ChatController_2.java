//package sist.last.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import sist.last.dto.ChatRoomDto;
//import sist.last.mapper.ChatRoomMapperInter;
//
//import javax.servlet.http.HttpSession;
//import java.util.List;
//
//@Controller // 이 클래스가 Spring MVC의 컨트롤러 임을 나타내는 어노테이션이다.
//@RequestMapping("/chat") // 이 컨트롤러의 기본 URL 정보가 "/chat" 임을 지정합니다.
//public class ChatController_2 {
//
//    @Autowired
//    ChatRoomMapperInter roomMapperInter;
//
//    @RequestMapping("/room1")
//    public ModelAndView loginCheck(HttpSession session){
//        ModelAndView mv=new ModelAndView();
//        String loginok=(String) session.getAttribute("loginok");
//        String info_id=(String) session.getAttribute("info_id");
//        String business_id=(String) session.getAttribute("business_id");
//        String admin_id=(String) session.getAttribute("admin_id");
//        System.out.println(loginok);
//        System.out.println(info_id);
//        System.out.println(business_id);
//        System.out.println(admin_id);
//        ChatRoomDto chatRoomDto=new ChatRoomDto();
//        // 관리자 아이디 가져오고, 관리자도 구분하여야 함.
//        if (loginok==null&&info_id==null&&business_id==null) {
//            mv.setViewName("/login/loginForm");
//        } else if (admin_id!=null) {
//
//            List<ChatRoomDto> chatRoomDtoList = roomMapperInter.selectChatRoom();
//            for (ChatRoomDto chattingRoom: chatRoomDtoList) {
//                chatRoomDto.setRoomNumber(chatRoomDto.getRoomNumber());
//                chatRoomDto.setSenderId(chatRoomDto.getSenderId());
//                chatRoomDtoList.add(chatRoomDto);
//            }
//            mv.addObject("chatRoomDtoList", chatRoomDtoList);
//            mv.addObject("admin_id", admin_id);
//
//            mv.setViewName("/chat/room");
//
//        } else if (info_id!=null){
//            String info_idCheck=roomMapperInter.getSenderId(info_id);
//            if (info_idCheck==null) {
//                roomMapperInter.insertChatRoom(info_id);
//            }
//            chatRoomDto=roomMapperInter.getChatRoom(info_id);
////            System.out.println(chatRoomDto.getRoomNumber());
//            mv.addObject("chatRoomDto",chatRoomDto);
//            mv.setViewName("/chat/room");
//
//        } else if (business_id!=null){
//            String business_idCheck=roomMapperInter.getSenderId(info_id);
//            if (business_idCheck==null) {
//                roomMapperInter.insertChatRoom(business_id);
//            }
//            chatRoomDto=roomMapperInter.getChatRoom(business_id);
////            System.out.println(chatRoomDto.getRoomNumber());
//            mv.addObject("chatRoomDto",chatRoomDto);
//            mv.setViewName("/chat/room");
//        }
//
//        return mv;
//    }
//
//    @RequestMapping("/chat")
//    public ModelAndView chat() {
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("/chat/chat");
//        return mv;
//    }
//
//}
//
