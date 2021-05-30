package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	List<Article> getArticles(Map<String, Object> param);

	//MyBatis 공식 @Param
	Article getArticleById(@Param("id") int id);

	void deleteArticleById(@Param("id") int id);

	void modifyArticle(@Param("id") int id,@Param("title") String title,@Param("content") String content);

	void postArticle(Map<String, Object> param);
}
