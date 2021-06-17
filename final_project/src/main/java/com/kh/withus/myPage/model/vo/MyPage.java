package com.kh.withus.myPage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MyPage {

	
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private Date memberCreateDt;
	private String memberLink;
	private int reportCount;
	private String memberStatus;
	private String memberProfile;
	private String partnerJoin;
	private String partnerName;
	private String partnerIntro;
	private int followMemberNo;

	
	// 좋아요목록 불러올 프로젝트정보
	private int projectNo;
	private String projectTitle;
	private Date projectStartDt;
	private Date projectEndDt;
	private String projectThum; // 프로젝트썸네일
	private String projectStatus; // 1. 수락요청 2.블라인드 3.게시중 4.반려 5.임시저장
	private int projectGPrice; // 목표금액
	
	// 나의문의
	private int otoNo;
	private String otoCat; // 카테고리
	private String otoTitle;
	private String otoContent;
	private Date otoDate; // 작성일
	private String otoReply; //답변
	private String otoReReply; //답변유무 N/Y
	
	
	

}
