package sist.last.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sist.last.dto.MemberDto;
import sist.last.mapper.MemberMapperInter;
import sist.last.service.KakaoMemberService;
import sist.last.service.MemberService;

@Controller //Controller 어노테이션을 통해 이 클래스는 스프링 mvc의 컨트롤러로 선언
public class KakaoMemberController {
	
	//kakaoMemberServiceInter와 memberServiceInter을 @Autowired 어노테이션을 통해 주입
	@Autowired
	public KakaoMemberService kakaoMemberService;
	
	@Autowired
	public MemberService memberService;
	
	@Autowired
	public MemberMapperInter memberMapperInter;

				//kakaologin 메서드는 아래 경로로의 get요청을 처리
 @RequestMapping(value="/login/kakao-member", method =  RequestMethod.GET)
 public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, MemberDto memberDto) throws Throwable {
	 					//@Requestparam이라는 어노테이션을 사용하여 code라는 파라미터를 받는다. 이 파라미터는 선택적이며 요청시 제공되지 않을 수 있음
	
	 System.out.println("code: "+code);
	
	 try {
	 //kakaoMemberServiceInter.getAccessToken(code)를 호출하여 카카오로부터 받은 code를 사용해 접근 토큰을 얻음
	 String access_token = kakaoMemberService.getAccessToken(code);
	 System.out.println("accessToken: "+access_token);
	 
	 //kakaoMemberServiceInter.getuserInfo(access_token)을 호출하여 해당 토큰을 이용해 카카오 회원 정보를 얻기
	 HashMap<String, Object> userInfo = kakaoMemberService.getUserInfo(access_token);
	 System.out.println("userInfo==== "+userInfo); //userInfo==== {kakao_id=121201221, kakao_nickname=홍성경}
	 
	 String info_nickname = (String)userInfo.get("kakao_nickname");
	 System.out.println(info_nickname);  //닉네임: 홍성경
	 String info_id = (String) userInfo.get("kakao_id");
	 System.out.println("kakaoid : "+info_id);
	 
	 Map<String, Integer> map = new HashMap<>();
	
	 int k = kakaoMemberService.getSearchKakaoId("kakao_"+info_id);
	 map.put("count", k);
	 System.out.println(k);
	 
	 if(k==1) {
		 System.out.println("별명:"+info_nickname);
		 System.out.println("kakaoid == "+info_id);
		 session.setAttribute("info_nickname", info_nickname);
		 session.setAttribute("info_id", "kakao_"+info_id);
		 session.setAttribute("access_token", access_token);
		 session.setAttribute("loginok", "kakao");	 
		 
		 String loggedKakaoId = (String) session.getAttribute("info_id");
		 MemberDto loggedInMember = memberMapperInter.getDataByKakaoId(loggedKakaoId);
		 System.out.println(loggedKakaoId);
		 System.out.println(loggedInMember);
	
	 }else if(k==0)
	 {   System.out.print("kakaoid ==== "+info_id);
	//	if(kakao_nickname != null) { 
			memberDto.setInfo_id("kakao_"+info_id);
			memberDto.setInfo_nickname("kakao_"+info_nickname);
		kakaoMemberService.insertKakaoMember(memberDto);
		
		 session.setAttribute("info_id", "kakao_"+info_id);
		 session.setAttribute("info_nickname", info_nickname);
		 session.setAttribute("access_token", access_token);
		 session.setAttribute("loginok", "kakao");
		 System.out.println(k);	 
	 }else {
		 
	 	}
	// }
 }catch(Exception e) {
	 e.printStackTrace();
 } 
 
	 return "redirect:/";

 }

	@RequestMapping(value="/logout/kakaologout")
	public String kakaoLogout(HttpSession session) throws IOException {
		
		String access_token = (String)session.getAttribute("access_token");
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("Authorization", "Bearer "+access_token);
		
		
		if(access_token != null && !"".equals(access_token)) {
			kakaoMemberService.kakaoLogout(access_token);
			session.removeAttribute("access_token");
		//	session.removeAttribute("userId");
			session.removeAttribute("info_nickname");
			session.removeAttribute("loginok");
		}else {
			System.out.println("access_token is null");
			
		} 
		return "redirect:/";
	}

/*	@RequestMapping(value="/logout/kakaounlink")
 	public String KakaoUnlink(HttpSession session) {
 		String access_token = (String) session.getAttribute("access_token");
 		Integer kakaoId = (Integer) session.getAttribute("kakao_id");
 		int kakao_id = (kakaoId != null)?kakaoId.intValue():0;
 		
 		kakaoMemberService.kakaoUnlink(kakao_id, access_token);
 		session.removeAttribute("access_token");
 		session.removeAttribute("kakao_nickname");
 		session.removeAttribute("kakao_id");
 		session.removeAttribute("loginok");
 //		session.removeAttribute("userInfo");  userInfo는 지우면 안 될 것 같음. 정보가 남아있어야해서
 		session.invalidate();
 		return "redirect:/";
 	}
 */
} 
