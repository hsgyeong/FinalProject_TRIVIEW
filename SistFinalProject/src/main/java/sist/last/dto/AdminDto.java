package sist.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("adminDto")
public class AdminDto {

	public String admin_id;
	public String admin_pass;
	public String admin_name;
	public String admin_hp;
}
