package sist.last.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sist.last.dto.ProductDto;
import sist.last.service.NonBookableService;
import sist.last.service.ProductService;

@Controller
public class ProductController {

    String selectDate1;
    String selectDate2;
    List<String> categoryList;

    double userLat;

    double userLong;

    @Autowired
    ProductService pService;

    @Autowired
    NonBookableService nService;

    public ProductController() {
        ProductDto productDto = new ProductDto();
    }

    @GetMapping("/product/search-main")
    public String searchMainForm(@RequestParam String keyword, Model model,
                                 @RequestParam(required = false) String selDate1,
                                 @RequestParam(required = false) String selDate2,
                                 @RequestParam(required = false) String minPrice,
                                 @RequestParam(required = false) String maxPrice,
                                 @RequestParam(required = false) String sort,
                                 @RequestParam(required = false) String selCate,
                                 @RequestParam(required = false) String latitude,
                                 @RequestParam(required = false) String longitude) {
    	
        System.out.println("keyword : " + keyword);
        if (keyword.isEmpty()) {
            model.addAttribute("sortSurrounding", "yes");
        }
        categoryList = new ArrayList<>();
        selectDate1 = selDate1;
        selectDate2 = selDate2;
        System.out.println("위도 : " + latitude + ",경도 : " + longitude);
        if (latitude != null) {
            userLat = Double.parseDouble(latitude);
            userLong = Double.parseDouble(longitude);
        }
        List<String> category = pService.selectCategory();
        if (selCate == "") {
            selCate = null;
        }
        System.out.println("정렬: " + sort + ",선택한 카테고리: " + selCate);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
        isSelDateNull(selDate1);
        processDateSelection(selectDate1, selectDate2, model);
        List<ProductDto> products = searchCompareKeyword(keyword);
        if (selCate != null) {
            String[] splitCategory = selCate.split(",");
            for (int arrayIndex = 0; arrayIndex < splitCategory.length; arrayIndex++) {
                categoryList.add(splitCategory[arrayIndex].trim());
                model.addAttribute("selCate", categoryList);
            }
            assert products != null;
            products = compareSelectCategory(products);
        }
        //System.out.println(products.size() + " 개 의 데이터");
        if (products != null) {
            //System.out.println("selDate1이 null이 아님");
            products = compareLimitDate(products, selectDate1, selectDate2);
            if (sort != null) {
                model.addAttribute("sort", sort);
                //System.out.println(products.size() + " 개 의 데이터");
                compareSort(sort, model, minPrice,
                        maxPrice, products, keyword);
                return "/product/searchMainPage";
            }
            if (minPrice == null) {
                model.addAttribute("productList", products);
            }
            if (products.isEmpty()) {
                model.addAttribute("productList", null);
                return "/product/searchMainPage";
            }
            //System.out.println(products.get(0).getAccom_name());
            //products = compareLimitPrice(products);
            if (minPrice != null) {
                //System.out.println("여기까진 들어감");
                System.out.println(products.size() + " 개 의 데이터");
                processPriceSelection(minPrice, maxPrice, model, products);
                return "/product/searchMainPage";
            }
        }
        
        return "/product/searchMainPage";
    }

