package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	List<Article> getArticles();

	//MyBatis 공식 
	Article getArticleById(@Param("id") int id);

	void deleteArticleById(@Param("id") int id);
}
