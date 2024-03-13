package sist.last.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;

import com.fasterxml.jackson.databind.JsonNode;

import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;

@Repository
@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public int loginPassCheck(Map<String, String> map);
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
	
	public ReserveDto getReservationDataById(String info_id);

	//kakao
	public String getAccessToken(String authorization_code) throws Exception;
	public HashMap<String, Object> getUserInfo(String access_token) throws Throwable;
	public MemberDto getDataByKakao(String kakao_id);
	public void kakaoLogout(String access_token);
	public void insertKakaoMember(MemberDto memberDto);
	public int getSearchKakaoId(String kakao_id);
	public MemberDto getDataByKakaoId(String loggedKakaoId);
	
	//naver
	public String getAccessToken(String authorization_code, String state);
	public JsonNode getNaverUserInfo(String authorization_code, String state);
	public int getSearchNaverId(String naver_id);
	public MemberDto getDataByNaverId(String loggedNaverId);
	public void insertNaverMember(MemberDto memberDto);
	public void naverLogout(String authorization_code);
	
}
