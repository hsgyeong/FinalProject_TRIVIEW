package sist.last.service;

import java.util.List;
import sist.last.dto.NonBookableDto;

public interface NonBookableServiceInter {
    public List<String> getAccomName(String business_id);

    public int getAccomNumber(String accom_name);

    public List<NonBookableDto> getNonBookableList(String accom_name);

    public void addNonBookableDate(NonBookableDto dto);

    public List<String> getNonBookableCheckin(int accom_num);

    public List<String> getNonBookableCheckout(int accom_num);

    public void deleteNonBookableDate(String idx);

    public void deleteNonBookableDateOfAccomName(String accom_name);
}
