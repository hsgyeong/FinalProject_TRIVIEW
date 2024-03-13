package sist.last.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReviewDto")
public class ReviewDto {

	private int review_num;
	private String info_id;
	private String review_info;
	private double review_score;
	private int accom_num;
	private Timestamp review_write;
}
