package com.sist.model;
import java.text.SimpleDateFormat;
/*
 *    Controller : 처리된 데이터를 JSP 전송 : Servlet => 이미 생성 
 *    --------------------------------------------
 *    
 *    Model : 데이터 처리 : Java => 메소드 + 처리된 데이터를 JSP 전송
 *            요청값을 받아서 데이터베이스에서 값을 읽어 온다
 *    ------ BackEnd 
 *    View : JSP => JSTL / EL ==> 화면 출력 (데이터 처리 + 화면 UI)
 *           => Front (JavaScript)
 *    ------ FrontEnd
 *    => 분업 / 확장성 / 보안 
 *    
 *    => View단 : HTML / CSS / JavaScript(Jquery,React,Vue)
 *    ***=> DB단 : 설계 , 테이블 생성 , SQL문장 
 *    ***=> 로직단 : Model => 자바처리 
 *    => SE : CI/CD => AWS 
 */
import java.util.*;
import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class BoardModel {
    // 요청 => JSP로 출력에 필요한 데이터만 전송 
	public void boardList(HttpServletRequest request)
	{
		// 자바 => JSP로 데이터 전송 
		// 1. request 2. session (공통으로 사용되는 데이터 전송) : 데이터 유지
		//               | 개인 정보 / 장바구니 
		// 1. 사용자 요청 정보 받기 
		String page=request.getParameter("page");
		if(page==null)
			page="1"; // default page => JSP에서 소스 코딩 => JSP에서 자바 소스 최소화
		int curpage=Integer.parseInt(page);
		// 2. 요청받은 값을 이용해서 => 데이터베이스 연동
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curpage);
		int count=dao.boardRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10); // 순차적인 숫자로 출력 
		/*
		 *   count ==> 12
		 *   12  2
		 *   11  1
		 *   10
		 *   9
		 *   8
		 *   7
		 *   6
		 *   5
		 *   4
		 *   3
		 */
		// 3. 데이터베이스 가지고 온 데이터를 JSP로 전송 => Controller
		// 전송 : request.setAttribute() session.setAttribute()
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		// => 가공이 없다 => JSP는 받은 데이터만 출력만 한다 
	}
	// => 보통 : update / delete / insert
	public void boardInsert(HttpServletRequest request,
			HttpServletResponse response)
	{
		// => 화면 이동(response) => 다시 list.jsp로 이동
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsert(vo);
		// 오라클 데이터 추가 완료 
		// 화면 이동 
		try
		{
		   response.sendRedirect("list.jsp");
		}catch(Exception ex) {}
	}
}






