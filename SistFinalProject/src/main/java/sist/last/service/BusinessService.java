package sist.last.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.last.dto.BusinessDto;
import sist.last.mapper.BusinessMapperInter;

@Service
public class BusinessService implements BusinessServiceInter {

	@Autowired
	BusinessMapperInter businessMapperInter;
	
	@Override
	public void insertBusiness(BusinessDto dto) {
		// TODO Auto-generated method stub
		businessMapperInter.insertBusiness(dto);
	}

	@Override
	public int BloginPassCheck(String business_id, String business_pass) {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<>();
		
		map.put("business_id", business_id);
		map.put("business_pass", business_pass);
		
		return businessMapperInter.BloginPassCheck(map);
	}

	@Override
	public BusinessDto getDataByBusinessId(String business_id) {
		// TODO Auto-generated method stub
		return businessMapperInter.getDataByBusinessId(business_id);
	}

	@Override
	public int getSearchBusinessId(String business_id) {
		// TODO Auto-generated method stub
		return businessMapperInter.getSearchBusinessId(business_id);
	}

	@Override
	public void updateBusiness(BusinessDto dto) {
		// TODO Auto-generated method stub
		businessMapperInter.updateBusiness(dto);
	}

	@Override
	public void deleteBusiness(String business_id) {
		// TODO Auto-generated method stub
		businessMapperInter.deleteBusiness(business_id);
	}

	@Override
	public int getApprovalByBusinessId(String business_id) {
		// TODO Auto-generated method stub
		return businessMapperInter.getApprovalByBusinessId(business_id);
	}



}
