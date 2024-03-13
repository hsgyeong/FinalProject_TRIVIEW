package sist.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import sist.last.dto.MemberDto;
import sist.last.dto.ReserveDto;
import sist.last.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapperInter;
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMember(dto);	
	}

	@Override
	public int loginPassCheck(String info_id, String info_pass) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		
		map.put("info_id", info_id);
		
		String pass = mapperInter.getPasswordById(info_id);
		boolean passMatch = info_pass.equals(pass);
			
		map.put("info_pass", info_pass);
		
	//	return mapperInter.loginPassCheck(map);
		return passMatch ? 1:0;
	}

	@Override
	public MemberDto getDataById(String info_id) {
		// TODO Auto-generated method stub
		return mapperInter.getDataById(info_id);
	}

	@Override
	public int getSearchId(String info_id) {
		// TODO Auto-generated method stub
		return mapperInter.getSearchId(info_id);
	}

	@Override
	public int getSearchNick(String info_nickname) {
		// TODO Auto-generated method stub
		return mapperInter.getSearchNick(info_nickname);
	}

	@Override
	public String getNickname(String info_id) {
		// TODO Auto-generated method stub
		return mapperInter.getNickname(info_id);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapperInter.getAllMembers();
	}

	@Override
	public void updateMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		mapperInter.updateMember(memberDto);
	}

	@Override
	public void deleteMember(String info_id) {
		// TODO Auto-generated method stub
		mapperInter.deleteMember(info_id);
	}

	@Override
	public int getCouponCount(String info_id) {
		// TODO Auto-generated method stub
		return mapperInter.getCouponCount(info_id);
	}

	@Override
	@Transactional(readOnly = true)
	public Map<String, String> validateHandling(Errors errors) {
		// TODO Auto-generated method stub
		
		Map<String, String> validatorResult = new HashMap<>();
		
		for (FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		
		return validatorResult;
	}

	@Override
	public String getPasswordById(String info_id) {
		// TODO Auto-generated method stub
		return mapperInter.getPasswordById(info_id);
	}

}
