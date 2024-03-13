package sist.last.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import sist.last.dto.MemberDto;
import sist.last.mapper.MemberMapperInter;

@Service
public class KakaoMemberService implements KakaoMemberServiceInter {

	@Autowired
	MemberMapperInter memberMapperInter;
	
	@Override
	public String getAccessToken(String authorization_code) throws Exception {
		// TODO Auto-generated method stub
		
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
	try {	
		
		URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=f74ba8d7ae81ba39d038f11c32d7c6ae");
		sb.append("&redirect_uri=http://localhost:9000/login/kakao-member");
		sb.append("&code="+authorization_code);
		
		bw.write(sb.toString());
		bw.flush();
		
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode: "+responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";
		
		while((line=br.readLine())!=null) {
			result += line;
		}
		System.out.println("response body: "+result);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>(){
		});
		access_token = jsonMap.get("access_token").toString();
		refresh_token = jsonMap.get("refresh_token").toString();
		
		System.out.println("access_token: "+access_token);
		System.out.println("refresh_token: "+refresh_token);
		
		
		br.close();
		bw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}

		return access_token;
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_token) throws Throwable {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
		
		URL url = new URL (reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		
		conn.setRequestProperty("Authorization", "Bearer "+access_token);
		
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode: "+responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String line = "";
		String result = "";
		
		while((line = br.readLine())!=null) {
			
			result += line;
		}
		
		System.out.println("response body: "+result);
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		
		String kakao_id = element.getAsJsonObject().get("id").getAsString();
		System.out.println("카카오아이디 "+kakao_id);
	
		System.out.println("result type: "+result.getClass().getName());
		
		try {
			
			MemberDto memberDto = new MemberDto();
			
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			
			Map<String, Object> properties = (Map<String, Object>)
			jsonMap.get("properties");
			System.out.println(jsonMap.get("properties"));
			
			Map<String, Object> kakao_account = (Map<String, Object>)
			jsonMap.get("kakao_account");
			
			String kakao_nickname = properties.get("nickname").toString();
			
			userInfo.put("kakao_nickname", kakao_nickname);  
			userInfo.put("kakao_id", kakao_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}catch(IOException e) {
		e.printStackTrace();
	}
		return userInfo;
	}


	public void kakaoLogout(String access_token) {
		// TODO Auto-generated method stub
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+access_token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result = "";
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
/*	
	@Override
	public JsonNode Logout(String authorization_code) {
		// TODO Auto-generated method stub
		
		final String logoutUrl = "https://kapi.kakao.com/v1/user/logout";
		
		final HttpClient client = HttpClientBuilder.create().build();
		
		final HttpPost post = new HttpPost(logoutUrl);
		
		post.addHeader("Authorization", "Bearer "+authorization_code);
		
		JsonNode returnNode = null;
		
		try {
		
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		}catch(UnsupportedEncodingException e) {
		e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			
		}
		return returnNode;
	}

	@Override
	public void kakaoUnlink(int kakao_id, String access_token) {
		// TODO Auto-generated method stub
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer "+access_token);
				conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
				conn.setDoOutput(true);
				
				 
			try(BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))){
				StringBuilder sb = new StringBuilder();
				sb.append("target_id_type=user_id");
				sb.append("&target_id="+kakao_id);
				bw.write(sb.toString());
				bw.flush();
				}
			
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode: "+responseCode);
				
				if(responseCode == HttpURLConnection.HTTP_OK) {
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String result="";
				String line="";
				
				while((line = br.readLine()) != null) {
					result += line;
				}
				
				System.out.println(result);
				
				br.close();
				//bw.close();
				}else {
					System.out.println("kakao unlink failed");
				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
*/

	@Override
	public MemberDto getDataByKakao(String kakao_id) {
		// TODO Auto-generated method stub
		
		return memberMapperInter.getDataByKakao(kakao_id);
	}

	@Override
	public void insertKakaoMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		memberMapperInter.insertKakaoMember(memberDto);
	}

	@Override
	public int getSearchKakaoId(String kakao_id) {
		// TODO Auto-generated method stub
		return memberMapperInter.getSearchKakaoId(kakao_id);
	}

	@Override
	public MemberDto getDataByKakaoId(String loggedKakaoId) {
		// TODO Auto-generated method stub
		return memberMapperInter.getDataByKakaoId(loggedKakaoId);
	}


}
