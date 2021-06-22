package com.kh.withus.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.withus.myPage.model.service.MyPageService;
import com.kh.withus.myPage.model.vo.OptionList;

@Controller
public class TestController {

	@Autowired
	private MyPageService mService;
/*	
		@ResponseBody
		@RequestMapping(value="test.me", method = RequestMethod.POST, produces="text/html; charset=utf-8")
		public String mainfollowList(@RequestParam(value="test") int test) {
			
			
			System.out.println(test);
			String responseData = "응답문자열 : "+ test;
			
			return responseData;
			
			
		}	
	*/
	
	/*
	@RequestMapping(value="optionList.me", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, ArrayList> ajaxOptionList(HttpSession session, HttpServletResponse response, @RequestBody OptionList o) throws Exception {
		
		 
		
		System.out.println(o.getOrderNo());
		System.out.println(o.getRewardNo());
		
		
		
		//ArrayList<MyPage> list = mService.selectOptionList(m);
		ArrayList<OptionList> list = mService.selectOptionList(o);
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		map.put("list", list);
		
		System.out.println(list);
		System.out.println(map);
		
		return map;
		
		//return new Gson().toJson(list);
		
		
		
		
		
		
		
	}
	
	
	
	*/
	
	/*
	 // 오더넘버와 리워드에대한 옵션내역들 ajax로 리스트로 받아오기
	// 잘 실행되나 한글이깨짐 ㅠㅠㅠ
	@ResponseBody
	@RequestMapping(value="optionList.me", method = RequestMethod.POST)
	public String ajaxOptionList(@RequestParam(value="rewardNo") int rewardNo, @RequestParam(value="orderNo") int orderNo) {
		
		 
		
		
		System.out.println(rewardNo);
		System.out.println(orderNo);
		
		//MyPage m = new MyPage();
		//m.setRewardNo(rewardNo);
		//m.setOrderNo(orderNo);
		
		OptionList o = new OptionList();	
		o.setRewardNo(rewardNo);
		o.setOrderNo(orderNo);
		
		//ArrayList<MyPage> list = mService.selectOptionList(m);
		//ArrayList<OptionList> list = mService.selectOptionList(o);
		
		//System.out.println(list);
		//return null;
		
		
		
		
		
		return new Gson().toJson(mService.selectOptionList(o));
		
	}
	
	 * */
	
	 
	
	
}
