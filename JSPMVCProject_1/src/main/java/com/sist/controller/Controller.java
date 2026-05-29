package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;

import com.sist.model.DetailModel;
import com.sist.model.ListModel;
/*
 *   서블릿 동작 방식 
 *      init() : 환경 설정 => web.xml
 *        |
 *     service() : 
 *        | --------- doGet() : GET , doPost() :POST
 *                                    | <form> , ajax , vue,react
 *                                                     -----------
 *                                                     axios / fetch => header에 첨부
 *                                                     axios.get() , axios.post()
 *                    | sendRedirect()
 *                    | <a>
 *                    | location.href
 *              doGet + doPost = service
 *               |         |
 *               -----------
 *                 | Controller => 처리 방식이 동일 => 찾기 + 보내기 
 *     destory() : 메모리가 해제 
 *             요청 
 *     브라우저 ====== Controller === 해당 Model을 찾는다 
 *                                       |
 *                                    처리된 결과를 가지고 온다
 *                                       |
 *                                     JSP에 전송 
 *                                     --------- 공통 : session에 담는다
 *                                               JSP마다 처리 
 *                                               : request에 담아서 
 *     브라우저 : JSP => 사용자 (손님)
 *         | 주문 받기 : 요청 
 *     Controller : Servlet => 서빙 ==> 메뉴
 *         | 오더  | 응답
 *     Model : Java => 주방 
 *     
 */

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub 
		// Model클래스 메모리 할당 
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 주문을 받는다 : 요청 
		// http://localhost/JSPMVCProject_1/Controller?cmd=list
		String cmd=request.getParameter("cmd");
		if(cmd==null)
			cmd="list";
		// 2. 주문에 해당되는 Model 클래스=메소드 
		String jsp="";
		if(cmd.equals("list"))
		{
			ListModel model=new ListModel();
			model.execute(request);
			jsp="view/list.jsp";
		}
		else if(cmd.equals("detail"))
		{
			DetailModel model=new DetailModel();
			model.execute(request);
			jsp="view/detail.jsp";
		}
		// 3. 요청 처리 => Model이 가지고 있는 메소드 호출 
		// 4. JSP를 찾는다 
		// 5. request / session => 결과값을 담아서 보내준다
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
