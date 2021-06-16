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
		
		return sqlSession.update("myPageMapper.deleteMember", memberId);
	}

	// 팔로우 목록 카운트
	public int selectFollowListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.selectFollowListCount", memberNo);
	
	}

	// 팔로우 목록 
	public ArrayList<FollowMember> selectFollowList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectFollowList", memberNo, rowBounds);
	}

	// 회원정보수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("myPageMapper.updateMember", m);
	
	}

	// 언팔
	public int unfollowMember(SqlSessionTemplate sqlSession, FollowMember m) {

		return sqlSession.delete("myPageMapper.unfollowMember", m);
	}
	
	// 팔로우
	public int followMember(SqlSessionTemplate sqlSession, FollowMember m) {
		return sqlSession.insert("myPageMapper.followMember", m);
	}

	// 파트너 정보 페이지
	public Member partnerDetail(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("myPageMapper.partnerDetail", m);
	}

	//로그인한 유저의 멤버넘버로 해당 파트너 팔로우 유무체크
	public int followCheck(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("myPageMapper.followCheck", m);
	}

	public int followerCount(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("myPageMapper.followerCount", m);
	}
	
	

}
