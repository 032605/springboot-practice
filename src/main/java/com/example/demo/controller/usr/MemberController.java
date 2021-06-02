package com.example.demo.controller.usr;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Data;

@Data
@Controller
public class MemberController {
	@RequestMapping("member/join")
	String showjoin() {
		return "member/join";
	}
	
	@RequestMapping("member/doJoin")
	@ResponseBody
	String dojoin(@RequestParam Map<String, Object> Param) {
		
		//{me_nickname=닉네임 적은거, me_id=, me_password=, userPass2=} 이런 식으로 확인 가능
		return Param.toString();
	}
}