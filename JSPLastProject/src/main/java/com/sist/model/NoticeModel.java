package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.NoticeDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.NoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class NoticeModel {
   @RequestMapping("adminpage/insert.do")
   public String admin_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("admin_jsp", "../notice/insert.jsp");
	   return "../adminpage/admin_main.jsp";
   }
   @RequestMapping("adminpage/admin_list.do")
   public String admin_list(HttpServletRequest request,
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
	   List<NoticeVO> list=NoticeDAO.noticeListData(start);
	   int totalpage=NoticeDAO.noticeTotalPage();
	   
	   // 요청 결과값을 JSP로 전송 
	   request.setAttribute("nList", list);
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
	   request.setAttribute("admin_jsp", "../notice/admin_list.jsp");
	   return "../adminpage/admin_main.jsp";
   }
   @RequestMapping("notice/insert_ok.do")
   public String admin_insert_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String type=request.getParameter("type");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   NoticeVO vo=new NoticeVO();
	   vo.setContent(content);
	   vo.setSubject(subject);
	   vo.setType(Integer.parseInt(type));
	   // DB 연동 
	   int a=NoticeDAO.noticeInsert(vo);
	   if(a==0)
	   {
		   
	   }
	   else
	   {
		   
	   }
	   return "redirect:../adminpage/admin_list.do";
   }
   @RequestMapping("notice/user_list.do")
   public String user_list(HttpServletRequest request,
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
	   List<NoticeVO> list=NoticeDAO.noticeListData(start);
	   int totalpage=NoticeDAO.noticeTotalPage();
	   
	   // 요청 결과값을 JSP로 전송 
	   request.setAttribute("nList", list);
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
	   request.setAttribute("main_jsp", "../notice/user_list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("notice/delete.do")
   public String notice_delete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   NoticeDAO.noticeDelete(Integer.parseInt(no));
	   return "redirect:../adminpage/admin_list.do";
   }
   @RequestMapping("notice/update.do")
   public String notice_update(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   NoticeVO vo=NoticeDAO.noticeUpdateData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("admin_jsp", "../notice/update.jsp");
	   return "../adminpage/admin_main.jsp";
   }
}