    @GetMapping("/product/msr")
    public String currentLocationSortProduct(@RequestParam double latitude,
                                             @RequestParam double longitude,
                                             @RequestParam(required = false) String selDate1,
                                             @RequestParam(required = false) String selDate2,
                                             @RequestParam(required = false) String minPrice,
                                             @RequestParam(required = false) String maxPrice,
                                             @RequestParam(required = false) String sort,
                                             @RequestParam(required = false) String selCate,
                                             Model model) {
        model.addAttribute("latitude", latitude);
        model.addAttribute("longitude", longitude);
        model.addAttribute("mySurrounding", "yes");
        categoryList = new ArrayList<>();
        userLat = latitude;
        userLong = longitude;
        if (selDate1 != null) {
            selectDate1 = selDate1;
            selectDate2 = selDate2;
            System.out.println(selectDate2);
        }
        if (selCate == "") {
            selCate = null;
        }

    	
        List<ProductDto> allProducts = pService.getAllProduct();
        isSelDateNull(selectDate1);
        processDateSelection(selectDate1, selectDate2, model);
        allProducts = compareLimitDate(allProducts, selectDate1, selectDate2);
        sortDistanceOfProduct(allProducts);
        allProducts = exceptLongDistance(allProducts);
        if (selCate != null) {
            String[] splitCategory = selCate.split(",");
            for (String s : splitCategory) {
                categoryList.add(s.trim());
                model.addAttribute("selCate", categoryList);
            }
            allProducts = compareSelectCategory(allProducts);
        }
        if (sort != null) {
            model.addAttribute("sort", sort);
            //System.out.println(products.size() + " 개 의 데이터");
            compareMySurroundingSort(sort, model, minPrice, maxPrice, allProducts);
            return "/product/searchMainPage";
        }
        if (minPrice != null) {
            //System.out.println("여기까진 들어감");
            System.out.println(allProducts.size() + " 개 의 데이터");
            processPriceSelection(minPrice, maxPrice, model, allProducts);
            return "/product/searchMainPage";
        }
        model.addAttribute("productList", allProducts);
    	
        return "/product/searchMainPage";
    }

    private List<ProductDto> exceptLongDistance(List<ProductDto> products) {
        List<ProductDto> exceptProduct = new ArrayList<>();

        for (ProductDto product : products) {
            if (product.getDistance() <= 10000) {
                exceptProduct.add(product);
                System.out.println(product.getDistance());
            }
        }
        return exceptProduct;
    }

    private void compareMySurroundingSort(String sort, Model model,
                                          String minPrice, String maxPrice,
                                          List<ProductDto> products) {
        System.out.println("숙소 갯수 : " + products.size());
        products = settingPrice(minPrice, maxPrice, model, products);
        mySurroundingSort(products, sort);
        assert products != null;
        for (ProductDto p : products) {
            System.out.println("방가격: " + p.getRoom_price());
        }
        model.addAttribute("productList", products);
    }

    private void mySurroundingSort(List<ProductDto> products, String sort) {
        if (sort.equals("lowprice")) {
            Collections.sort(products, Comparator.comparing(ProductDto::getRoom_price));
        }
        if (sort.equals("score")) {
            Collections.sort(products, Comparator.comparing(ProductDto::getAccom_score).reversed());
        }
    }

    private List<ProductDto> searchCompareKeyword(String keyword) {
        List<ProductDto> categoryList = pService.getProductDataOfCategory(keyword);
        if (!categoryList.isEmpty()) {
            System.out.println("카테고리");
            return categoryList;
        }
        List<ProductDto> locationList = pService.getProductDataOfLocation(keyword);
        if (!locationList.isEmpty()) {
            System.out.println("지역");
            return locationList;
        }
        List<ProductDto> nameList = pService.getProductDataOfName(keyword);
        if (!nameList.isEmpty()) {
            System.out.println("이름");
            return nameList;
        }
        List<ProductDto> hashtagList = pService.getProductDataOfHashTag(keyword);
        if (!hashtagList.isEmpty()) {
            System.out.println("해시태그");
            return hashtagList;
        }
        return null;
    }

    private void isSelDateNull(String selDate1) {
        if (selDate1 == null) {
            LocalDate today = LocalDate.now();
            LocalDate tomorrow = today.plusDays(1);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            selectDate1 = today.format(formatter);
            selectDate2 = tomorrow.format(formatter);
            //System.out.println(selDate1 + "," + selDate2);
        }
    }

    private List<ProductDto> compareSelectCategory(List<ProductDto> products) {
        List<ProductDto> result = new ArrayList<>();
        for (ProductDto product : products) {
            System.out.println(product.getAccom_name() + "의 카테고리 : " + product.getAccom_category());
            if (!isEqualInputCategory(product)) {
                continue;
            }
            result.add(product);
        }
        return result;
    }

