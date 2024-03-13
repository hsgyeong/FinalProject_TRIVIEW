package sist.last.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("nonBookableDto")
public class NonBookableDto {
    private String idx;
    private int accom_num;
    private String non_checkin;
    private String non_checkout;
    private String accom_name;
}
