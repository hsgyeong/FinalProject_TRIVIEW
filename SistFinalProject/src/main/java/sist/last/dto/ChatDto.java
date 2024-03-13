package sist.last.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("chatDto")
public class ChatDto {
    private int mess_num;
    private int room_num;
    private String sender_id;
    private String receiver_id;
    private String mess_content;
    private Timestamp mess_writeday;

    private String mess_time;
//    private int chatNum;
//    private int roomNumber;
//    private String senderId;
//    private String receiverId;
//    private String chatContent;
//    private String chatDate;
}