    private void processDateSelection(String selectDate1, String selectDate2,
                                      Model model) {
        int[] splitDate1 = new int[3];
        int[] splitDate2 = new int[3];
        int sleep = 1;
        if (selectDate1 != null) {
            splitDate1 = splitIntegerDay(selectDate1);
            splitDate2 = splitIntegerDay(selectDate2);
            sleep = calculateSleep(splitDate1, splitDate2);
        }
        System.out.println(selectDate2);
        model.addAttribute("selDate1", selectDate1);
        model.addAttribute("selDate2", selectDate2);
        model.addAttribute("firstYear", splitDate1[0]);
        model.addAttribute("firstMonth", splitDate1[1]);
        model.addAttribute("firstDay", splitDate1[2]);
        model.addAttribute("secondYear", splitDate2[0]);
        model.addAttribute("secondMonth", splitDate2[1]);
        model.addAttribute("secondDay", splitDate2[2]);
        model.addAttribute("sleep", sleep);
    }

    private void processPriceSelection(String minPrice, String maxPrice,
                                       Model model, List<ProductDto> products) {
        System.out.println("저장됨");
        products = settingPrice(minPrice, maxPrice, model, products);

        model.addAttribute("productList", products);
    }

    private List<ProductDto> settingPrice(String minPrice, String maxPrice,
                                          Model model, List<ProductDto> products) {
        int integerMinPrice = Integer.parseInt(minPrice);
        int integerMaxPrice = Integer.parseInt(maxPrice);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        System.out.println("min:" + integerMinPrice + ", max:" + integerMaxPrice);
        if (integerMaxPrice == 300000) {
            return selectLimitMinPrice(integerMinPrice, products);
        }
        if (integerMaxPrice != 300000) {
            return selectLimitPrice(integerMinPrice, integerMaxPrice, products);
        }
        return null;
    }

    private void compareSort(String sort, Model model, String minPrice,
                             String maxPrice, List<ProductDto> products,
                             String keyword) {
        int integerMinPrice = Integer.parseInt(minPrice);
        int integerMaxPrice = Integer.parseInt(maxPrice);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        if (integerMaxPrice == 300000) {
            products = selectLimitMinPrice(integerMinPrice, products);
        }
        if (integerMaxPrice != 300000) {
            products = selectLimitPrice(integerMinPrice, integerMaxPrice, products);
        }
        List<ProductDto> sortProducts = new ArrayList<>();
        if (sort.equals("distance")) {
            sortProducts = sortDistanceOfProduct(products);
            /*for (int i = 0; i < sortProducts.size(); i++) {
                System.out.println(sortProducts.get(i).getDistance());
            }*/
        }
        if (sort.equals("lowprice")) {
            sortProducts = sortLowPriceOfProducts(keyword, integerMinPrice, integerMaxPrice);
            //System.out.println("가격순 리스트 갯수 : " + sortProducts.size());
        }
        if (sort.equals("score")) {
            sortProducts = products;

        }
        model.addAttribute("productList", sortProducts);
    }

    private List<ProductDto> sortDistanceOfProduct(List<ProductDto> products) {
        for (ProductDto product : products) {
            double distance = getDistance(userLat, userLong, product.getAccom_latitude(), product.getAccom_longitude());
            product.setDistance(distance);
        }
        Collections.sort(products, Comparator.comparing(ProductDto::getDistance));
        return products;
    }

