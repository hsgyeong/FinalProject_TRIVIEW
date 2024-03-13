package sist.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sist.last.dto.AccomDto;

@Mapper
public interface AccomMapperInter {
	
	public void insertAccom(AccomDto dto);
	public List<AccomDto> getAllData();
	public int getTotalCount(String business_id);
	public void deleteAccom(int accom_num);
	public AccomDto getOneData(int accom_num);
	public void updateAccom(AccomDto dto);
	public void insertReview(AccomDto dto);
	public double getAverageScore(int accom_num);
	public void InsertAccomScore(AccomDto dto);
	public void updateAccomScore(int accom_num);

	public void updateAccomCount(int accom_num);


//	chatting 사용
	public AccomDto getAccomName(int accom_num);
	public List<AccomDto> getAccomDataById(String business_id);
// chatting 사용 끝



}