package sist.last.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;
import sist.last.dto.RoomDto;
import sist.last.mapper.ReserveMapperInter;
import sist.last.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	ReserveMapperInter mapper;
	
	@GetMapping("/member/joinform")
	public String addform()
	{
		return "/member/addFormMain";
	}
	
	@GetMapping("/member/member-join")
	public String addperson()
	{
		return "/member/memberAddForm";
	}
	
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String info_id)
	{
		Map<String, Integer> map = new HashMap<>();
		
		int i = service.getSearchId(info_id);
		
		map.put("count", i);
		
		return map;
	}
	
	@GetMapping("/member/nickcheck")
	@ResponseBody
	public Map<String, Integer> nickCheck(@RequestParam String info_nickname)
	{
		Map<String, Integer> map = new HashMap<>();
		
		int a = service.getSearchNick(info_nickname);
		
		map.put("count", a);
		
		return map;
	}
	
	
	@PostMapping("/member/join-member")
	public String insert(MemberDto memberDto,
			@RequestParam String hp1,
			@RequestParam String hp2,
			@RequestParam String hp3,
			@RequestParam String email1,
			@RequestParam String email2,
			HttpSession session)
	{
			String hp = hp1+"-"+hp2+"-"+hp3;
			memberDto.setInfo_hp(hp);
			
			String email = email1+"@"+email2;
			memberDto.setInfo_email(email);	
		
		service.insertMember(memberDto);	

		return "/member/welcome";
	}
	
	@GetMapping("/member/member-mytriview")
	public String mytriview(Model model, HttpSession session)
	{
		String info_id = (String)session.getAttribute("info_id");
		
		MemberDto memberDto = service.getDataById(info_id);
		
		session.setAttribute("info_id", memberDto.getInfo_id());
		
		model.addAttribute("memberDto", memberDto);
		
		return "/member/memberMyTriview";
	}
	
	@GetMapping("/member/member-mypage")
	public String mypage(Model model,
			HttpSession session)
	{
		
		String info_id = (String)session.getAttribute("info_id");
		//System.out.println(myid);
		
		MemberDto memberDto = service.getDataById(info_id);
		
		model.addAttribute("memberDto", memberDto);
		
		//System.out.println(memberDto.getId());
	
		//System.out.println(memberDto.getInfo_id());
		
		return "/member/memberMyPage";
	}
	
	@GetMapping("/member/member-update")
	public String updateform(@RequestParam String info_id, Model model)
	{	
		MemberDto memberDto = service.getDataById(info_id);
		
		model.addAttribute("memberDto", memberDto);
		
		return "/member/memberUpdateForm";
	}
	
	@PostMapping("/member/update-member")
	public String update(@ModelAttribute MemberDto dto,
			@RequestParam String hp1,
			@RequestParam String hp2,
			@RequestParam String hp3,
			@RequestParam String email1,
			@RequestParam String email2,
			HttpSession session)
	{
		String hp = hp1+"-"+hp2+"-"+hp3;
		dto.setInfo_hp(hp);
		
		String email = email1+"@"+email2;
		dto.setInfo_email(email);
		
		service.updateMember(dto);

		return "/member/updateSuccess";
	}
	
	
	
	@GetMapping("/member/delete-member")
	@ResponseBody
	public String delete(@RequestParam String info_id,
			HttpServletRequest request)
	{
		service.deleteMember(info_id);
		return "/";
	}
	
	@GetMapping("/member/mycoupon")
	public String coupon()
	{
		
		return "/member/myCoupon";
	}
	
	@GetMapping("/member/mypoint")
	public String point()
	{
		return "/member/myPoint";
	}
	
	@GetMapping("/notice/event")
	public String event()
	{
		return "/notice/event";
	}
	
	@GetMapping("/triview/info")
	public String info()
	{
		return "/notice/triviewInfo";
	}
	
	@GetMapping("/member/myreservation")
	public String myreservation(Model model, HttpSession session)
	{	
		String info_id = (String)session.getAttribute("info_id");

		//System.out.println(room_num);
		System.out.println(info_id);
		
		//list dto 에 넣어서 그걸 뽑는거. 그 안에 필요한 거 예약번호, 숙소 이름, 방이름 가져오기, 체크인, 체크아웃 

		List<ReserveDto> list = mapper.getReservationDataById(info_id);  //리스트에서 0번쨰에 있는 데이터 나옴 그중에 room_num 존재 그 roomㅜㅕㅡdmf 랙ansd ksdptj rkwudha 개ㅐㅡnum에 대한 사진 조회. 그 사진을 photolist에 넣음 
		List<String>photoList = new ArrayList<>();
		
		for(ReserveDto reserve:list) {  //list의 수만큼 반복. reserve 가 결국 i가 됨
			
			int room_num = reserve.getRoom_num(); //첫번째 for문에서 뽑음
			String photo = mapper.getPhoto(room_num+"");
			
			photoList.add(photo);
	
		}
		//list만큼 for문 
		
	
		model.addAttribute("list", list);
		model.addAttribute("photoList", photoList);
		
		return "/member/MyReservationList";
	}

	@PostMapping("/member/update-reserve")
	public String reserveUpdate(@ModelAttribute ReserveDto dto, Model model)
	{
		mapper.updateReserveStatus(dto);
		
		model.addAttribute(dto);
		
		return "/member/MyReservationList";
	}
	
}
