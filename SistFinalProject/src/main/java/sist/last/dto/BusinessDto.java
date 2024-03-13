package sist.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("business")
public class BusinessDto {

	private int idx;
	private String business_id;
	private String business_pass;
	private String business_name;
	private String business_company;
	private String business_hp;
	private String business_email;
}
