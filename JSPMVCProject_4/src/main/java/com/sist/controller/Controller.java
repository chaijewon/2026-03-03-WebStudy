package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import com.sist.model.*;
/*
 *   _jspService (GET / POST)
 */
/*
 *    결과값 출력 (요청) === 요청 받기 / Model 찾기 === 결과값 전송 ==== 요청처리 
 *    --------------          Controller                       비지니스로직(데이터 처리)
 *    JSP => View                                                Model
 *                                                             1) VO 
 *                                                             2) DAO
 *                                                             3) 통합 => request값 담기 
 *                                                                Model 
 *                                                             4) Open API / WebSocket 
 *        | JSP + Jquery => Jquery 3 : Jquery 4
 *        | React 
 *        | Vue => 배포 (CI/CD) => SpringFramework (나눠서 작업)
 *          => SpringBoot CDN방식이용 
 */

@WebServlet("*.do")
// 고정이 안되면 => 사이트는 동작할 수 없다
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] cls={
		"com.sist.model.ListModel"
	};
	private String[] keys= {
		"databoard/list.do"	
	};
	private Map<String,Model> clsMap=
			  new HashMap<String,Model>();
	// if없이 찾기가 가능 
	// <bean id="databoard/list.do" class="com.sist.model.ListModel">
    // 초기화 => 메뉴를 저장 
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			for(int i=0;i<cls.length;i++)
			{
				Class clsName=Class.forName(cls[i]);
				// 클래스 메모리 할당 
				Model model=(Model)clsName.getDeclaredConstructor().newInstance();
				clsMap.put(keys[i], model);
				// 리플렉션 : 클래스명으로 메모리 할당 / 멤버변수 설정 / 생성자 호출 / 메소드 호출
			}
		}catch(Exception ex) {}
	}
    // 요청시에 요청을 받고 = 해당 모델 찾기 => 처리 결과값을 JSP전송 
	// 요청 처리 => Model
	// doGet(): GET / doPost() : POST => service(GET/POST) 통합해서 처리 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			// 1. 요청 받기 
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
			System.out.println(uri);
			System.out.println(key);
			/*
			 *   databoard/list.do
			 */
			// 2. 해당 Model 찾기 
			Model model=clsMap.get(key);
			// 3. 메소드 호출 => JSP받는다 
			String jsp=model.requestHandler(request, response);
			// 4. JSP => request 전송 
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}catch(Exception ex) {}
	}

}
