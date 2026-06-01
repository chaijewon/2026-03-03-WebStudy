package com.sist.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
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
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 초기화 => 메뉴를 저장 
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
    // 요청시에 요청을 받고 = 해당 모델 찾기 => 처리 결과값을 JSP전송 
	// 요청 처리 => Model
	// doGet(): GET / doPost() : POST => service(GET/POST) 통합해서 처리 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
