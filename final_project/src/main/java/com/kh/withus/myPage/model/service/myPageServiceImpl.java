package com.kh.withus.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.dao.myPageDao;
import com.kh.withus.myPage.model.vo.FollowMember;

@Service
public class myPageServiceImpl implements myPageService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private myPageDao mDao;
	
	
	@Override
	public int pwdConfirm(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String memberId) {
		
		return mDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int selectFollowListCount(int memberNo) {
		return mDao.selectFollowListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<FollowMember> selectFollowList(PageInfo pi, int memberNo) {
		return mDao.selectFollowList(sqlSession, pi, memberNo);
	}

	@Override
	public int unfollowMember(FollowMember m) {
		
		return mDao.unfollowMember(sqlSession, m);
	}

	@Override
	public int followMember(FollowMember m) {
		return mDao.followMember(sqlSession, m);
	}

	@Override
	public Member followUserDetail(Member m) {
		
		return mDao.followMemberDetail(sqlSession, m);
	}

	
	

	

}
