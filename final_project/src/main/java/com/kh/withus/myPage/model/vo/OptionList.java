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
public class OptionList {

	private int orderNo; // 주문번호
	private int rewardNo; //리워드번호
	private int optionNo; // 옵션번호
	private String optionContent; // 옵션내용
	
	
}
