package sist.last.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sist.last.dto.AccomDto;
import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;
import sist.last.mapper.AccomMapperInter;
import sist.last.service.AdminMapperService;
import sist.last.service.BusinessService;

@Controller
public class AdminController {

	@Autowired
	AdminMapperService adminService;
	
	@Autowired
	AccomMapperInter accomInter;
	
	@Autowired
	BusinessService businessService;
	
	@GetMapping("/admin/admin-accom-approval-page")
	public ModelAndView adminStart(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=adminService.getAccomTotalCount();
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수




		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각 페이지에서 필요한 게시글 가져오기
		List<AccomDto> list=adminService.getAccomPagingList(startNum, perPage);


		model.addObject("totalCount", totalCount);

		//이곳에서 댓글 사이즈가 들어가기 때문에 따로 추가할 필요 없음
		//애초에 list에서 댓글갯수를 구해서 BoardDto에 넣었기 때문에
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/2/admin/adminAccomAccept");
		
		return model;
	}
	
	@GetMapping("/admin/admin-loginform")
	public String adminLoginForm()
	{
		return "/admin/adminLoginForm";
	}
	
	@PostMapping("/admin/admin-login")
	public String adminLogin(@RequestParam String admin_id,
			@RequestParam String admin_pass,
			HttpSession session)
	{
		int adminCheck=adminService.adminloginPassCheck(admin_id, admin_pass);
		
		if(adminCheck==1)
		{
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("admin_id", admin_id);
			session.setAttribute("loginok", "admin");

			return "redirect:/";
		}
		else
		{
			return "/login/loginFail";
		}
	}
	
	@GetMapping("/admin/admin-accom-approval")
	public ModelAndView adminApproval(@RequestParam int accom_num)
	{
		ModelAndView model=new ModelAndView();
		
		adminService.adminApprovalOfAccom(accom_num);
		
		model.setViewName("redirect:admin-accom-approval-page");
		
		return model;
	}
	
	@GetMapping("/admin/admin-accom-deny")
	public String delete(@RequestParam int accom_num, HttpSession session) {
		
	    AccomDto dto = accomInter.getOneData(accom_num);

	    //AccomDto가 null이 아닌지 확인
	    if (dto.getAccom_photo() != null) {
	        // 기존 이미지 파일 삭제
	        String oldFilename = dto.getAccom_photo();
	        if (oldFilename != null && !oldFilename.isEmpty()) {
	    		String path = session.getServletContext().getRealPath("/accomsave");
	            File oldFile = new File(path, oldFilename);

	            //파일이 존재하고 삭제에 성공한 경우에만 삭제
	            if (oldFile.exists() && oldFile.delete()) {
	                System.out.println("기존 이미지 파일 삭제 성공");
	            } else {
	                System.out.println("기존 이미지 파일 삭제 실패");
	            }
	        }
	    }
	    
	    accomInter.deleteAccom(accom_num);
			
		return "redirect:admin-accom-approval-page";
	}
	
	@GetMapping("/admin/admin-pay-info-page")
	public ModelAndView adminPayInfo(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=adminService.getPaymentTotalCount();
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수




		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각 페이지에서 필요한 게시글 가져오기
		List<ReserveDto> list=adminService.getPaymentPagingList(startNum, perPage);


		model.addObject("totalCount", totalCount);

		//이곳에서 댓글 사이즈가 들어가기 때문에 따로 추가할 필요 없음
		//애초에 list에서 댓글갯수를 구해서 BoardDto에 넣었기 때문에
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/2/admin/adminPayInfo");
		
		return model;
	}
	
	@GetMapping("/admin/admin-business-info-page")
	public ModelAndView adminBusinessInfo(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=adminService.getBusinessTotalCount();
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수




		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각 페이지에서 필요한 게시글 가져오기
		List<BusinessDto> list=adminService.getBusinessPagingList(startNum, perPage);


		model.addObject("totalCount", totalCount);

		//이곳에서 댓글 사이즈가 들어가기 때문에 따로 추가할 필요 없음
		//애초에 list에서 댓글갯수를 구해서 BoardDto에 넣었기 때문에
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/2/admin/adminBusinessManage");
		
		return model;
	}
	
	@GetMapping("/admin/admin-business-approval")
	public ModelAndView adminBApproval(@RequestParam int idx)
	{
		ModelAndView model=new ModelAndView();
		
		String business_id=adminService.getBusinessId(idx).getBusiness_id();
		
		adminService.adminApprovalOfBussiness(business_id);
		
		model.setViewName("redirect:admin-business-info-page");
		
		return model;
	}
	
	@GetMapping("/admin/admin-business-deny")
	public String Bdelete(@RequestParam int idx) {
		
		String business_id=adminService.getBusinessId(idx).getBusiness_id();
		
	    businessService.deleteBusiness(business_id);
			
		return "redirect:admin-business-info-page";
	}
	
	@GetMapping("/admin/admin-member-info-page")
	public ModelAndView adminMemberInfo(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=adminService.getMemberTotalCount();
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수




		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각 페이지에서 필요한 게시글 가져오기
		List<MemberDto> list=adminService.getMemberPagingList(startNum, perPage);


		model.addObject("totalCount", totalCount);

		//이곳에서 댓글 사이즈가 들어가기 때문에 따로 추가할 필요 없음
		//애초에 list에서 댓글갯수를 구해서 BoardDto에 넣었기 때문에
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/2/admin/adminMemberManage");
		
		return model;
	}
}
