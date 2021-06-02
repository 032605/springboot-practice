package com.example.demo.controller.usr;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;

import lombok.Data;

@Data
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("member/join")
	String showjoin() {
		return "member/join";
	}
	
	@RequestMapping("member/doJoin")
	@ResponseBody
	String dojoin(@RequestParam Map<String, Object> param) {
		//회원 생성될 때 id 값을 받아와야 함
		int id = memberService.join(param);
		
		return String.format("<script> alert('%d번 회원 환영!'); location.replace('/usr/article/list') </script>", id);
		//{me_nickname=닉네임 적은거, me_id=, me_password=, userPass2=} 이런 식으로 확인 가능
		//return Param.toString();
	}
}