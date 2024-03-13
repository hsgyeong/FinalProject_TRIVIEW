//package sist.last.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//import sist.last.chat.Room;
//import sist.last.dto.ChatDto;
//
//import javax.servlet.http.HttpSession;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.stream.Collectors;
//
//@Controller // 이 클래스가 Spring MVC의 컨트롤러 임을 나타내는 어노테이션이다.
//@RequestMapping("/chat") // 이 컨트롤러의 기본 URL 정보가 "/chat" 임을 지정합니다.
//public class ChatControllerBackup {
//
//
//    @RequestMapping("/room1")
//    public ModelAndView loginCheck(HttpSession session){
//        ModelAndView mv=new ModelAndView();
//        String loginok=(String) session.getAttribute("loginok");
//        String info_id=(String) session.getAttribute("info_id");
//        String business_id=(String) session.getAttribute("business_id");
//        String admin_id=(String) session.getAttribute("admin_id");
//
//        // 관리자 아이디 가져오고, 관리자도 구분하여야 함.
//        if (loginok==null&&info_id==null&&business_id==null){
//            mv.setViewName("/login/loginForm");
//        } else if (admin_id!=null) {
//            mv.setViewName("/chat/room");
//        } else if (info_id!=null||business_id!=null){
//            mv.setViewName("/chat/room");
//        }
//        return mv;
//    }
//
//
//    List<Room> roomList = new ArrayList<Room>(); // 방 정보를 저장하는 리스트
//    static int roomNumber = 0; // 방 번호 관리하는 변수, 0으로 초기화
//
//    @RequestMapping("/chat")
//    public ModelAndView chat() {
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("/chat/chat");
//        return mv;
//    }
//
//    /**
//     * 방 페이지
//     * @return
//     */
////    @RequestMapping("/room1")
////    public ModelAndView room() {
////        ModelAndView mv = new ModelAndView();
////        mv.setViewName("/chat/room");
////        return mv;
////    }
//
//    /**
//     * 방 생성하기
//     * @param params
//     * @return
//     */
//    @RequestMapping("/createRoom") // '/chat/createRoom'경로로  POST 요청이 오면 호출되는 메서드로, 새로운 채탕방을 생성합니다. 생성된 방은 'roomList'에 추가되고, 현재까지 생성된 모든 방의 목록이 클라이언트에게 반환됩니다.
//    public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){ // '@ResponseBody' : 메서드의 반환 값이 HTTP 응답 본문에 직접 포함되어야 함을 나타내는 어노테이션입니다.
//        // 'createRoom' 메서드 파라미터 : @RequestParam HashMap<Object, Object> params' : 요청 파라미터를 담을 'HashMap' 입니다. 여기서는 방 이름을 받아옵니다.
//        String roomName = (String) params.get("roomName"); // 요청 파라미터에서 "roomName"을 추출합니다.
//        if(roomName != null && !roomName.trim().equals("")) { // 방 이름이 유효한지 확인합니다. 비어있지 않고 null이 아닌 경우에만 실행됩니다.
//            Room room = new Room(); // 새로운 Room 객체를 생성합니다.
//            room.setRoomNumber(++roomNumber); // 정적변수 roomNumber를 증가시켜서 방 번호를 설정합니다.
//            room.setRoomName(roomName); // 방 이름을 설정합니다.
//            roomList.add(room); // 새로운 방을 방 리스트에 추가합니다.
//        }
//        return roomList; // 방 리스트를 클라이언트에게 반환합니다. 이를 통해 클라이언트는 방 목록을 업데이트하고 새로 생성된 방을 확인할 수 있습니다.
//    }   // 이 메서드는 클라이언트의 요청에 따라 새로운 채팅 방을 생성하고, 생성된 방의 목록을 응답으로 보내어 클라이언트 측에서 방 목록을 갱신할 수 있도록 합니다.
//
//    /**
//     * 방 정보가져오기
//     * @param params
//     * @return
//     */
//    @RequestMapping("/getRoom") // 'getRoom' 경로로 GET 요청이 오면 호출되는 메소드로, 현재 생성된 모든 방의 정보를 반환합니다.
//    public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
//        return roomList;
//    }
//    // return roomList : 현재까지 생성된 모든 방의 목록인 'roomList'를 클라이언트에게 반환합니다.
//    // 이 메서드는 클라이언트의 요청에 따라 현재까지 생성된 모든 채팅 방의 목록을 밚환하고, 클라이언트에서는 이 정보를 활용하여 사용 가능한 모든 방을 표시하거나 업데이트 할 수 있습니다.
//
//    /**
//     * 채팅방
//     * @return
//     */
//
//    // 이 코드는 '/chat/moveChating' 경로로의 요청을 처리하는 메서드입니다. 클라이언트가 이 엔드포인트로 GET 또는 POST 요청을 보내면, 해당 방의 채팅 화면으로 이동하기 위한 처리를 수행합니다.
//    @RequestMapping("/moveChating") // "/moveChating" 경로로 접근 시 특정 방의 채팅 화면으로 이동하기 위한 메서드 입니다.
//    public ModelAndView chating(@RequestParam HashMap<Object, Object> params) { // params라는 요청 파라미터에서 roomNumber를 읽어와 해당 방의 정보를 찾고, 채팅 화면으로 이동합니다.
//        ModelAndView mv = new ModelAndView();
//        int roomNumber = Integer.parseInt((String) params.get("roomNumber")); // 요청 파라미터에서 "rommNumber"를 읽어와 정수형으로 변환합니다.
//
//        List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList()); // 'roomNumber'와 일치하는 방을 'roomList'에서 찾아 'new_list'에 저장합니다.
//        if(new_list != null && new_list.size() > 0) { // 'new_list'가 비어있지 않고 적어도 하나 이상의 방이 존재하면, 해당 방의 정보를 채팅 화면으로 전달하기 위해 modelAndView에 추가합니다.
//            mv.addObject("roomName", params.get("roomName"));
//            mv.addObject("roomNumber", params.get("roomNumber"));
//            mv.setViewName("/chat/chat");
//        }else {
//            mv.setViewName("/chat/room"); // 'new_list'각 비어있다면, 방이 존재하지 않는 경우입니다. 방이 존재하지 않을 경우, 방을 생성하는 화면을 나타내는 뷰의 이름을 설정합니다.
//        }
//        return mv; // 최종적으로 구성된 ModelAndView를 반환합니다. 클라이언트는 이를 통해 채팅 화면으로 이동하거나 방을 생성하는 화면을 보게 됩니다.
//        // 이 메서드는 클라이언트에서 요청된 방 번호에 해당하는 방이 존재하면 해당 방의 채팅 화면으로 이동하고, 방이 존재하지 않으면 방을 생성하는 화면을 보여줍니다.
//    }
//}
//
