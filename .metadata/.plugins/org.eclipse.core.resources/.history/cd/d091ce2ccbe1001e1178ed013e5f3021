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
	

	@RequestMapping("/login/naverLogin")
	public String naverLogin(HttpSession session) throws UnsupportedEncodingException, UnknownHostException
	{		
		SecureRandom random = new SecureRandom();
		
		String state = new BigInteger(130, random).toString();
		
		StringBuffer url = new StringBuffer();
		url.append("https://nid.naver.com/oauth2.0/authorize?");
		url.append("response_type=code");
		url.append("&client_id=HGSZO2Y2v6oIfhPXDCxu");
		url.append("&state="+state);
		url.append("&redirect_uri=http://localhost:9000/login/naver-member");
	
				session.setAttribute("state", state);
				
		return "redirect:"+url;
			
	}
	
	@RequestMapping(value="/login/naver-member")
	public String naverSignIn(Model model, @RequestParam("code") String code,
			@RequestParam("state")String state, HttpSession session, MemberDto memberDto)throws Exception
	{
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		JsonNode naverInfo = naverMemberService.getNaverUserInfo(code, state);
		JsonNode naverUser = naverInfo.get("response");
		
		if(naverUser!=null) {
		System.out.println("이것은 정보"+naverUser.toString());
		
		JsonNode naverIdNode = naverUser.get("id");
		if(naverIdNode != null) {
			String naver_id = "naver_"+(naverUser.get("nickname").asText());
	//	String naver_id = naverIdNode.asText();	
		String naver_nickname = naverUser.get("nickname").asText();
		String naver_email = naverUser.get("email").asText();
		String naver_mobile = naverUser.get("mobile").asText();
		String naver_name = naverUser.get("name").asText();
		
		//System.out.println("이것은 닉네임"+nickname);
		//System.out.println("이것은 이메일"+email);
		//System.out.println("이것은 연락처"+mobile);
		//System.out.println("이것은 이름"+name);
		
		Map<String, Integer> map = new HashMap<>();
		
		int n = naverMemberService.getSearchNaverId("naver_"+naver_nickname);
		map.put("count", n);
		System.out.println("네이버아뒤~~  "+naver_id);
		System.out.println("이것은숫자!!!!!"+n);
		
		if(n==1){
			session.setAttribute("info_nickname", naver_nickname);
			session.setAttribute("info_id", "naver_"+naver_nickname);
			session.setAttribute("info_email", naver_email);
			session.setAttribute("info_hp", naver_mobile);
			session.setAttribute("info_name", naver_name);
			session.setAttribute("loginok","naver");
			
			String loggedNaverId = (String)session.getAttribute("info_id");
			MemberDto loggedInMember = naverMemberService.getDataByNaverId(loggedNaverId);
			System.out.println("로그인중 네이버아이디!@@@@   "+loggedNaverId);
			}else if(n==0)
		{
		  //System.out.println("네이버아이디: "+naver_nickname);
			memberDto.setNaver_id("naver_"+naver_nickname);
			memberDto.setNaver_nickname(naver_nickname);
			memberDto.setNaver_name(naver_name);
			memberDto.setNaver_email(naver_email);
			memberDto.setNaver_hp(naver_mobile);
			
			naverMemberService.insertNaverMember(memberDto);
		
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
