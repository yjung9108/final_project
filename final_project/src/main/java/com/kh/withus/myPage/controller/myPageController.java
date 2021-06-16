package com.kh.withus.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.Pagination;
import com.kh.withus.member.model.service.MemberService;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.service.myPageService;
import com.kh.withus.myPage.model.vo.FollowMember;


@Controller
public class myPageController {
	
	@Autowired
	private myPageService mService;
	@Autowired
	private MemberService memberService;
	
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
		return "myPage/info/pageMyInfoMain";
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
			return "myPage/info/pageMyInfoDetail";
			
		}else {
			session.setAttribute("alertMsg", "비밀번호가 틀립니다");
			return "myPage/info/pageMyInfoMain";
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
	
	// 기본정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, MultipartFile file, HttpSession session, Model model, String deleteProfile) {
		
		
		if(!file.getOriginalFilename().equals("")) { // 넘어오는값이 있을경우
			
			if(m.getMemberProfile() !=null ) { // 기존 파일이 있을 경우 ->기존파일 지워버림
				
				new File(session.getServletContext().getRealPath(m.getMemberProfile())).delete();
			}
			
			// 새로운 파일 업로드
			String changeName = saveFile(session, file);
			m.setMemberProfile("resources/profile/" + changeName); 
				
		}
		
		if(deleteProfile.equals("delete")) {
			
			if(m.getMemberProfile() !=null ) { // 기존 파일이 있을 경우 ->기존파일 지워버림
				
				new File(session.getServletContext().getRealPath(m.getMemberProfile())).delete();
			}
			
			m.setMemberProfile(null);
		
		}
		
			
			
		
		int result = mService.updateMember(m); 
		
		
		
		// 수정성공했을 경우
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			session.setAttribute("loginUser", memberService.loginMember(m));
			return "myPage/info/pageMyInfoDetail";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
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
		//5개씩
		
		
		ArrayList<FollowMember> list = mService.selectFollowList(pi, loginUser.getMemberNo());
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("myPage/activity/pageFollowList");
		
		return mv;
		
		
	}
	
	
	// 팔로우 해제/재팔로우 ajax
	@ResponseBody
	@RequestMapping("unfollow.me")
	public String unfollowMember(String memberNo, String followMemberNo, HttpSession session) {
		
		
		FollowMember m = new FollowMember();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setFollowMemberNo(Integer.parseInt(followMemberNo));
		
		System.out.println(memberNo);
		System.out.println(followMemberNo);
		
		int result = mService.unfollowMember(m);
				
		
		System.out.println("언팔로우"+result);
		if(result>0) {
			return "Y";
					
		}else {
			return "N";
		}
					
			
	}
	
	// 팔로우 해제/재팔로우 ajax
	@ResponseBody
	@RequestMapping("follow.me")
	public String followMember(String memberNo, String followMemberNo, HttpSession session) {
		
		
		FollowMember m = new FollowMember();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setFollowMemberNo(Integer.parseInt(followMemberNo));
		
		System.out.println(memberNo);
		System.out.println(followMemberNo);
		
		int result = mService.followMember(m);
				
		
		System.out.println("재팔로우"+result);
		if(result>0) {
			return "Y";
					
		}else {
			return "N";
		}
					
			
	}
	
	@RequestMapping("followUserdetail.me")
	public String followUserDetail(Member m, HttpSession session, Model model) {
		
		Member member = mService.followUserDetail(m);
		
		if(member != null) {
			session.setAttribute("m", member);
			
			return "myPage/activity/followUserDetail";
			
		}else { // => 에러페이지
			model.addAttribute("errorMsg", "에러가발생했습니다");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드 시킨 후 해당 수정된파일명(서버에 업로된파일명)을 반환하는 메소드
	// 프로필사진
	public String saveFile(HttpSession session, MultipartFile file) {
		
		String savePath = session.getServletContext().getRealPath("/resources/profile/");
		
		String originName = file.getOriginalFilename();  // 원본명 ("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}	
	
	
	
	
}
