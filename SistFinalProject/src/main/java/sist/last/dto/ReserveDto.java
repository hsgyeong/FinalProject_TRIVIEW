package sist.last.dto;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reserveDto")
public class ReserveDto {

	private int idx;
	private String reserve_id;
	private String info_id;
	private String accom_name;
	private String room_name;
	private String reserve_name;
	private String reserve_hp;
	private int room_num;
	private int accom_num;
	private int reserve_amount;
	private String reserve_checkin;
	private String reserve_checkout;
	private String reserve_status;
	private String reserve_coupon;
	private java.sql.Timestamp reserve_day;
	private int count;
}
