package sist.last.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sist.last.chat.Room;
import sist.last.dto.AccomDto;
import sist.last.dto.ChatDto;
import sist.last.dto.ChatRoomDto;
import sist.last.mapper.AccomMapperInter;
import sist.last.mapper.ChatMapperInter;
import sist.last.mapper.ChatRoomMapperInter;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller // 이 클래스가 Spring MVC의 컨트롤러 임을 나타내는 어노테이션이다.
@RequestMapping("/chat") // 이 컨트롤러의 기본 URL 정보가 "/chat" 임을 지정합니다.
public class ChatController {

    @Autowired
    AccomMapperInter accomMapperInter;
    @Autowired
    ChatRoomMapperInter roomMapperInter;
    @Autowired
    ChatMapperInter chatMapperInter;



    @PostMapping("/createRoom")
    @ResponseBody
    public String createRoom(@RequestParam int accom_num,
                          @RequestParam String accom_name,
                          HttpSession session){
        String sender_id=(String) session.getAttribute("info_id");
        String business_id=(String)session.getAttribute("business_id");
        System.out.println(sender_id);
        System.out.println(business_id);
//        int loginCheckNum=0;
//        if (info_id!=null){
//            sender_id=info_id;
//        } else if (business_id!=null) {
//            sender_id=business_id;
//        }
        System.out.println("info_id: "+sender_id);
        // 판매자의 user_num을 찾을 수 있도록 수정해야 됨
//        String business_id="test2";
        String receiver_id=accomMapperInter.getOneData(accom_num).getBusiness_id();

        // 현재 채팅을 보내려는 사용자가 판매자이면 방을 생성할 수 없음
        if(sender_id==null&&business_id==null){
            return "logingogo";
        } else if (sender_id==null&&business_id!=null) {
            return "infogogo";
        } else {
            // 기존에 존재하는 채팅방이라면 그곳으로 이동
            Map<String,Object>map=new HashMap<>();
            map.put("sender_id",sender_id);
            map.put("accom_num",accom_num);
            map.put("accom_name",accom_name);
            String cheackRoomNum=roomMapperInter.checkChatRoom(map);

            if (cheackRoomNum!=null){
                return cheackRoomNum;
            } else { // 없다면 새로 방 생성후 생성된 방으로 이동
                ChatRoomDto chatRoomDto=new ChatRoomDto();
                chatRoomDto.setAccom_num(accom_num);
                chatRoomDto.setAccom_name(accom_name);
                chatRoomDto.setSender_id(sender_id);
                chatRoomDto.setReceiver_id(receiver_id);
                roomMapperInter.insertRoom(chatRoomDto);
                return String.valueOf(roomMapperInter.getMaxNum());
            }
        }
    }

    @GetMapping("/goSellerRooms")
    public ModelAndView goSellerRooms(@RequestParam int accom_num,
                                @RequestParam int room_num,
                                @RequestParam String accom_name,
                                Model model,
                                      HttpSession session){
        ModelAndView mv=new ModelAndView();

        String info_id=(String)session.getAttribute("info_id");
        String business_id=(String)session.getAttribute("business_id");
        String myid=(String) session.getAttribute("myid");
        String sender_id=null;

        if (info_id!=null){
            sender_id=info_id;
        } else if (business_id!=null) {
            sender_id=business_id;
        } else if (myid!=null) {
            sender_id=myid;
        }

        // list에 담아서 보내고.. 그걸 반복문으로 돌려서 찾는다.

        List<ChatRoomDto> chatRoomList=roomMapperInter.getChatRoomByAccom(accom_num);
        Map<String,Object>map=new HashMap<>();
        map.put("accom_num",accom_num);
        map.put("sender_id",sender_id);
        map.put("accom_name",accom_name);
        System.out.println(accom_num);
        System.out.println(room_num);
        System.out.println(accom_name);
//        room_num=roomMapperInter.getChatRoomByAccomAndSender(map).getRoom_num();
        room_num=roomMapperInter.getChatRoomByAccomAndSender(map);


        // goSellerRoom : 비지니스 아이디 막아버리고.
        // 비지니스 아이디 아닐때 뜨게 하고
        // 비지니스 아이디의 경우 list 뜨게 하기.

//        String roomName=accomMapperInter.getOneData(accom_num).getAccom_name();

        String roomName=accomMapperInter.getOneData(roomMapperInter.getChatRoom(room_num).getAccom_num()).getAccom_name();

//        mv.addObject("chatRoomList",chatRoomList);
//        mv.addObject("roomName",roomName);
//        mv.addObject("accom_num",accom_num);
//        mv.addObject("room_num",room_num);
//        mv.addObject("sender_id",sender_id);
//        room_num=chatRoomDto.getRoom_num();
//        System.out.println("이게 맞나?"+room_num);


        model.addAttribute("room_num",room_num);
        model.addAttribute("roomName",roomName);

        mv.setViewName("/chat/chat");

        return mv;
    }

