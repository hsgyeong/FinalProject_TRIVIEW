package sist.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.last.dto.AccomDto;
import sist.last.dto.BusinessDto;
import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;
import sist.last.mapper.AdminMapperInter;

@Service
public class AdminMapperService implements AdminMapperServiceInter {

	@Autowired
	AdminMapperInter mapper;

	@Override
	public int adminloginPassCheck(String admin_id, String admin_pass) {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("admin_id", admin_id);
		map.put("admin_pass", admin_pass);
		
		return mapper.adminloginPassCheck(map);
	}

	@Override
	public void adminApprovalOfAccom(int accom_num) {
		// TODO Auto-generated method stub
		mapper.adminApprovalOfAccom(accom_num);
	}

	@Override
	public List<AccomDto> getAccomPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getAccomPagingList(map);
	}

	@Override
	public int getAccomTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getAccomTotalCount();
	}

	@Override
	public List<ReserveDto> getPaymentPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPaymentPagingList(map);
	}

	@Override
	public int getPaymentTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getPaymentTotalCount();
	}

	@Override
	public List<BusinessDto> getBusinessPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getBusinessPagingList(map);
	}

	@Override
	public int getBusinessTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getBusinessTotalCount();
	}

	@Override
	public List<MemberDto> getMemberPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getMemberPagingList(map);
	}

	@Override
	public int getMemberTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getMemberTotalCount();
	}

	@Override
	public void adminApprovalOfBussiness(String business_id) {
		// TODO Auto-generated method stub
		mapper.adminApprovalOfBussiness(business_id);
	}

	@Override
	public BusinessDto getBusinessId(int idx) {
		// TODO Auto-generated method stub
		return mapper.getBusinessId(idx);
	}
}
