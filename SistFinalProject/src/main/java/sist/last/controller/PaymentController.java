package sist.last.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import sist.last.dto.ReserveDto;
import sist.last.service.ReserveService;

@Controller
public class PaymentController {

	@Autowired
	ReserveService service;
	
	@GetMapping("/payment/pay-success")
    public ModelAndView paymentSuccess(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        
        String info_id=(String)session.getAttribute("info_id");
        
        int MaxNum=service.getMaxIdxOfReserve();
        
        
        ReserveDto reserveDto=service.getOneDataByIdOfReserve(info_id, MaxNum);
        
       
        modelAndView.addObject("reserveDto", reserveDto);
        
        modelAndView.setViewName("/payment/payment");
        
        return modelAndView;
    }
}
