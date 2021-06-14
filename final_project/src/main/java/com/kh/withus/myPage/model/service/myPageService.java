package com.kh.withus.myPage.model.service;

import com.kh.withus.myPage.model.vo.Member;

public interface myPageService {
	
	// 회원 비밀번호 확인 서비스
	int pwdConfirm(Member m);
	
	// 회원 정보수정용 서비스
	int updateMember(Member m);
	
	// 회원 탈퇴용 서비스
	int deleteMember(String memberId);

	

	
	

}
