package sist.last.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sist.last.dto.ReviewDto;

@Mapper
public interface ReviewMapperInter {

	public void insertReview(ReviewDto dto);
	public List<ReviewDto> ReviewList(int accom_num);
	public int ReviewTotalCount(int accom_num);
	public List<ReviewDto> getList(HashMap<String, Integer> map);
//	public int InfoIdTotalCount(String info_id);
	public int InfoIdTotalCount(String info_id, int accom_num);
	
}
