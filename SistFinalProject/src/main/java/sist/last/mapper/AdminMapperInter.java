package sist.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sist.last.dto.AccomDto;
import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;

@Mapper
public interface AdminMapperInter {

	public int adminloginPassCheck(Map<String, String> map);
	public void adminApprovalOfAccom(int accom_num);
	public List<AccomDto> getAccomPagingList(Map<String, Integer> map);
	public int getAccomTotalCount();
	public List<ReserveDto> getPaymentPagingList(Map<String, Integer> map);
	public int getPaymentTotalCount();
	public List<BusinessDto> getBusinessPagingList(Map<String, Integer> map);
	public int getBusinessTotalCount();
	public List<MemberDto> getMemberPagingList(Map<String, Integer> map);
	public int getMemberTotalCount();
	public void adminApprovalOfBussiness(String business_id);
	public BusinessDto getBusinessId(int idx);
}
