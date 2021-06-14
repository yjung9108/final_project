package com.kh.withus.myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.myPage.model.dao.myPageDao;
import com.kh.withus.myPage.model.vo.Member;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String memberId) {
		
		return mDao.deleteMember(sqlSession, memberId);
	}

	
	

	

}
