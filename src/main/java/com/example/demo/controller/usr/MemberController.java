package com.example.demo.controller.usr;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

import lombok.Data;

@Data
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("member/login")
	String showlogin() {
		return "member/login";
	}
	
	@RequestMapping("member/doLogin")
	@ResponseBody
	String dologin(String me_id, String me_password, HttpSession session, HttpServletRequest req) {
	
		// javascript 상 써줘도 controller에 무조건 써줘야함 (파라미터, js 무력화 등 방지)
		if ( me_id.length() == 0 ) {
			return String.format("<script> alert('로그인 아이디를 입력해주세요.'); histroy.back(); </script>");
		}
		
		// 회원 정보 받아와서 아이디, 비밀번호 DB와 대조 
		Member memebr = memberService.getMemberById(me_id);
		if( memebr == null ) {
			return String.format("<script> alert('%s은(는) 존재하지 않는 아이디입니다.'); location.replace('/member/login'); </script>", me_id);
		}
		
		if( memebr.getMe_password().equals(me_password) == false ) {
			return String.format("<script> alert('비밀번호가 틀렸습니다.'); location.replace('/member/login'); </script>");
		}
		
		// 세션 유지 (회원 번호와 일치하는 경우 로그인 유지) 
		session.setAttribute("loginedMemberId", memebr.getId());
		// 세션 유지 다른 방법 : req.getSession();
		
		return String.format("<script> alert('%s님 환영합니다.'); location.replace('/usr/article/list') </script>", memebr.getMe_nickname());
		// 확인용 return param.toString();
	}
	
	@RequestMapping("member/doLogout")
	@ResponseBody
	String dologout(HttpSession session) {
 
		session.removeAttribute("loginedMemberId");
		
		return String.format("<script> location.replace('/usr/article/list') </script>");
	}
	
	
	@RequestMapping("member/join")
	String showjoin() {
		return "member/join";
	}
	
	@RequestMapping("member/doJoin")
	@ResponseBody
	String dojoin(@RequestParam Map<String, Object> param) {
		 
		String me_id = Util.getAsStr(param.get("me_id"),"");
		
		// javascript 상 써줘도 controller에 무조건 써줘야함 (파라미터, js 무력화 등 방지)
		if ( me_id.length() == 0 ) {
			return String.format("<script> alert('로그인 아이디를 입력해주세요.'); histroy.back(); </script>");
		}
		
		// id 중복체크 
		boolean isJoinAvailableId = memberService.isJoinAvailableId(me_id);
		
		if (isJoinAvailableId == false ) {
			return String.format("<script> alert('%s(은)는 이미 사용 중인 아이디입니다.'); location.replace('/member/join') </script>", me_id);
		}
		
		
		//회원 생성될 때 회원번호 생성
		int id = memberService.join(param);
		
		return String.format("<script> alert('%d번 회원 환영!'); location.replace('/usr/article/list') </script>", id);
		//{me_nickname=닉네임 적은거, me_id=, me_password=, userPass2=} 이런 식으로 확인 가능
		//return Param.toString();
	}
	
	
}