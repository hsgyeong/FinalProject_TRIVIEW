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
	
	@Override		//네이버 Oauth2.0을 사용하여  액세스 토큰을 얻는 restful api 호출
	public String getAccessToken(String authorization_code, String state) {  //인증 코드와 상태를 매개변수로 받음
		
		final String reqUrl = "https://nid.naver.com/oauth2.0/token";  //액세스 토큰을 요청할 네이버의 엔드포인트 url 지정
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();  //post 요청에 사용할 매개변수를 저장할 리스트 생성
		postParams.add(new BasicNameValuePair("client_id", "client_id넣기"));  // 액세스 토큰 요청에 필요한 매개변수들을 생성하고 리스트에 추가함 
		postParams.add(new BasicNameValuePair("client_secret", "client_secret넣기"));
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("state", state));
		postParams.add(new BasicNameValuePair("code", authorization_code));
		
		final HttpClient client = HttpClientBuilder.create().build();  //Apache HttpClient를 사용하여 Http 클라이언트 객체를 생성  
		final HttpPost post = new HttpPost(reqUrl);    //HTTP Post 요청을 생성하고 액세스 토큰을 요청할 url 지정
		JsonNode returnNode = null;		//액세스 토큰 요청에 대한 응답을 저장할 JsonNode 객체를 초기화
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));		//post 요청에 매개변수를 추가하고 클라이언트를 통해 요청을 실행하여 응답을 받음
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			String jsonString = EntityUtils.toString(response.getEntity());  //받은 응답을 문자열로 반환함
			ObjectMapper mapper = new ObjectMapper();		//Jackson ObjectMapper를 사용하여 JSON 문자열을 JsonNode객체로 변환함
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
	public JsonNode getNaverUserInfo(String authorization_code, String state) {	 //네이버 사용자 정보를 가져옴. 매개변수로 인증코드와 상태를 전달받으며, 메서드의 반환값은 JSONNode객체이다. 
	
		final String reqUrl = "https://openapi.naver.com/v1/nid/me";  //네이버 OpenApi의 사용자 정보를 가져오는 엔드포인트 url을 정의함
		
		final HttpClient client = HttpClientBuilder.create().build();  //Apache HTTPClient를 사용하여 HTTP 요청을 보낼 클라이언트 객체를 생성함
		final HttpPost post = new HttpPost(reqUrl);   //HTTPPost 요청을 생성하고 위에서 정의한 엔드포인트 url을 사용하여 초기화함
		String accessToken = getAccessToken(authorization_code, state);  //getAccessToken 메서드를 호출하여 네이버에서 액세스토큰을 받아옴
		
		//System.out.println(accessToken);
		
		post.addHeader("Authorization", "Bearer "+accessToken);   //HTTP 요청 헤더에 액세스 토큰을 추가함. 이를 통해 네이버에 인증된 사용자임을 서버에 알림.
		
		JsonNode returnNode = null;
		
		HttpResponse response;
		
		try {
			response = client.execute(post);  //클라이언트를 사용하여 HTTP POST 요청을 실행하고 서버로부터 응답을 받음.
			final int responseCode = response.getStatusLine().getStatusCode();   //HTTP 응답 코드를 가져옴
			//System.out.println(reqUrl);
			//System.out.println(responseCode);
			
			ObjectMapper mapper = new ObjectMapper();    //Jackson 라이브러리의 ObjectMapper 를 사용하여 JSON 응답을 JAVA 객체로 매핑함 
			returnNode = mapper.readTree(response.getEntity().getContent());   //HTTP 응답 본문 내용을 읽어와서 JSON 형식으로 파싱하고, 'JSONNode' 객체로 변환함
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		return returnNode;    //파싱된 JSON 객체를 반환함. 이 안에는 네이버 사용자의 정보가 포함되어 있음
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
