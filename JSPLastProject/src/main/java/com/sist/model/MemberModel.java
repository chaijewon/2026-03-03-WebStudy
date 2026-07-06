package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.dao.*;
@Controller
public class MemberModel {
   @RequestMapping("member/join.do")
   public String member_join(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // include 파일 지정 
	   request.setAttribute("main_jsp", "../member/join.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("member/login.do")
   public String member_login(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../member/login.jsp";
   }
   @RequestMapping("member/idcheck.do")
   public String member_idcheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../member/idcheck.jsp";
   }
   
   @RequestMapping("member/idcheck_ok.do")
   public void member_idcheck_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   int count=MemberDAO.memberIdCheck(id);// 0 => 사용가능 , 1=> 사용중
	   // 전송 
	   try
	   {
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   // 데이터 => 무조건 String으로 전송 
		   out.write(String.valueOf(count));
	   }catch(Exception ex) {}
	   
   }
}
