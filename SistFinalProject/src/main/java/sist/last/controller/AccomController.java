package sist.last.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sist.last.dto.AccomDto;
import sist.last.dto.MemberDto;
import sist.last.mapper.AccomMapperInter;
import sist.last.service.MemberService;

@Controller
public class AccomController {

	@Autowired
	AccomMapperInter mapper;
	@Autowired
	MemberService service;

	@GetMapping("/accom/accom-list")
	public ModelAndView list(HttpSession session) {

		ModelAndView model = new ModelAndView();

		String business = (String) session.getAttribute("business_id");
		String info=(String)session.getAttribute("info_id");
		
		int totalCount = mapper.getTotalCount(business);
		List<AccomDto> list = mapper.getAllData();
		
	    AccomDto dto = new AccomDto();
	    dto.setBusiness_id(business);
	    
	    MemberDto mdto = new MemberDto();
        mdto.setInfo_id(info);
	    
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("dto", dto);
		model.addObject("mdto", mdto);
		
		model.setViewName("/accom/accomList");
		
		return model;
	}

	@GetMapping("/accom/accom-insert")
	public ModelAndView accominsertfrom(HttpSession session) {
		
		ModelAndView model=new ModelAndView();
		
		// 세션에서 로그인 정보를 가져오는 로직
	    String business_id = (String) session.getAttribute("business_id");
	    
	    AccomDto dto = new AccomDto();
	    
	    dto.setBusiness_id(business_id);
	    
	    model.addObject("dto", dto);
	    
	    model.setViewName("/accom/accomInsert");
		
		return model;
	}

	@PostMapping("/accom/insert")
	public String insert(@ModelAttribute AccomDto dto, MultipartFile photo, HttpSession session) {
		// save 위치
		String path = session.getServletContext().getRealPath("/accomsave");

		// 업로드한 파일 dto 얻기
		String originalFilename = photo.getOriginalFilename();
		// 파일 이름에 날짜 및 시간 추가
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = sdf.format(new Date());
		String newFilename = timestamp + "_" + originalFilename;
		dto.setAccom_photo(newFilename);

		try {
			photo.transferTo(new File(path + "/" + newFilename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mapper.insertAccom(dto);
		
		return "redirect:/accom/accom-list?business_id="+dto.getBusiness_id();
	}

	@GetMapping("/accom/delete")
	public String delete(@RequestParam int accom_num, HttpSession session) {
		
	    AccomDto dto = mapper.getOneData(accom_num);

	    //AccomDto가 null이 아닌지 확인
	    if (dto != null) {
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
	    
	    mapper.deleteAccom(accom_num);
			
		return "redirect:/accom/accom-list";

	}
	
	@GetMapping("/accom/accom-update")
	public ModelAndView accomupdatefrom(HttpSession session,@RequestParam int accom_num) {
		
		ModelAndView model=new ModelAndView();
		
		// 세션에서 로그인 정보를 가져오는 로직
	    String business_id = (String) session.getAttribute("business_id");
	    
	    AccomDto dto = mapper.getOneData(accom_num);
	    
	    dto.setBusiness_id(business_id);
	    
	    model.addObject("dto", dto);
	    
	    model.setViewName("/accom/accomUpdate");
		
		return model;
	}

	@PostMapping("/accom/update")
	public String update(@ModelAttribute AccomDto dto, MultipartFile photo, HttpSession session) {

	    // save 위치
	    String path = session.getServletContext().getRealPath("/accomsave");
	    // 업로드한 파일 dto 얻기
	    String originalFilename = photo.getOriginalFilename();
	    // 파일 이름에 날짜 및 시간 추가
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
	    String timestamp = sdf.format(new Date());
	    String newFilename = timestamp + "_" + originalFilename;
	    // 파일 삭제
	    String oldFilename = mapper.getOneData(dto.getAccom_num()).getAccom_photo();
	    try {
	        // 기존 이미지 파일 삭제
	        File oldFile = new File(path + "/" + oldFilename);
	        oldFile.delete();
	        
	        // 신규 이미지 파일 저장
	        photo.transferTo(new File(path + "/" + newFilename));

	        // 새 파일 이름 설정
	        dto.setAccom_photo(newFilename);

	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }

	    mapper.updateAccom(dto);

	    return "redirect:/accom/accom-list?business_id="+dto.getBusiness_id();
	}
}