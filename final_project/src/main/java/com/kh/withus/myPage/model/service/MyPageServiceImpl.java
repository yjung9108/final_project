package com.kh.withus.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.myPage.model.dao.MyPageDao;
import com.kh.withus.myPage.model.vo.MyPage;
import com.kh.withus.myPage.model.vo.OptionList;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao mDao;
	
	
	//임시 로그인
	@Override
	public MyPage loginMember(MyPage m) {
		
		//Member loginUser = mDao.loginMember(sqlSession, m);
		//return loginUser;
		return mDao.loginMember(sqlSession, m);
	}

	
	
	
	
	@Override
	public int pwdConfirm(MyPage m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(MyPage m) {
		
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
	public ArrayList<MyPage> selectFollowList(PageInfo pi, int memberNo) {
		return mDao.selectFollowList(sqlSession, pi, memberNo);
	}

	@Override
	public int unfollowMember(MyPage m) {
		
		return mDao.unfollowMember(sqlSession, m);
	}

	@Override
	public int followMember(MyPage m) {
		return mDao.followMember(sqlSession, m);
	}

	@Override
	public MyPage partnerDetail(MyPage m) {
		
		return mDao.partnerDetail(sqlSession, m);
	}

	
	@Override
	public int followCheck(MyPage m) {
		
		return mDao.followCheck(sqlSession, m);
	}

	@Override
	public int followerCount(MyPage m) {
		
		return mDao.followerCount(sqlSession, m);
	}

	@Override
	public int fundingCount(MyPage m) {
		return mDao.fundingCount(sqlSession, m);
	}
	
	@Override
	public ArrayList<MyPage> fundingList(PageInfo pi, MyPage m) {
		return mDao.fundingList(sqlSession, pi, m);
	}

	// 좋아요 리스트
	@Override
	public int likeListCount(int memberNo) {
		
		return mDao.likeListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<MyPage> likeList(PageInfo pi, int memberNo) {
		
		return mDao.likeList(sqlSession, pi, memberNo);
	}

	// 나의 문의내역 리스트
	@Override
	public int myQueryListCount(int memberNo) {
		return mDao.myQueryListCount(sqlSession, memberNo);
	}


	@Override
	public ArrayList<MyPage> myQueryList(PageInfo pi, int memberNo) {
		return mDao.myQueryList(sqlSession, pi, memberNo);
	}




	// 나의 펀딩리스트
	@Override
	public int myFundingListCount(int memberNo) {
		return mDao.myFundingListCount(sqlSession, memberNo);
	}


	@Override
	public ArrayList<MyPage> myFundingList(PageInfo pi, int memberNo) {
		return mDao.myFundingList(sqlSession, pi, memberNo);
	}




	// 나의 주문내역
	@Override
	public ArrayList<MyPage> myFundingDetail(MyPage m) {
		return mDao.myFundingDetail(sqlSession, m);
	}





	@Override
	public int updateOrder(MyPage m) {
		return mDao.updateOrder(sqlSession, m);
	}



	/*

	@Override
	public ArrayList<MyPage> selectOptionList(MyPage m) {
		return mDao.selectOptionList(sqlSession, m);
	}
	 */
	public ArrayList<OptionList> selectOptionList(OptionList o) {
		return mDao.selectOptionList(sqlSession, o);
	}



	@Override
	public int refundRequest(MyPage m) {
		return mDao.refundRequest(sqlSession, m);
	}





	@Override
	public int orderStatusUpdate(int orderNo) {
		return mDao.orderStatusUpdate(sqlSession, orderNo);
	}





	




	@Override
	public ArrayList<MyPage> mainLikeList(int memberNo) {
		return mDao.mainLikeList(sqlSession, memberNo);
	}





	@Override
	public ArrayList<MyPage> mainQueryList(int memberNo) {
		return mDao.mainQueryList(sqlSession, memberNo);
	}



	@Override
	public ArrayList<MyPage> mainFollowList(int memberNo) {
		return mDao.mainFollowList(sqlSession, memberNo);
	}


















	

	

	

}
