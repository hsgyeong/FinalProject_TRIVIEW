package sist.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("RoomDto")
public class RoomDto {

	private int room_num;
	private int accom_num;
	private String room_name;
	private int room_price;
	private int room_minpeople;
	private int room_maxpeople;
	private String room_location;
	private String room_photo;
	private int room_count;
	private String room_checkin;
	private String room_checkout;
}
