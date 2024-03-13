package sist.last.service;

import java.util.HashMap;

import sist.last.dto.MemberDto;

public interface KakaoMemberServiceInter {

	public String getAccessToken(String authorization_code) throws Exception;
	public HashMap<String, Object> getUserInfo(String access_token) throws Throwable;
	public void kakaoLogout(String access_token); 
	public MemberDto getDataByKakao(String kakao_id);
	public void insertKakaoMember (MemberDto memberDto);
	public int getSearchKakaoId(String kakao_id);
	public MemberDto getDataByKakaoId(String loggedKakaoId);

}
