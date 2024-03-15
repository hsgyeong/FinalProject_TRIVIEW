package sist.last.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import sist.last.dto.MemberDto;
import sist.last.mapper.MemberMapperInter;

@Service
public class NaverMemberService implements NaverMemberServiceInter {

	@Autowired
	MemberMapperInter memberMapperInter;
	
	@Override
	public String getAccessToken(String authorization_code, String state) {
		
		final String reqUrl = "https://nid.naver.com/oauth2.0/token";
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("client_id", "HGSZO2Y2v6oIfhPXDCxu"));
		postParams.add(new BasicNameValuePair("client_secret", "IRLj_NcV1v"));
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("state", state));
		postParams.add(new BasicNameValuePair("code", authorization_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(reqUrl);
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			String jsonString = EntityUtils.toString(response.getEntity());
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(jsonString);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(ClientProtocolException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally{
			
		}
	
		return returnNode.get("access_token").toString();
	}

	@Override
	public JsonNode getNaverUserInfo(String authorization_code, String state) {	
	final String reqUrl = "https://openapi.naver.com/v1/nid/me";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(reqUrl);
		String accessToken = getAccessToken(authorization_code, state);
		
		System.out.println("이것은 accessToken!!!!  "+accessToken);
		
		post.addHeader("Authorization", "Bearer "+accessToken);
		
		JsonNode returnNode = null;
		
		HttpResponse response;
		try {
			response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println(reqUrl);
			System.out.println(responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		return returnNode;
	}

	@Override
	public int getSearchNaverId(String naver_nickname) {
		// TODO Auto-generated method stub
		return memberMapperInter.getSearchNaverId(naver_nickname);
	}

	@Override
	public MemberDto getDataByNaverId(String loggedNaverId) {
		// TODO Auto-generated method stub
		return memberMapperInter.getDataByNaverId(loggedNaverId);
	}

	@Override
	public void insertNaverMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberMapperInter.insertNaverMember(memberDto);
	}

	@Override
	public void naverLogout(String authorization_code) {
		// TODO Auto-generated method stub
		memberMapperInter.naverLogout(authorization_code);
	}
	
}
