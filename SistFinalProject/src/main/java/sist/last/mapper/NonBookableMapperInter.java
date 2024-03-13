package sist.last.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import sist.last.dto.NonBookableDto;

@Mapper
public interface NonBookableMapperInter {

    public List<String> getAccomName(String business_id);

    public int getAccomNumber(String accom_name);

    public List<NonBookableDto> getNonBookableList(String accom_name);

    public void addNonBookableDate(NonBookableDto dto);

    public List<String> getNonBookableCheckin(int accom_num);

    public List<String> getNonBookableCheckout(int accom_num);

    public void deleteNonBookableDate(String idx);

    public void deleteNonBookableDateOfAccomName(String accom_name);
}
