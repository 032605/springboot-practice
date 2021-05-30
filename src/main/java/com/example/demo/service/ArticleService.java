package com.example.demo.service;

import java.math.BigInteger;
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
	public List<Article> getArticles() {
		return articleDao.getArticles();
	}
	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	public void deleteArticleById(int id) {
		articleDao.deleteArticleById(id);
	}
	public void modifyArticle(int id, String title, String content) {
		articleDao.modifyArticle(id, title, content);	
	}
	public int postArticle(Map<String, Object> param) {
		articleDao.postArticle(param);	
		
		// id값이 BigInt 값이라서 int 값으로 변환해주어야 함.
		//BigInteger bigIntId = (BigInteger)param.get("id");
		//int id = bigIntId.intValue();
		
		int id = Util.getAsInt(param.get("id"));
		return id;
	}

}
