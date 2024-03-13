package sist.last.mapper;

import org.apache.ibatis.annotations.Mapper;
import sist.last.dto.ChatDto;

import java.util.List;

@Mapper
public interface ChatMapperInter {

    public List<ChatDto> getAllChatByRoom(int room_num);
    public void insertChat(ChatDto chatDto);
    public void deleteChat(int mess_num);
    public int getMaxNumByChat();
    public void deleteChatByChatRoom(int room_num);

}
