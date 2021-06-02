package com.example.demo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.Member;

@Mapper
public interface MemberMapper {
	int join(Map<String, Object> param);

	Member getMemberById(@Param("me_id") String me_id);
	
}
