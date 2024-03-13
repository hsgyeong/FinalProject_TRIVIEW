package sist.last.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.service.BusinessService;

@Controller
public class BusinessController {

	@Autowired
	BusinessService businessService;
	
	@GetMapping("/member/business-join")
	public String addbusiness()
	{
		return "/company/businessAddForm";
	}
	
	@GetMapping("/member/business-idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String business_id)
	{
		Map<String, Integer> map = new HashMap<>();
		
		int a = businessService.getSearchBusinessId(business_id);
		
		map.put("count", a);
		
		return map;
	}
	
	@PostMapping("/member/join-business")
	public String insert(@ModelAttribute BusinessDto businessDto,
			@RequestParam String hp1,
			@RequestParam String hp2,
			@RequestParam String hp3,
			@RequestParam String email1,
			@RequestParam String email2,
			HttpSession session)
	{
		String hp = hp1+"-"+hp2+"-"+hp3;
		businessDto.setBusiness_hp(hp);
		
		String email = email1+"@"+email2;
		businessDto.setBusiness_email(email);
		
		businessService.insertBusiness(businessDto);	

		return "/member/welcome";
	}
	
	@GetMapping("/business/business-mytriview")
	public String mytriview(Model model, HttpSession session)
	{
		String business_id = (String) session.getAttribute("business_id");
		
		BusinessDto businessDto = businessService.getDataByBusinessId(business_id);
		
		session.setAttribute("business_company", businessDto.getBusiness_company());
		
		model.addAttribute("businessDto", businessDto);
		
		return "/company/businessMyTriview";
	}
	
	@GetMapping("/business/business-mypage")
	public String mypage(Model model,
			HttpSession session)
	{
	/*	List<MemberDto> list = service.getAllMembers();
		
		model.addAttribute("list", list);   */
		
		String business_id = (String)session.getAttribute("business_id");
		//System.out.println(myid);
		
		BusinessDto businessDto = businessService.getDataByBusinessId(business_id);
		
		model.addAttribute("businessDto", businessDto);
		
		//System.out.println(myid+businessDto);
		
		
		return "/company/businessMyPage";
	}

	@GetMapping("/member/business-update")
	public String updateform(@RequestParam String business_id, Model model)
	{	
		BusinessDto businessDto = businessService.getDataByBusinessId(business_id);
		
		model.addAttribute("businessDto", businessDto);
		
		return "/company/businessUpdateForm";
	}
	
	@PostMapping("/member/update-business")
	public String update(@ModelAttribute BusinessDto businessDto,
			@RequestParam String hp1,
			@RequestParam String hp2,
			@RequestParam String hp3,
			@RequestParam String email1,
			@RequestParam String email2,
			HttpSession session)
	{
		String hp = hp1+"-"+hp2+"-"+hp3;
		businessDto.setBusiness_hp(hp);
		
		String email = email1+"@"+email2;
		businessDto.setBusiness_email(email);
		
		businessService.updateBusiness(businessDto);

		return "/company/updateSuccess";
	}

	@GetMapping("/company/delete-business")
	@ResponseBody
	public String delete(@RequestParam String business_id,
			HttpServletRequest request)
	{
		businessService.deleteBusiness(business_id);
		return "/";
	}

}
