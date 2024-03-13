package sist.last.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sist.last.dto.NonBookableDto;
import sist.last.service.NonBookableService;

@Controller
public class NonBookableController {

    @Autowired
    NonBookableService service;

    /*이성신 추가 부분*/
    @GetMapping("/accom/non-book")
    public String nonBook(HttpSession session, Model model) {
        String business_id = (String) session.getAttribute("business_id");
        List<String> accomList = service.getAccomName(business_id);
        if (accomList.isEmpty()) {
            model.addAttribute("nothing", "nothing");
            return "/accom/accomNonBookable";
        }
        model.addAttribute("accomList", accomList);
        return "/accom/accomNonBookable";
    }

    @GetMapping("/accom/duplicate-date")
    @ResponseBody
    public Map<String, Object> duplicateDate(@RequestParam("checkin") List<String> checkin,
                                             @RequestParam("checkout") List<String> checkout) {
        Map<String, Object> map = new HashMap<>();
        String flag = "1";

        for (int i = 0; i < checkin.size(); i++) {
            LocalDate checkinDate = LocalDate.parse(checkin.get(i));
            LocalDate checkoutDate = LocalDate.parse(checkout.get(i));

            // 중복 검사
            if (isDateRangeOverlap(checkinDate, checkoutDate, checkin, checkout, i)) {
                flag = "0";
                map.put("flag", flag);
                return map;
            }
        }
        // 중복이 없는 경우 필요한 로직을 수행하고 응답을 반환
        // ...
        map.put("flag", flag);
        return map;
    }

    @GetMapping("/accom/add-book")
    @ResponseBody
    public void setNonBookableDate(@RequestParam("checkin") List<String> checkin,
                                   @RequestParam("checkout") List<String> checkout,
                                   @RequestParam("accom_name") String accom_name) {
        System.out.println(checkin.size());
        System.out.println(accom_name);
        int accom_num = service.getAccomNumber(accom_name);
        service.deleteNonBookableDateOfAccomName(accom_name);
        for (int listIndex = 0; listIndex < checkin.size(); listIndex++) {
            System.out.println(checkin.get(listIndex) + "," + checkout.get(listIndex) + "," + accom_num);
            NonBookableDto dto = new NonBookableDto();
            dto.setNon_checkin(checkin.get(listIndex));
            dto.setNon_checkout(checkout.get(listIndex));
            dto.setAccom_num(accom_num);
            dto.setAccom_name(accom_name);
            service.addNonBookableDate(dto);
        }
    }

    @GetMapping("/accom/all-delete")
    public String deleteAll(@RequestParam String accom_name) {

        service.deleteNonBookableDateOfAccomName(accom_name);

        return "redirect:/accom/non-book";
    }

    private boolean isDateRangeOverlap(LocalDate newCheckin, LocalDate newCheckout, List<String> checkinList,
                                       List<String> checkoutList, int currentIndex) {
        for (int i = 0; i < checkinList.size(); i++) {
            if (i != currentIndex) {
                LocalDate existingCheckin = LocalDate.parse(checkinList.get(i));
                LocalDate existingCheckout = LocalDate.parse(checkoutList.get(i));

                // 새로운 체크인 날짜가 기존 기간에 포함되거나
                // 새로운 체크아웃 날짜가 기존 기간에 포함되는 경우 중복으로 처리
                if ((newCheckin.isEqual(existingCheckin) || newCheckin.isAfter(existingCheckin)) &&
                        (newCheckin.isBefore(existingCheckout) || newCheckin.isEqual(existingCheckout)) ||
                        (newCheckout.isEqual(existingCheckin) || newCheckout.isAfter(existingCheckin)) &&
                                (newCheckout.isBefore(existingCheckout) || newCheckout.isEqual(existingCheckout))) {
                    return true; // 중복이 발생했음
                }
            }
        }
        return false; // 중복이 없음
    }

    @GetMapping("/accom/select-accom")
    @ResponseBody
    public List<NonBookableDto> getSelectAccom(@RequestParam String accom_name) {
        LocalDate today = LocalDate.now();
        List<NonBookableDto> nonBookableList = service.getNonBookableList(accom_name);
        for (NonBookableDto nonBookable : nonBookableList) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate checkout = LocalDate.parse(nonBookable.getNon_checkout(), formatter);
            System.out.println("오늘 : " + today + ", 예약일:: " + checkout);
            if (checkout.isBefore(today)) {
                service.deleteNonBookableDate(nonBookable.getIdx());
            }
        }
        return service.getNonBookableList(accom_name);
    }
}
