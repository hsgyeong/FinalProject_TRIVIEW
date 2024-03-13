package sist.last.service;

import java.util.Map;

import sist.last.dto.BusinessDto;

public interface BusinessServiceInter {

	public void insertBusiness(BusinessDto dto);
	public int BloginPassCheck(String business_id, String business_pass);
	public BusinessDto getDataByBusinessId(String business_id);
	public int getSearchBusinessId(String business_id);
	public void updateBusiness(BusinessDto dto);
	public void deleteBusiness(String business_id);
	public int getApprovalByBusinessId(String business_id);
}
