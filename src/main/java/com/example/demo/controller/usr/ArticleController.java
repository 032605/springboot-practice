package com.example.demo.controller.usr;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;

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
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	String doDelete(int id) {
		articleService.deleteArticleById(id);
		
		//location.href로 이동하면 user가 backspace로 뒤로가기 가능함(주의)
		return String.format("<script> alert('%d번 글을 삭제하였습니다.'); location.replace('/usr/article/list') </script>", id);
	}


@RequestMapping("/usr/article/doModify")
@ResponseBody
String doModify(int id, String title, String content) {
	articleService.modifyArticle(id, title, content);

	return String.format("<script> alert('%d번 글을 수정하였습니다.'); location.replace('/usr/article/detail?id=%d') </script>", id, id);
	}

@RequestMapping("/usr/article/post")
String ShowPost() {

	return "/usr/article/post";
	}


@RequestMapping("/usr/article/doPost")
@ResponseBody
String doPost(@RequestParam Map<String, Object> param) {
	//글이 생성될 때 id 값을 받아와야 함
	int id = articleService.postArticle(param);
	
	return String.format("<script> alert('%d번 글이 생성되었습니다.'); location.replace('/usr/article/detail?id=%d') </script>", id, id);
	}

}

