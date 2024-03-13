//package boot.data.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.StringTokenizer;
//import java.util.TimeZone;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import boot.data.Dto.MessageDto;
//import boot.data.Dto.MessageRoomDto;
//import boot.data.Dto.SangpumDto;
//import boot.data.service.MessageRoomService;
//import boot.data.service.MessageService;
//import boot.data.service.SangpumService;
//import boot.data.service.UserService;
//
//@Controller
//public class MessageController {
//
//    @Autowired
//    MessageService mservice;
//
//    @Autowired
//    UserService uservice;
//
//    @Autowired
//    MessageRoomService roomservice;
//
//    @Autowired
//    SangpumService sangservice;
//
//
//    @GetMapping("/goChattingRoom")
//    public String goChattingRoom(@RequestParam(defaultValue = "0") int sangidx, Model model, HttpSession session) {
//        //System.out.println(sangidx);
//        //1.sangidx=0이면 상품선택없이 본인의 채팅 전부 출력, 2.sangidx!=0이면 해당 상품의 채팅방을 출력 but 판매자는 다수 일 수 있고, 구매자는 하나만 가질 수 있기에 방이 없으면 생성해 줌
//
//        String user_id=(String)session.getAttribute("myid");//로그인 user
//
//        if(user_id.equals("guest")) {
//            return "/loginform";
//        }
//
//        if(sangidx!=0) {//상품을 선택
//            if(!sangservice.getSangpumById(sangidx).getMember_id().equals(user_id)){//판매자 구매자 상품으로 하나의 방만 있어야 됨, other은 sender_id로 구매자
//
//                if(roomservice.getRoomBySangIdxAndUserId(sangidx, user_id)==null) {//방이 없다면, 생성해 줌
//                    MessageRoomDto dto = new MessageRoomDto();
//                    dto.setJ_sangid(sangidx);
//                    dto.setReceiver_id(sangservice.getSangpumById(sangidx).getMember_id());//상품의 판매자가 채팅방의 receiver가 됨
//                    dto.setSender_id(user_id);
//                    roomservice.insertRoom(dto);//새로운 방 생성
//                }
//            }
//
//            SangpumDto sangpum = sangservice.getSangpumById(sangidx);
//            StringTokenizer st = new StringTokenizer(sangservice.getSangpumById(sangidx).getJ_imageurl(),",");
//            String photo = st.nextToken();
//            sangpum.setJ_imageurl(photo);
//            model.addAttribute("sangpum", sangpum);
//
//        }
//
//        model.addAttribute("sangidx", sangidx);
//
//        return "/2/jsp/chatdesign";
//    }
//
//    //채팅방 가져오기
//    @GetMapping("/message/getMessageList")
//    @ResponseBody
//    public List<MessageRoomDto> getMessageList(@RequestParam String sangidx, @RequestParam String user_id){
//
//        List<MessageRoomDto> rooms = roomservice.selectAllRooms(user_id, sangidx);
//
//        for(MessageRoomDto dto:rooms) {
//            //채팅방에서 마지막 메시지를 얻고
//            int recentMessNum = mservice.getRecentMessageByRoom(dto.getRoom_num());
//            //상품들의 이미지 가져오기
//            String sangpumimgs = sangservice.getSangpumById(dto.getJ_sangid()).getJ_imageurl();
//            StringTokenizer st = new StringTokenizer(sangpumimgs,",");
//            String photo = st.nextToken();
//
//            if(recentMessNum==0) {//방은 있지만 아직 채팅을 나눈적 없음
//                dto.setRecent_mess("");
//                dto.setSang_img("user_noimg.PNG");
//            }else {
//                //얻은 메시지를 해당 룸의 마지막 메시지로 설정
//                dto.setRecent_mess(mservice.getMessageByNum(recentMessNum).getMess_content());
//                dto.setSang_img(photo);
//            }
//
//            //방 별 읽지않은 메시지 개수 출력(알림)
//            int unReadMessCnt = mservice.unReadMessByRoom(user_id,dto.getRoom_num());
//            //System.out.println(unReadMessCnt);
//            dto.setMess_alarmCnt(unReadMessCnt);
//
//        }
//
//        return rooms;
//    }
//
//    @GetMapping("/message/alarmRead")
//    @ResponseBody
//    public void alarmRead(@RequestParam int room_num, HttpSession session) {
//
//        String user_id = (String)session.getAttribute("myid");
//
//        List<MessageDto> chat=new ArrayList<>();
//
//        //해당 채팅방의 모든 메시지를 가져옴
//        chat = mservice.selectAllChatByRoom(room_num);
//
//        for(MessageDto mess:chat) {
//            //가져온 메시지에서 메시지 받는 사람이 현재 로그인한 사용자와 같다면 db의 readCnt를 0으로 변경
//            if(mess.getReceiver_id().equals(user_id)) {
//                mservice.messageReadByNum(mess.getMess_num());
//            }
//        }
//
//    }
//
//
//    @GetMapping("/message/chatting")
//    @ResponseBody
//    public List<MessageDto> chatting(@RequestParam(required = false) int room_num, HttpSession session){
//
//        try {
//            Thread.sleep(100); //0.1초 기다리기
//        } catch (InterruptedException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        //사용자의 id 받기
//        String myid=(String)session.getAttribute("myid");
//
//        List<MessageDto> chat=new ArrayList<>();
//
//        //해당 채팅방의 모든 메시지를 가져옴
//        chat = mservice.selectAllChatByRoom(room_num);
//        //Collections.reverse(chat);//역정렬
//
//        //채팅 시간
//        //대화 시간 오늘 날짜에서 빼기(몇 초전... 몇 분 전...)
//        for(MessageDto dto:chat) {
//            Date today=new Date();
//            /* System.out.println(today); */
//            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
//            Date writeday=new Date();
//            try {
//                writeday=sdf.parse(dto.getMess_writeday().toString());
//                /* System.out.println(writeday); */
//            } catch (ParseException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//
//            long diffSec=(today.getTime()-writeday.getTime());
//            //diffSec-=32400000L; //DB에 now()로 들어가는 시간이 9시간 차이 나서 빼줌
//            /*System.out.println(diffSec); */
//
//            //일시분초
//            long day=(diffSec/(60*60*24*1000L))%365;
//            long hour=(diffSec/(60*60*1000L))%24;
//            long minute=(diffSec/(60*1000L))%60;
//            long second=(diffSec/1000L)%60;
//
//            String preTime="";
//
//            if(day!=0) {
//                //하루 이상이 지났으면 일수만 표시
//                preTime=""+day+"일 전";
//            }else {
//                if(hour!=0) {
//                    //1시간 이상이 지났으면 시(hour)만 표시
//                    preTime=""+hour+"시간 전";
//                }else {
//                    if(minute!=0) {
//                        //1분 이상이 지났으면 분만 표시
//                        preTime=""+minute+"분 전";
//                    }else {
//                        //1분 미만 초만 표시
//                        preTime="방금전";
//                    }
//                }
//            }
//
//            dto.setMess_time(preTime);; //시간 다시 넣어주기
//        }
//        ////////////
//
//        for(MessageDto mess:chat) {
//            //가져온 메시지에서 메시지 받는 사람이 현재 로그인한 사용자와 같다면 db의 readCnt를 0으로 변경
//            if(mess.getReceiver_id().equals(myid)) {
//                mservice.messageReadByNum(mess.getMess_num());
//            }
//        }
//
//        return chat;
//
//    }
//
//    @GetMapping("/message/chatProfile")
//    @ResponseBody
//    public SangpumDto chatProfile(@RequestParam(required = false) int room_num) {
//        SangpumDto sangpum = sangservice.getSangpumById(roomservice.getRoomById(room_num).getJ_sangid());
//
//        StringTokenizer st = new StringTokenizer(sangpum.getJ_imageurl());
//        sangpum.setJ_imageurl(st.nextToken(","));
//        return sangpum;
//    }
//
//
//    @PostMapping("/message/fileupload")
//    @ResponseBody
//    public Map<String,String> fileuUpload(@RequestParam MultipartFile upload,HttpSession session)
//    {
//        Map<String, String> map=new HashMap<>();
//
//        //저장경로
//        String path=session.getServletContext().getRealPath("/messagephoto");
//        //파일 이름
//        String fileName=upload.getOriginalFilename();
//
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
//
//        String uploadName="msg_"+sdf.format(new Date())+fileName; //저장할 파일명
//
//        //저장
//        try {
//            upload.transferTo(new File(path+"\\"+uploadName));
//        } catch (IllegalStateException | IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        map.put("upload", uploadName);
//
//        return map;
//    }
//
//    @GetMapping("/message/totalAlarm")
//    @ResponseBody
//    public int totalAlarm(@RequestParam String user_id) {
//        return mservice.totalUnreadMessByUserID(user_id);
//    }
//
//
//}