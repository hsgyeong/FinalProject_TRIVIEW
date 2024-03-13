package sist.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sist.last.dto.ReserveDto;

@Mapper
public interface ReserveMapperInter {

	public void reservingInsert(ReserveDto dto);
	public ReserveDto getOneDataByIdOfReserve(Map<String, Object> map);
	public int getMaxIdxOfReserve();
	public List<ReserveDto> getOneInfoData(String info_id, int accom_num);
	public List<ReserveDto> getReserveCountOfRoomNumber(int room_num);
	public List<ReserveDto> getReservationDataById(String info_id);
	public void updateReserveStatus(ReserveDto dto);
	public String getPhoto(String room_num);
	
}
