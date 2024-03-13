package sist.last.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sist.last.dto.NonBookableDto;
import sist.last.mapper.NonBookableMapperInter;

@Service
public class NonBookableService implements NonBookableServiceInter {

    @Autowired
    NonBookableMapperInter mapperInter;

    @Override
    public List<String> getAccomName(String business_id) {
        return mapperInter.getAccomName(business_id);
    }

    @Override
    public int getAccomNumber(String accom_name) {
        return mapperInter.getAccomNumber(accom_name);
    }

    @Override
    public List<NonBookableDto> getNonBookableList(String accom_name) {
        return mapperInter.getNonBookableList(accom_name);
    }

    @Override
    public void addNonBookableDate(NonBookableDto dto) {
        mapperInter.addNonBookableDate(dto);
    }

    @Override
    public List<String> getNonBookableCheckin(int accom_num) {
        return mapperInter.getNonBookableCheckin(accom_num);
    }

    @Override
    public List<String> getNonBookableCheckout(int accom_num) {
        return mapperInter.getNonBookableCheckout(accom_num);
    }

    @Override
    public void deleteNonBookableDate(String idx) {
        mapperInter.deleteNonBookableDate(idx);
    }

    @Override
    public void deleteNonBookableDateOfAccomName(String accom_name) {
        mapperInter.deleteNonBookableDateOfAccomName(accom_name);
    }
}
