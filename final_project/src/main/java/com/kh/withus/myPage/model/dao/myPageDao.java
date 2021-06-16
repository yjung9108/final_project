package com.kh.withus.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.vo.FollowMember;

@Repository
public class myPageDao {

	// 회원탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	// 팔로우 목록 카운트
	public int selectFollowListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.selectFollowListCount", memberNo);
	
	}

	// 팔로우 목록 
	public ArrayList<FollowMember> selectFollowList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowList", memberNo, rowBounds);
	}

	// 회원정보수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	
	}

	// 언팔
	public int unfollowMember(SqlSessionTemplate sqlSession, FollowMember m) {

		return sqlSession.delete("memberMapper.unfollowMember", m);
	}

	public int followMember(SqlSessionTemplate sqlSession, FollowMember m) {
		return sqlSession.insert("memberMapper.followMember", m);
	}

	public Member followMemberDetail(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.followMemberDetail", m);
	}
	
	

}
