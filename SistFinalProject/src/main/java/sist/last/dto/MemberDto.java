package sist.last.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("member")
public class MemberDto {

	private String info_id;
	private String info_name;
	private String info_nickname;
	private String info_pass;
	private String info_hp;
	private String info_email;
	private String info_birth;
	private int info_coupon;
	private int info_point;
	private Timestamp info_gaipday;
	
	//kakao
	public String kakao_id;
	public String kakao_nickname;    //만약 홈페이지에 홍성경이라는 닉네임이 이미 존재하는데 카카오로 회원가입 할 때 홍성경이라는 닉네임이 넘어갈때 동일하기 때문에 가입 못하게 됨. 근데 어차피 db에 들어가는건 같잖아..? 아 
	public String kakao_gaipday;
	
	//naver
	public String naver_id;
	public String naver_nickname;
	public String naver_name;
	public String naver_email;
	public String naver_hp;
	
}
