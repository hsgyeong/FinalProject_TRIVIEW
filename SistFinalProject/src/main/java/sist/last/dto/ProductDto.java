package sist.last.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("productDto")
@Data
public class ProductDto {
    private int accom_num;
    private String accom_name;
    private String accom_category;
    private String accom_photo;
    private String accom_location;
    private String accom_hashtag;
    private int accom_readcount;
    private double accom_score;
    private double accom_latitude;
    private double accom_longitude;
    private int room_price;
    private double distance;
    private int accom_count;
}