    @GetMapping("/goChattingRoom")

    public String goChattingRoom(@RequestParam int room_num,
                                 Model model){
        String roomName=accomMapperInter.getOneData(roomMapperInter.getChatRoom(room_num).getAccom_num()).getAccom_name();

        model.addAttribute("room_num",room_num);
        model.addAttribute("roomName",roomName);

//        System.out.println(room_num);
//        System.out.println(roomName);

        return "/chat/chat";
    }

    @GetMapping("/chatting")
    @ResponseBody
    public List<ChatDto> chatting(@RequestParam(required = false)int room_num,
                                  HttpSession session){
        try {
            Thread.sleep(100);// 0.1초 기다리기
        } catch (InterruptedException e){
            e.printStackTrace();
        }
//        System.out.println("chatting 번호 확인"+room_num);

        // 사용자의 num 받기
        String info_id=(String)session.getAttribute("info_id");
        String business_id=(String)session.getAttribute("business_id"); 
        String myid=(String) session.getAttribute("myid");
        String sender_id=null;

        if (info_id!=null){
            sender_id=info_id;
        } else if (business_id!=null) {
            sender_id=business_id;
        } else if (myid!=null) {
            sender_id=myid;
        }

        List<ChatDto> chatList=new ArrayList<>();

        chatList=chatMapperInter.getAllChatByRoom(room_num);

        for (ChatDto chatDto:chatList){
            Date today=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
            Date writeday=new Date();
            try {
                writeday=sdf.parse(chatDto.getMess_writeday().toString());
            } catch (ParseException e){
                e.printStackTrace();
            }

            long diffSec=(today.getTime()-writeday.getTime());
//            diffSec-=

            // 일, 시, 분, 초
            long day=(diffSec/(60*60*24*1000L))%365;
            long hour=(diffSec/(60*60*1000L))%24;
            long minute=(diffSec/(60*1000L))%60;
            long second=(diffSec/1000L)%60;

            String preTime="";

            if(day!=0){
                // 하루 이상이 지났으면 일수만 표시
                preTime=""+day+"일 전";
            } else {
                if(hour!=0) {
                    //1시간 이상이 지났으면 시(hour)만 표시
                    preTime=""+hour+"시간 전";
                } else {
                    if(minute!=0) {
                        //1분 이상이 지났으면 분만 표시
                        preTime=""+minute+"분 전";
                    }else {
                        //1분 미만 초만 표시
                        preTime="방금 전";
                    }
                }
            }
            chatDto.setMess_time(preTime);
        }
        return chatList;
    }

    @PostMapping("/fileupload")
    @ResponseBody
    public Map<String,String> fileUpload(@RequestParam MultipartFile upload,
                                         HttpSession session){
        Map<String,String> map=new HashMap<>();

        // 저장 경로
        String path=session.getServletContext().getRealPath("/chatsave");

        // 파일 이름
        String fileName=upload.getOriginalFilename();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");

        String uploadName="msg_"+sdf.format(new Date())+fileName; // 저장할 파일명

        try {
            upload.transferTo(new File(path+"/"+uploadName));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        map.put("upload",uploadName);

        return map;
    }

    @GetMapping("/chatlist")
    public ModelAndView chatList(HttpSession session){
        ModelAndView mv=new ModelAndView();
        String receiver_id=(String) session.getAttribute("business_id");

        List<ChatRoomDto> chatRoomList=roomMapperInter.getChatRoomListByReceiverId(receiver_id);

//        List<AccomDto> ChatRoomName=accomMapperInter.getAccomDataById(receiver_id);
//        System.out.println(chatRoomList);


        mv.addObject("chatRoomList",chatRoomList);
//        mv.addObject("ChatRoomName",ChatRoomName);

        mv.setViewName("/chat/room");

        return mv;
    }

//    @PostMapping("/loginCheckForChat")
//    public ModelAndView loginCheckForChat(HttpSession session,
//                                          @RequestParam int accom_num){
//        // sender_id == info 일때,
//        // sender_id == business 일때,
//        // 위 두가지 모두 상황 보고 넘겨줘야 한다.
//
//        ModelAndView mv=new ModelAndView();
//
//        String info_id=(String) session.getAttribute("info_id");
//        String business_id=(String) session.getAttribute("business_id");
//
//        if (info_id==null && business_id==null){
//            mv.setViewName("/login/loginForm");
//        } else if (info_id!=null && business_id==null) {
//            mv.addObject("sender_id",info_id);
//        } else if (info_id==null && business_id!=null) {
//            mv.addObject("sender_id",business_id);
//        }
//        return mv;
//
//    }

}

