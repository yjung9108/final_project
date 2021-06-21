package com.kh.withus.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	
	//팔로잉 목록 마이페이지메인
		@ResponseBody
		@RequestMapping(value="test.me", method = RequestMethod.POST, produces="text/html; charset=utf-8")
		public String mainfollowList(@RequestParam(value="test") int test) {
			
			
			System.out.println(test);
			String responseData = "응답문자열 : "+ test;
			
			return responseData;
			
			
		}	
	
	
	
	
}
