package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;
import com.example.demo.util.Util;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	// 게시판 조회
	public List<Article> getArticles(Map<String, Object> param) {
		//페이징
		// page가 null이면 (글이 없으면) 1로 설정
		
		int page = Util.getAsInt(param.get("page"), 1);
		
		// 한 페이지에 나올 수 있는 게시물 수 (입력된 값이 없으면 10으로 씀)
		int itemsCountInPage = Util.getAsInt(param.get("itemsCountInPage"), 10);
		
		// 최소 1 ~ 100 
		if (itemsCountInPage > 100 ) {
			itemsCountInPage = 100;
		} else if (itemsCountInPage < 1 ) {
			itemsCountInPage = 1;
		}
		
		// limitFrom부터 10개씩 보여줌
		int limitFrom = (page - 1) * itemsCountInPage;
		int limitTake = itemsCountInPage;
		
		param.put("limitFrom", limitFrom);
		param.put("limitTake", limitTake);
		
		
		return articleDao.getArticles(param);
	}
	// 게시글 상세 조회
	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	// 게시글 삭제
	public void deleteArticleById(int id) {
		articleDao.deleteArticleById(id);
	}
	// 게시글 수정
	public void modifyArticle(int id, String title, String content) {
		articleDao.modifyArticle(id, title, content);	
	}
	// 게시글 등록
	public int postArticle(Map<String, Object> param) {
		articleDao.postArticle(param);	
		
		// id값이 BigInt 값이라서 int 값으로 변환해주어야 함.
		//BigInteger bigIntId = (BigInteger)param.get("id");
		//int id = bigIntId.intValue();
		
		int id = Util.getAsInt(param.get("id"));
		return id;
	}

}
