package sist.last.service;

import java.util.List;
import java.util.Map;

import sist.last.dto.AccomDto;
import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;

public interface AdminMapperServiceInter {

	public int adminloginPassCheck(String admin_id,String admin_pass);
	public void adminApprovalOfAccom(int accom_num);
	public List<AccomDto> getAccomPagingList(int start, int perpage);
	public int getAccomTotalCount();
	public List<ReserveDto> getPaymentPagingList(int start, int perpage);
	public int getPaymentTotalCount();
	public List<BusinessDto> getBusinessPagingList(int start, int perpage);
	public int getBusinessTotalCount();
	public List<MemberDto> getMemberPagingList(int start, int perpage);
	public int getMemberTotalCount();
	public void adminApprovalOfBussiness(String business_id);
	public BusinessDto getBusinessId(int idx);
}
