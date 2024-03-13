package sist.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sist.last.dto.ProductDto;
import sist.last.mapper.ProductMapperInter;

@Service
public class ProductService implements ProductServiceInter {

    @Autowired
    ProductMapperInter mapperInter;

    @Override
    public int getAccommodation(String result) {
        return 0;
    }

    @Override
    public List<ProductDto> getProductDataOfCategory(String keyword) {
        return mapperInter.getProductDataOfCategory(keyword);
    }

    @Override
    public List<ProductDto> getProductDataOfName(String keyword) {
        return mapperInter.getProductDataOfName(keyword);
    }

    @Override
    public List<ProductDto> getProductDataOfHashTag(String keyword) {
        return mapperInter.getProductDataOfHashTag(keyword);
    }

    @Override
    public List<ProductDto> getProductDataOfLocation(String keyword) {
        return mapperInter.getProductDataOfLocation(keyword);
    }

    @Override
    public List<ProductDto> getProductClickOrderByLowPriceOfCategory(String keyword, String minPrice, String maxPrice) {
        Map<String, String> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("minPrice", minPrice);
        map.put("maxPrice", maxPrice);
        return mapperInter.getProductClickOrderByLowPriceOfCategory(map);
    }

    @Override
    public List<ProductDto> getProductClickOrderByLowPriceOfHashTag(String keyword, String minPrice, String maxPrice) {
        Map<String, String> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("minPrice", minPrice);
        map.put("maxPrice", maxPrice);
        return mapperInter.getProductClickOrderByLowPriceOfHashTag(map);
    }

    @Override
    public List<ProductDto> getProductClickOrderByLowPriceOfLocation(String keyword, String minPrice, String maxPrice) {
        Map<String, String> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("minPrice", minPrice);
        map.put("maxPrice", maxPrice);
        return mapperInter.getProductClickOrderByLowPriceOfLocation(map);
    }

    @Override
    public List<ProductDto> getProductClickOrderByLowPriceOfName(String keyword, String minPrice, String maxPrice) {
        Map<String, String> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("minPrice", minPrice);
        map.put("maxPrice", maxPrice);
        return mapperInter.getProductClickOrderByLowPriceOfName(map);
    }

    @Override
    public List<ProductDto> getProductOfCategoryByLowPrice(String keyword) {
        return mapperInter.getProductOfCategoryByLowPrice(keyword);
    }

    @Override
    public List<ProductDto> getProductOfNameByLowPrice(String keyword) {
        return mapperInter.getProductOfNameByLowPrice(keyword);
    }

    @Override
    public List<ProductDto> getProductOfHashTagByLowPrice(String keyword) {
        return mapperInter.getProductOfHashTagByLowPrice(keyword);
    }

    @Override
    public List<ProductDto> getProductOfLocationByLowPrice(String keyword) {
        return mapperInter.getProductOfLocationByLowPrice(keyword);
    }

    @Override
    public List<Integer> getPriceOfAccomNumber(int accom_num) {
        return mapperInter.getPriceOfAccomNumber(accom_num);
    }

    @Override
    public int getProductOfLowPrice(int accom_num) {
        return mapperInter.getProductOfLowPrice(accom_num);
    }

    @Override
    public List<ProductDto> getAllProduct() {
        return mapperInter.getAllProduct();
    }

    @Override
    public List<String> selectCategory() {
        return mapperInter.selectCategory();
    }
}
