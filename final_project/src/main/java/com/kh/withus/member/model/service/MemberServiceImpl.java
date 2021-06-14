package com.kh.withus.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.member.model.dao.MemberDao;
import com.kh.withus.member.model.vo.Member;

//@Component
@Service // 보다 구체화된 즉, Service의 역할을 가진 클래스라는 걸 보여주기 위한 어노테이션
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		
		//Member loginUser = mDao.loginMember(sqlSession, m);
		//return loginUser;
		return mDao.loginMember(sqlSession, m);
	}

	
}
