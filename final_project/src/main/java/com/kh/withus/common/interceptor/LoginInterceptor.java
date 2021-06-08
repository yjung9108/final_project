package com.kh.withus.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 해당 이 클래스를 Interceptor역할을 수행하도록하고자 한다면 HandelerInterceptorAdapater 클래스 상속받도록
 * 
 * preHandle(전처리) : DispatcherServlet에서 해당 요청을 받아주는 컨트롤러 호출하기전에 낚아채는 영역
 * postHandle(후처리) : 컨트롤러가 다 실행되고 DispatcherServlet으로 뷰 정보가 리턴되는 순간 낚아채는 영역
 */

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		// boolean값 리턴
		// 이때 true가 리턴되면 기존의 요청 흐름대로 해당 Controller를 제대로 실행함
		//      false가 리턴되면 해당 Controller 실행 안됨
		// Interceptor가 사용되는 경우 : 로그인한 회원인지 아닌지 체크, 로그인한 회원의 권한 체크
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) { // 로그인 전(비회원)
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}else { // 로그인 후 (회원)
			
		
			return true;
		}
		
		/*
		 * Interceptor 클래스를 만들어서 작성만했다고 끝 아님
		 * 어떤 요청을 가로챌건지 설정하면서 Interceptor클래스 빈으로 등록해야됨(servlet-context.xml에서 등록)
		 */
		
		
	}
	
	
	

}
