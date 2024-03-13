package sist.last.service;

import java.util.List;
import sist.last.dto.ProductDto;

public interface ProductServiceInter {
    public int getAccommodation(String result);

    public List<ProductDto> getProductDataOfCategory(String keyword);

    public List<ProductDto> getProductDataOfName(String keyword);

    public List<ProductDto> getProductDataOfHashTag(String keyword);

    public List<ProductDto> getProductDataOfLocation(String keyword);

    public List<ProductDto> getProductClickOrderByLowPriceOfCategory(String keyword, String minPrice, String maxPrice);

    public List<ProductDto> getProductClickOrderByLowPriceOfHashTag(String keyword, String minPrice, String maxPrice);

    public List<ProductDto> getProductClickOrderByLowPriceOfLocation(String keyword, String minPrice, String maxPrice);

    public List<ProductDto> getProductClickOrderByLowPriceOfName(String keyword, String minPrice, String maxPrice);

    public List<ProductDto> getProductOfCategoryByLowPrice(String keyword);

    public List<ProductDto> getProductOfNameByLowPrice(String keyword);

    public List<ProductDto> getProductOfHashTagByLowPrice(String keyword);

    public List<ProductDto> getProductOfLocationByLowPrice(String keyword);

    public List<Integer> getPriceOfAccomNumber(int accom_num);

    public int getProductOfLowPrice(int accom_num);

    public List<ProductDto> getAllProduct();

    public List<String> selectCategory();
}
