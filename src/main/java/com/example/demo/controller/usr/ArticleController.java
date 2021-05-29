package com.example.demo.controller.usr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

import lombok.Data;

@Data
@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("/usr/article/list")
	String ShowList(Model model) {
		List<Article> articles = articleService.getArticles();
		model.addAttribute("articles", articles);
		return "usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	String ShowDetail(Model model, int id) {
		System.out.println("id : " + id);
		
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		
		System.out.println("article" + article);

		return "usr/article/detail";
	}
}
