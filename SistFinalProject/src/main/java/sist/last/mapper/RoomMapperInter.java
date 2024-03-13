package sist.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sist.last.dto.RoomDto;

@Mapper
public interface RoomMapperInter {
	
	public void insertRoom(RoomDto dto);
	public List<RoomDto> getAllData(int accom_num);
	public RoomDto getData(int accom_num);
	public int getTotalCount(int accom_num);
	public void deleteRoom(int room_num);
	public RoomDto getOneData(int room_num);
	public void updateRoom(RoomDto dto);
	public int getAccomByRoom(int accom_num);
}