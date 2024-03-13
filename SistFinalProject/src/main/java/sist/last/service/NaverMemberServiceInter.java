package sist.last.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import sist.last.dto.MemberDto;


public interface NaverMemberServiceInter {

	public String getAccessToken(String authorization_code, String state);
	public JsonNode getNaverUserInfo(String authorization_code, String state);
	public int getSearchNaverId(String naver_id);
	public MemberDto getDataByNaverId(String loggedNaverId);
	public void insertNaverMember(MemberDto memberDto);
	public void naverLogout(String authorization_code);
}
