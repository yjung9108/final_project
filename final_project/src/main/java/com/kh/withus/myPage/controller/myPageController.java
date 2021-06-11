package com.kh.withus.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPageController {

	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage/main/myPageMain";
	}

	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "myPage/info/myInfoMain";
	}
	
	@RequestMapping("infoDetail.me")
	public String infoDetail() {
		return "myPage/info/myInfoDetail";
	}
	
	
	
}
