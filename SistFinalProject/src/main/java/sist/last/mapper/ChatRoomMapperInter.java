package sist.last.mapper;

import org.apache.ibatis.annotations.Mapper;
import sist.last.dto.ChatRoomDto;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatRoomMapperInter {
    public int getMaxNum();
    public void insertChatRoom(String senderid); // 채팅방 생성
    public List<ChatRoomDto> selectChatRoom(); // 채팅방 출력
    public String getSenderId(String senderid); // 채팅방에 내 아이디로 된 채팅 방 있는지 찾기
    public ChatRoomDto getChatRoom(int room_num); // room_num 에 해당하는 방 정보 가져오기

    public String checkChatRoom(Map<String,Object>map); // 로그인한 사용자가 선택한 방의 판매자와 채팅한 방이 있는지 확인하기
    public void insertRoom(ChatRoomDto chatRoomDto); // sender_id는 현재 로그인한 사용자(sender)이고, receiver_id는 상품의 판매자가 됨
    public List<ChatRoomDto> getChatRoomByUser(String sender_id); // user 아이디에 대한 채팅방의 리스트
    public List<ChatRoomDto> getChatRoomByAccom(int accom_num);
    public int getChatRoomByAccomAndSender(Map<String,Object>map);
    public List<ChatRoomDto> getChatRoomListByReceiverId(String receiver_id);
    public String getChatRoomNameByAccomAndSender(Map<String,Object>map);

}