    private double getDistance(double lat1, double lon1, double lat2, double lon2) {
        double EARTH_RADIUS = 6371.0;

        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1)) * Math.cos(
                Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        //System.out.println("거리 : " + EARTH_RADIUS * c * 1000);
        return EARTH_RADIUS * c * 1000;
    }

    private List<ProductDto> sortLowPriceOfProducts(String keyword, int minPrice, int maxPrice) {
        List<ProductDto> products = selectLowPrice(keyword);
        List<ProductDto> sortedProducts = new ArrayList<>();
        assert products != null;
        products = compareLimitDate(products, selectDate1, selectDate2);
        for (ProductDto product : products) {
            System.out.println(product.getAccom_name() + "의 카테고리 : " + product.getAccom_category());
            if (!isEqualInputCategory(product)) {
                continue;
            }
            if (sortPrice(product, minPrice, maxPrice, sortedProducts)) {
                System.out.println("방 이름 : " + product.getAccom_name());
                int price = pService.getProductOfLowPrice(product.getAccom_num());
                product.setRoom_price(price);
                sortedProducts.add(product);
            }
        }
        return sortedProducts;
    }

    private boolean isEqualInputCategory(ProductDto product) {
        if (categoryList.isEmpty()) {
            return true;
        }
        for (String category : categoryList) {
            if (category.equals(product.getAccom_category())) {
                return true;
            }
        }
        return false;
    }

    private boolean sortPrice(ProductDto product, int minPrice, int maxPrice,
                              List<ProductDto> sortedProducts) {
        if (maxPrice == 300000) {
            return sortPriceOfMinPrice(product, minPrice, sortedProducts);
        }
        return sortPriceOfRangePrice(product, minPrice, maxPrice, sortedProducts);
    }

    private boolean sortPriceOfMinPrice(ProductDto product, int minPrice,
                                        List<ProductDto> sortedProducts) {
        if (!sortedProducts.isEmpty()) {
            if (isDuplicateAccom(product, sortedProducts)) {
                return false;
            }
            return product.getRoom_price() >= minPrice;
        }
        return product.getRoom_price() >= minPrice;

    }

    private boolean sortPriceOfRangePrice(ProductDto product, int minPrice, int maxPrice,
                                          List<ProductDto> sortedProducts) {
        if (!sortedProducts.isEmpty()) {
            if (isDuplicateAccom(product, sortedProducts)) {
                return false;
            }
            return product.getRoom_price() >= minPrice && product.getRoom_price() <= maxPrice;
        }
        return product.getRoom_price() >= minPrice && product.getRoom_price() <= maxPrice;
    }

    private boolean isDuplicateAccom(ProductDto product, List<ProductDto> sortedProducts) {
        //System.out.println("중복체크할 방이름 : " + product.getAccom_name());
        for (ProductDto dto : sortedProducts) {
            if (product.getAccom_num() == dto.getAccom_num()) {
                return true;
            }
        }
        return false;
    }

    private List<ProductDto> selectLimitMinPrice(int minPrice, List<ProductDto> products) {
        List<ProductDto> selectProductList = new ArrayList<>();
        for (ProductDto product : products) {
            if (compareEachRoomMinPrice(product, minPrice)) {
                selectProductList.add(product);
            }
        }
        return selectProductList;
    }

    private boolean compareEachRoomMinPrice(ProductDto productDto, int minPrice) {
        //System.out.println("hihi");
        //System.out.println(productDto.getAccom_num());
        List<Integer> priceList = pService.getPriceOfAccomNumber(productDto.getAccom_num());
        //System.out.println("list size : " + priceList.size());
        for (int price : priceList) {
            if (price >= minPrice) {
                return true;
            }
        }
        return false;
    }

    private List<ProductDto> selectLimitPrice(int minPrice, int maxPrice, List<ProductDto> products) {
        //System.out.println("최소 : " + minPrice + ", 최대 : " + maxPrice);
        List<ProductDto> selectProductList = new ArrayList<>();
        for (ProductDto product : products) {
            if (compareEachRoomPrice(product, minPrice, maxPrice)) {
                selectProductList.add(product);
            }
            //System.out.println("가격 : " + price);
        }
        return selectProductList;
    }

    private boolean compareEachRoomPrice(ProductDto productDto, int minPrice, int maxPrice) {
        List<Integer> priceList = pService.getPriceOfAccomNumber(productDto.getAccom_num());
        for (int price : priceList) {
            if (price >= minPrice && price <= maxPrice) {
                //System.out.println("가격 저장 " + product.getAccom_name());
                return true;
            }
        }
        return false;
    }

    private List<ProductDto> selectLowPrice(String keyword) {
        List<ProductDto> categoryList = pService.getProductOfCategoryByLowPrice(keyword);
        if (!categoryList.isEmpty()) {
            return categoryList;
        }
        List<ProductDto> locationList = pService.getProductOfLocationByLowPrice(keyword);
        if (!locationList.isEmpty()) {
            return locationList;
        }
        List<ProductDto> nameList = pService.getProductOfNameByLowPrice(keyword);
        if (!nameList.isEmpty()) {
            return nameList;
        }
        List<ProductDto> hashtagList = pService.getProductOfHashTagByLowPrice(keyword);
        if (!hashtagList.isEmpty()) {
            return hashtagList;
        }
        return null;
    }

    private List<ProductDto> compareLimitDate(List<ProductDto> products, String selDate1, String selDate2) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d");
        //System.out.println("제외날짜비교 로직 들어옴");
        LocalDate checkinDate = LocalDate.parse(selDate1, formatter);
        LocalDate checkoutDate = LocalDate.parse(selDate2, formatter);
        List<ProductDto> nonDuplicateList = new ArrayList<>();
        for (ProductDto dto : products) {
            //System.out.println("for문 안에 들어옴");
            int accom_num = dto.getAccom_num();
            //System.out.println("accomnum: " + accom_num);
            List<String> checkin = nService.getNonBookableCheckin(accom_num);
            List<String> checkout = nService.getNonBookableCheckout(accom_num);
            //System.out.println("list size : " + checkin.size());
            if (!duplicateDate(checkin, checkout, checkinDate, checkoutDate)) {
                nonDuplicateList.add(dto);
                //System.out.println("발생안해서 dto 저장");
                //System.out.println("리스트사이즈 : " + nonDuplicateList.size());
            }
        }
        return nonDuplicateList;
    }

    private boolean duplicateDate(List<String> checkinList, List<String> checkoutList,
                                  LocalDate checkinDate, LocalDate checkoutDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        for (int i = 0; i < checkinList.size(); i++) {
            //System.out.println(checkinDate + "," + checkoutDate + "," + checkinList.get(i) + "," + checkoutList.get(i));
            LocalDate existingCheckin = LocalDate.parse(checkinList.get(i), formatter);
            LocalDate existingCheckout = LocalDate.parse(checkoutList.get(i), formatter);

            // 새로운 체크인 날짜가 기존 기간에 포함되거나
            // 새로운 체크아웃 날짜가 기존 기간에 포함되는 경우 중복으로 처리
            if ((checkinDate.isBefore(existingCheckout) || checkinDate.isEqual(existingCheckout)) &&
                    (checkoutDate.isAfter(existingCheckin) || checkoutDate.isEqual(existingCheckin))) {
                //System.out.println("중복발생");
                return true; // 중복이 발생했음
            }
        }
        //System.out.println("중복발생x");
        return false; // 중복이 없음
    }

    private int[] splitIntegerDay(String selDate) {
        String[] splitDay = selDate.split("-");
        int[] integerDay = new int[splitDay.length];
        for (int i = 0; i < integerDay.length; i++) {
            integerDay[i] = Integer.parseInt(splitDay[i]);
            //System.out.println(integerDay[i]);
        }
        return integerDay;
    }

    private int calculateSleep(int[] first, int[] second) {
        return compareYear(first, second);
    }

    private int compareYear(int[] first, int[] second) {
        if (first[0] == second[0]) {
            return compareMonth(first, second);
        }
        return divideYear(first, second);
    }

    private int compareMonth(int[] first, int[] second) {
        if (first[1] == second[1]) {
            return compareDay(first, second);
        }
        return divideMonth(first, second);
    }

    private int compareDay(int[] first, int[] second) {
        return second[2] - first[2];
    }

    private int divideYear(int[] first, int[] second) {
        return 31 - first[2] + second[2];
    }

    private int divideMonth(int[] first, int[] second) {
        int firstDate = getDate(first[1], first[0]);

        return second[2] + firstDate - first[2];
    }

    private int getDate(int month, int year) {
        Calendar cal = Calendar.getInstance();

        cal.set(year, (month - 1), 1);

        return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
}
