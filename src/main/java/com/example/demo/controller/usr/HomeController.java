package com.example.demo.controller.usr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "안녕";
	}

	@RequestMapping("/usr/home/plus")
	@ResponseBody
	public int showPlus(int a, int b) {
		return a + b;
	}
	
	@RequestMapping("/usr/home/minus")
	@ResponseBody
	public int showMinus(int a, int b) {
		return a - b;
	}
}
