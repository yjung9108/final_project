package com.kh.withus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.member.model.service.MemberService;
import com.kh.withus.member.model.vo.Member;

@Controller // 다음과 같이 Controller타입의 어노테이션을 붙여주면 빈 스캐닝을 통해서 자동으로 빈으로 등록될꺼임 (스프링이 알아서 관리할꺼임)
public class MemberController {
	
	// DI (Dependency Injection)
	// Autowired 타입의 어노테이션을 붙여주면 내가 직접 생성할 필요없이
	// 등록되어 있는 빈들 중에서 해당 타입과 맞는 클래스를 찾아서 자동으로 생성 후 주입해줌!!
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		
		
		Member loginUser = mService.loginMember(m);
		if(loginUser == null) { // 로그인 실패
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}else { // 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
		
		
		
		
		
	}
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
}
