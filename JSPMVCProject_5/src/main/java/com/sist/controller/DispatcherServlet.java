package com.sist.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import com.sist.model.*;
// 우분투 => 오라클 : IP 
// => 우분투안에서만 실행 => domain : ngrook => AWS 
// => URI 주소 마지막 => .do가 있는 경우에 servlet을 호출 
// MVC는 무조건 Controller를 거쳐야 수행 
/*
 *                            DispatcherServlet
 *    브라우저 (주소창) 요청 ===== Controller ======== Model 찾기 
 *                                                |
 *                                                Model 메소드 호출 
 *                                                ------
 *                                                  DAO연동 : JDBC/DBCP => MyBatis
 *                                                |
 *                                               결과값 
 *                                                | ===> request/session
 *                                              Controller
 *                                                | ===> request/session을 전송 
 *                                              JSP 찾아서 
 *                                              결과값 전송 
 *    1) 클래스 구분 / 메소드 찾기 => 어노테이션 
 *                               | 기능은 없다 => 검색(인덱스)
 *                                 => 쉽게 찾기 
 *    2) 필요한 데이터를 등록 => XML 
 *    3) 데이터베이스 연동 => MyBatis / JPA
 *    4) MVC 동작 방법 
 *    ------------------------------ 라이브러리 : SpringBoot/SpringFramework
 *    
 *    어노테이션 : 알아보기 쉽게 만든 것 
 *              주석이 아니다 (인식 없다) 
 *              => 구분 => 마커 
 *      | 복잡한 XML / IF문을 단순화 => 소스 간결화 / 생산성 향상
 *    
 *    => 제작 
 *    1. Retention : 메모리 할당시 => 언제까지 사용되는 
 *       SOURCE / CLASS / RUNTIME 
 *       ---------------  -------- 프로그램 종료시까지 유지 
 *       컴파일시에 바로 사라진다 @Override
 *    2. Target : 어디에 붙일까? 
 *       **Type => 클래스 위에 (클래스 찾기)
 *       **Method => 메소드 위에 (메소드 찾기)
 *       Constructor => 생성자 위에 (생성자 찾기)
 *       Parameter => 매개변수 위에 (매개변수 찾기)
 *       **Filed => 멤버변수 위에 (멤버변수 찾기)
 *       -------------------------------------
 *       
 *       위에 있거나 옆에 있다 
 *       @
 *       public void disp(@어노테이션 B b)
 *       {
 *       }
 *       
 * 
 */
// => 스프링은 @WebServlet가 없다 : web.xml에 등록 
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String pack="com.sist.model";
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
