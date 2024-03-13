package sist.last.controller;

import java.util.HashMap;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.service.AdminMapperService;
import sist.last.service.BusinessService;
import sist.last.service.MemberService;

@Controller
public class LoginController {

    @Autowired
    MemberService service;

    @Autowired
    BusinessService businessService;

    @Autowired
    AdminMapperService adminService;


    @GetMapping("/login/loginmain")
    public String loginform(HttpSession session,
                            Model model) {

        String loginok = (String) session.getAttribute("loginok");

        if (loginok == null) {
            return "/login/loginForm";
        } else {
            String info_id = (String)session.getAttribute("info_id");
            String business_id = (String)session.getAttribute("business_id");
         
            if (info_id != null) {
                String info_nickname = service.getNickname(info_id);

                model.addAttribute("info_id", info_id);
                model.addAttribute("info_nickname", info_nickname);

                return "/";
            } else if (business_id != null) {

                model.addAttribute("business_id", business_id);

                return "/";

            } else {

                return "/login/loginForm";
            }

        }
    }


    @GetMapping("/login/fail")
    public String loginfail() {
        return "/member/loginFail";

    }

    @PostMapping("/login/member-login")
    public String login(@RequestParam String info_id,
                        @RequestParam String info_pass,
                        @RequestParam(required = false) String cbsave,
                        HttpSession session,
                        HttpServletResponse response) {
        HashMap<String, String> map = new HashMap<>();
        int check = service.loginPassCheck(info_id, info_pass);

        if (check == 1) {

            session.setMaxInactiveInterval(60 * 60 * 8);

            session.setAttribute("info_id", info_id);
            session.setAttribute("infoSave", info_id);
            session.setAttribute("loginok", "member");
            session.setAttribute("saveok", cbsave);

            MemberDto memberDto = service.getDataById(info_id);  

            session.setAttribute("info_nickname", memberDto.getInfo_nickname());

            return "redirect:/";
        } else {

            return "/login/loginFail";
        }

    }

    @PostMapping("/login/business-login")
    public String Blogin(@RequestParam String business_id,
                         @RequestParam String business_pass,
                         @RequestParam(required = false) String cbsave,
                         HttpSession session,
                         HttpServletResponse response) {
        HashMap<String, String> map = new HashMap<>();

        int Bcheck = businessService.BloginPassCheck(business_id, business_pass);
  
        if (Bcheck == 1) {
        	int approval = businessService.getApprovalByBusinessId(business_id);
      	
            if(approval == 1) {
            	
                session.setMaxInactiveInterval(60 * 60 * 8);

                session.setAttribute("business_id", business_id);
                session.setAttribute("businessSave", business_id);
                session.setAttribute("loginok", "business");
                session.setAttribute("saveok", cbsave);

                BusinessDto businessDto = businessService.getDataByBusinessId(business_id);
        		
        		session.setAttribute("business_company", businessDto.getBusiness_company());
    			
            	return "redirect:/";
            }
            else {
            	return "/company/approvalFail";
            }
        } 

            return "/login/loginFail";
        }

    

    @GetMapping("/login/login-fail")
    public String loginFail() {

        return "/login/loginFail";
    }

    @GetMapping("/login/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        String loginok = (String)session.getAttribute("loginok");
        //System.out.println("hello");

        if (loginok != null) {

        session.removeAttribute("loginok");
        session.removeAttribute("info_id");
        session.removeAttribute("business_id");
        session.removeAttribute("kakao_nickname");
    
        }
        return "redirect:/";
    }

}
