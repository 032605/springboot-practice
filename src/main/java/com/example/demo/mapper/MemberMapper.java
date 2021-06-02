package com.example.demo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.util.Util;

@Mapper
public interface MemberMapper {
	int join(Map<String, Object> param);
	
}
