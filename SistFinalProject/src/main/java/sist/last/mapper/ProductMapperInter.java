package sist.last.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import sist.last.dto.ProductDto;

@Mapper
public interface ProductMapperInter {

    public int getAccommodation(String result);

    public List<ProductDto> getProductDataOfCategory(String keyword);

    public List<ProductDto> getProductDataOfName(String keyword);

    public List<ProductDto> getProductDataOfHashTag(String keyword);

    public List<ProductDto> getProductDataOfLocation(String keyword);

    public List<ProductDto> getProductClickOrderByLowPriceOfCategory(Map<String, String> map);

    public List<ProductDto> getProductClickOrderByLowPriceOfHashTag(Map<String, String> map);

    public List<ProductDto> getProductClickOrderByLowPriceOfLocation(Map<String, String> map);

    public List<ProductDto> getProductClickOrderByLowPriceOfName(Map<String, String> map);

    public List<ProductDto> getProductOfCategoryByLowPrice(String keyword);

    public List<ProductDto> getProductOfNameByLowPrice(String keyword);

    public List<ProductDto> getProductOfHashTagByLowPrice(String keyword);

    public List<ProductDto> getProductOfLocationByLowPrice(String keyword);

    public List<Integer> getPriceOfAccomNumber(int accom_num);

    public int getProductOfLowPrice(int accom_num);

    public List<ProductDto> getAllProduct();

    public List<String> selectCategory();
}
