package com.kh.withus.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class myPageDao {

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

}
