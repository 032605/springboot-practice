package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.Article;
import com.example.demo.mapper.ArticleDao;
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
}
