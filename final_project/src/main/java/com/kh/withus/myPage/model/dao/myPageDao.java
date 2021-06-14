package com.kh.withus.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.myPage.model.vo.FollowMember;

@Repository
public class myPageDao {

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int selectFollowListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.selectFollowListCount");
	
	}

	public ArrayList<FollowMember> selectFollowList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowList", null, rowBounds);
	}
	
	

}
