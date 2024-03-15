package sist.last.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.reactive.result.view.RedirectView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import sist.last.dto.MemberDto;
import sist.last.mapper.MemberMapperInter;
import sist.last.service.NaverMemberService;

@Controller
public class NaverMemberController {
	
	@Autowired
	NaverMemberService naverMemberService;
	

	@RequestMapping("/login/naverLogin")	//네이버 로그인 페이지로 리다이렉트하는 메서드. UnsupportedEncodingException과 UnknownHostException 을 던질 수 있음
	public String naverLogin(HttpSession session) throws UnsupportedEncodingException, UnknownHostException
	{		
		SecureRandom random = new SecureRandom();   //안전한 무작위 수를 생성하는 SecureRandom 객체를 생성함
		
		String state = new BigInteger(130, random).toString();   //130비트의 임의의 큰 정수를 생성하고 이를 문자열 형태로 변환하여 상태를 나타내는 state 변수에 저장함
		
		StringBuffer url = new StringBuffer();     //url을 구성하기 위한 stringbuffer 객체를 생성함
		url.append("https://nid.naver.com/oauth2.0/authorize?");
		url.append("response_type=code");
		url.append("&client_id=HGSZO2Y2v6oIfhPXDCxu");
		url.append("&state="+state);
		url.append("&redirect_uri=http://localhost:9000/login/naver-member");
	
				session.setAttribute("state", state);   //새션애 상태 정보를 저장함
				
		return "redirect:"+url;   //구성된 url로 리다이렉트
			
	}
	
	@RequestMapping(value="/login/naver-member")
	public String naverSignIn(Model model, @RequestParam("code") String code,
			@RequestParam("state")String state, HttpSession session, MemberDto memberDto)throws Exception
	{
		HashMap<String, Object> userInfo = new HashMap<String, Object>();   //사용자 정보를 담을 HashMap 객체 생성
		
		JsonNode naverInfo = naverMemberService.getNaverUserInfo(code, state);   //네이버에서 사용자 정보 가져오는 메서드 호출
		JsonNode naverUser = naverInfo.get("response");        //네이버에서 가져온 사용자 정보를 response 노드에서 가져옴
		
		if(naverUser!=null) {		//네이버 사용자 정보가 존재하는 경우
		
		JsonNode naverIdNode = naverUser.get("id");   //네이버에서 받아온 사용자 ID를 구성하여 변수에 저장함
		if(naverIdNode != null) {
		String naver_id = "naver_"+(naverUser.get("nickname").asText());
		String naver_nickname = naverUser.get("nickname").asText();
		String naver_email = naverUser.get("email").asText();
		String naver_mobile = naverUser.get("mobile").asText();
		String naver_name = naverUser.get("name").asText();
		
		
		Map<String, Integer> map = new HashMap<>();    // 사용자 ID로 검색하여 존재하는 사용자인지 확인함
		
		int n = naverMemberService.getSearchNaverId("naver_"+naver_nickname);
		map.put("count", n);
		
		if(n==1){    										//존재하는 사용자의 경우 세션에 사용자 정보 설정
			session.setAttribute("info_nickname", naver_nickname);
			session.setAttribute("info_id", "naver_"+naver_nickname);
			session.setAttribute("info_email", naver_email);
			session.setAttribute("info_hp", naver_mobile);
			session.setAttribute("info_name", naver_name);
			session.setAttribute("loginok","naver");
			
			String loggedNaverId = (String)session.getAttribute("info_id");   //세션에 저장된 ID로 해당 멤버의 정보를 가져옴
			MemberDto loggedInMember = naverMemberService.getDataByNaverId(loggedNaverId);
			}
		else if(n==0)										//존재하지 않는 사용자의 경우
		{													//사용자 정보를 DB에 삽입함	
			memberDto.setNaver_id("naver_"+naver_nickname);
			memberDto.setNaver_nickname(naver_nickname);
			memberDto.setNaver_name(naver_name);
			memberDto.setNaver_email(naver_email);
			memberDto.setNaver_hp(naver_mobile);
			
			naverMemberService.insertNaverMember(memberDto);
																//세션에 사용자 정보 설정
			session.setAttribute("info_id","naver_"+naver_nickname);
			session.setAttribute("info_nickname",naver_nickname);
			session.setAttribute("info_email", naver_email);
			session.setAttribute("info_hp", naver_mobile);
			session.setAttribute("info_name", naver_name);
			session.setAttribute("loginok","naver");
			
		}		
		else{
			System.out.println("id키가 없음");
			}
		}

		}
		return "redirect:/";
		//return userInfo;
	}
	
	@RequestMapping(value="/logout/naverlogout")
	public String naverLogout(HttpSession session, String accessToken)throws IOException {
		
		String loginok = (String)session.getAttribute("loginok");
		
		if("naver".equals(loginok)) {
			session.removeAttribute("info_id");
			session.removeAttribute("info_nickname");
			session.removeAttribute("info_email");
			session.removeAttribute("info_hp");
			session.removeAttribute("info_name");
			session.removeAttribute("loginok");
		}else {
			
		}
		return "redirect:/";
	}
	
	}
