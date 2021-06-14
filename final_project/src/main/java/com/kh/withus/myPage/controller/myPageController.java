package com.kh.withus.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.Pagination;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.service.myPageService;
import com.kh.withus.myPage.model.vo.FollowMember;


@Controller
public class myPageController {
	
	@Autowired
	private myPageService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	// 마이페이지메인
	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage/main/myPageMain";
	}

	// 내정보 -> 비밀번호 확인창으로
	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "myPage/info/myInfoMain";
	}
	
	
	
	// 로그인된 유저 비밀번호 확인
	@RequestMapping("pwdConfirm.me")
	public String pwdConfirm(HttpServletRequest request, HttpSession session) {
		
		
		// 비밀번호 암호화 전
		// 입력받은 비밀번호
		String memberPwd = request.getParameter("memberPwd");
		
		// 로그인된 유저
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(memberPwd.equals(loginUser.getMemberPwd())) {
			return "myPage/info/myInfoDetail";
			
		}else {
			session.setAttribute("alertMsg", "비밀번호가 틀립니다");
			return "myPage/info/myInfoMain";
		}
				
		
		
		
	}
	
	//회원탈퇴폼 페이지
	@RequestMapping("deleteForm.me")
	public String deleteForm() {
		return "myPage/info/memberDrop";
	}
	
	
	// 회원탈퇴 유저 비밀번호 확인 ajax
	@ResponseBody
	@RequestMapping("pwd.me")
	public String pwd(String checkPwd, HttpSession session) {
			
			
		// 비밀번호 암호화 전
		// 입력받은 비밀번호
		
				
		// 로그인된 유저
		Member loginUser = (Member)session.getAttribute("loginUser");
				
		if(checkPwd.equals(loginUser.getMemberPwd())) {
			return "Y";
					
		}else {
			return "N";
		}
					
			
	}
	
	// 회원탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mService.deleteMember(loginUser.getMemberId());
		
		if(result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
			
			// => 메인페이지
			return "redirect:/";
			
		}else { // => 에러페이지
			model.addAttribute("errorMsg", "회원탈퇴 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	//팔로잉 목록
	@RequestMapping("followlist.me")
	public ModelAndView followList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int listCount = mService.selectFollowListCount(loginUser.getMemberNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 5);
		System.out.println(listCount);
		
		
		ArrayList<FollowMember> list = mService.selectFollowList(pi, loginUser.getMemberNo());
		
		System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("myPage/activity/myPageFollowList");
		
		return mv;
		
		
	}
	
	
	
	
	
}
