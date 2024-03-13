package sist.last.service;

import java.util.List;
import java.util.Map;

import org.springframework.validation.Errors;

import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public int loginPassCheck(String info_id, String info_pass);
	public MemberDto getDataById(String info_id);
	public int getSearchId(String info_id);
	public int getSearchNick(String info_nickname);
	public String getNickname(String info_id);
	public List<MemberDto> getAllMembers();
	public void updateMember(MemberDto dto);
	public void deleteMember(String info_id);
	public int getCouponCount(String info_id);
	public Map<String, String> validateHandling(Errors errors);
	public String getPasswordById(String info_id);
	
}
