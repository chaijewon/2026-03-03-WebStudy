package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainModel {
   @RequestMapping("main/main.do")
   public String main_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // include되는 파일명 지정 
	   request.setAttribute("main_jsp", "../food/list.jsp");
	   // 이동은 main으로 
	   return "../main/main.jsp";
   }
   @RequestMapping("member/login.do")
   public void member_login(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   MemberVO vo=MemberDAO.memberLogin(id, pwd);
	   if(vo.equals("OK"))
	   {
		   // 정상 수행 = 로그인된 상태 
		   HttpSession session=request.getSession();
		   session.setAttribute("id", vo.getId());
		   session.setAttribute("name", vo.getName());
	   }
	   // JSP로 전송 
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.println(vo.getMsg());
	   }catch(Exception ex) {}
   }
   @RequestMapping("member/logout.do")
   public void member_logout(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   session.invalidate(); // 모든 메모리 해제 
	   //  request만 존재 => session/cookie 
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.println("yes");
	   }catch(Exception ex) {}
   }
}
