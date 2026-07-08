package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 *    main 
 *      -------------------------
 *                메뉴
 *      -------------------------
 *      
 *       <jsp:include page="${main_jsp}"></jsp:include>
 *      
 *      
 *      -------------------------
 *              footer
 *      -------------------------
 *      
 *      
 *    main 
 *      -------------------------
 *                메뉴
 *      -------------------------
 *           |
 *           |
 *           | <jsp:include page="${mypage_jsp}"></jsp:include>
 *           |
 *      -------------------------
 *              footer
 *      -------------------------
 *      
 */

@Controller
public class BoardModel {
   // 사용자 정의 메소드는 반드시 호출 
   @RequestMapping("board/list.do")
   // m.invoke(obj, request,response);
   public String board_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // DB연동 => 
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   // 요청처리 
	   int curpage=Integer.parseInt(page);
	   final int ROWSIZE=10;
	   int start=(ROWSIZE*curpage)-ROWSIZE;
	   List<BoardVO> list=BoardDAO.boardListData(start);
	   int count=BoardDAO.boardTotalPage();
	   // count= 13 ==> 13/10 1.3
	   int totalpage=(int)(Math.ceil(count/(double)ROWSIZE));
	   count=count-((curpage*ROWSIZE)-ROWSIZE); // 페이지 => -10
	   // 30 => 
	   // 요청 결과값을 JSP로 전송 
	   request.setAttribute("list", list);
	   request.setAttribute("count", count);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   /*
	    *    Date date=new Date();
	    *    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    *    String today=sdf.format(date)
	    *                 ---
	    *                 new SimpleDateFormat("yyyy-MM-dd").format(new Date())
	    */
	   request.setAttribute("today", 
			   new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	   
	   request.setAttribute("main_jsp", "../board/list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/insert.do")
   public String board_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../board/insert.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/insert_ok.do")
   public String board_insert_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   
	   BoardVO vo=new BoardVO();
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   
	   BoardDAO.boardInsert(vo);
	   
	   return "redirect:../board/list.do";
   }
   @RequestMapping("board/detail.do")
   public String board_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   /*
	    *   데이터를 보내주는 경우 
	    *   데이터를 안보내주는 경우 : 페이지 / 검색어 
	    */
	   // 사용자가 보낸 데이터 받기
	   String no=request.getParameter("no");
	   // 데이터베이스 연동 
	   BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
	   // 결과값(출력할 데이터) 전송
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../board/detail.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/delete.do")
   public void board_delete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	    String no=request.getParameter("no");
	    String pwd=request.getParameter("pwd");
	    
	    // DB연동 
	    String res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
	    try
	    {
	    	response.setContentType("text/html;charset=UTF-8");
	    	PrintWriter out=response.getWriter();
	    	out.write(res);
	    }catch(Exception ex) {}
	    // yes/no 전송 
   }
   @RequestMapping("board/update.do")
   public String board_update(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../board/update.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("board/update_ok.do")
   public void board_update_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	    String no=request.getParameter("no");
	    String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		   
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
	    vo.setNo(Integer.parseInt(no));
	    // DB연동 
	    /*
	     *   res => yes/no
	     *          | => redirect:../board/detail.do
	     *          | no => history.back()   
	     */
	    String res=BoardDAO.boardUpdate(vo);
	    try
	    {
	    	response.setContentType("text/html;charset=UTF-8");
	    	PrintWriter out=response.getWriter();
	    	out.write(res);
	    }catch(Exception ex) {}
	    // yes/no 전송 
   }
}
