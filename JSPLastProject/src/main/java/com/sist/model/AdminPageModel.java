package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminPageModel {
  @RequestMapping("adminpage/admin_main.do")
  public String admin_main(HttpServletRequest request,
		   HttpServletResponse response)
  {
	  request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
	  return "../adminpage/admin_main.jsp";
  }
  @RequestMapping("adminpage/member_list.do")
  /*
   *   JSP / ThyemeLeaf <div th:include="">
   *    => request를 공유 
   *       1) forward 
   *       2) include <jsp:include> 
   */
  public String admin_member(HttpServletRequest request,
		   HttpServletResponse response)
  {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   // 요청처리 
	   int curpage=Integer.parseInt(page);
	   final int ROWSIZE=10;
	   int start=(ROWSIZE*curpage)-ROWSIZE;
	   List<MemberVO> list=AdminDAO.memberListData(start);
	   int totalpage=AdminDAO.memberTotalPage();
	   
	   // 30 => 
	   // 요청 결과값을 JSP로 전송 
	   request.setAttribute("mList", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	  request.setAttribute("admin_jsp", "../adminpage/member_list.jsp");
	  return "../adminpage/admin_main.jsp";
  }
  @RequestMapping("adminpage/member_update.do")
  public void member_update(HttpServletRequest request,
		   HttpServletResponse response)
  {
	  String id=request.getParameter("id");
	  String type=request.getParameter("type");
	  
	  MemberVO vo=new MemberVO();
	  vo.setId(id);
	  vo.setGrade(Integer.parseInt(type));
	  
	  int count=AdminDAO.memberGradeChange(vo);
	  
	  try
	  {
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(String.valueOf(count));
	  }catch(Exception ex) {}
	  
  }
  
}







