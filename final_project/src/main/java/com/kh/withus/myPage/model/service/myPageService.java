package com.kh.withus.myPage.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.vo.FollowMember;

public interface myPageService {
	
	// 회원 비밀번호 확인 서비스
	int pwdConfirm(Member m);
	
	// 회원 기본 정보수정용 서비스
	int updateMember(Member m);
	
	// 회원 탈퇴용 서비스
	int deleteMember(String memberId);

	// 팔로잉 목록
	int selectFollowListCount(int memberNo);
	ArrayList<FollowMember> selectFollowList(PageInfo pi, int memberNo);

	// 팔로우
	int unfollowMember(FollowMember m);
	int followMember(FollowMember m);

	// 팔로우하는 파트너 정보
	Member followUserDetail(Member m);

	

	

	
	

}
