package com.example.demo.controller.usr;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

import lombok.Data;

@Data
@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("/usr/article/list")
	String ShowList(Model model, @RequestParam Map<String, Object> param) {
		List<Article> articles = articleService.getArticles(param);
		
		model.addAttribute("articles", articles);
		model.addAttribute("name", "김나");

		return "board/list";
	}
	
	@RequestMapping("/usr/article/detail")
	String ShowDetail(Model model, int id) {	
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		
		System.out.println("article" + article);

		return "board/detail";
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	String doDelete(int id) {
		articleService.deleteArticleById(id);
		
		//location.href로 이동하면 user가 backspace로 뒤로가기 가능함(주의)
		return String.format("<script> alert('%d번 글을 삭제하였습니다.'); location.replace('/usr/article/list') </script>", id);
	}

	// 글 수정
	@RequestMapping("/usr/article/modify")
	String ShowModify(Model model, int id) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		model.addAttribute("actionUrl", "doModify");
		
		return "board/post";
		}
		
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	String doModify(int id, String title, String content) {
		articleService.modifyArticle(id, title, content);
	
		return String.format("<script> alert('%d번 글을 수정하였습니다.'); location.replace('/usr/article/detail?id=%d') </script>", id, id);
		}
	
	// 글 등록
	@RequestMapping("/usr/article/post")
	String ShowPost(Model model) {
		model.addAttribute("actionUrl", "doPost");
		return "board/post";
		}
	
	@RequestMapping("/usr/article/doPost")
	@ResponseBody
	String doPost(@RequestParam Map<String, Object> param) {
		//글이 생성될 때 id 값을 받아와야 함
		int id = articleService.postArticle(param);
		
		return String.format("<script> alert('%d번 글이 생성되었습니다.'); location.replace('/usr/article/detail?id=%d') </script>", id, id);
		}
	
	}