package com.example.demo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.Member;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.util.Util;

@Service
public class MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	public int join(Map<String, Object> param) {
		memberMapper.join(param);	
		int id = Util.getAsInt(param.get("id"));
		
		return id;
	}

	public boolean isJoinAvailableId(String me_id) {
		// me_id를 mapper에게 주고 회원 가져와서 id 존재 여부 확인
		Member member = memberMapper.getMemberById(me_id);
		
		// me_id가 없으면 아이디 사용 가능하므로 true 반환
		if (member == null ) {
			return true;
		}
		return false;
	}

	public Member getMemberById(String me_id) {
		return memberMapper.getMemberById(me_id);
	}
}
