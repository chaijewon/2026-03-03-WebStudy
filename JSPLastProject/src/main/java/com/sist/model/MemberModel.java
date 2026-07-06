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
   @RequestMapping("member/join_ok.do")
   public String member_join_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   String name=request.getParameter("name");
	   String sex=request.getParameter("sex");
	   String birthday=request.getParameter("birthday");
	   String email=request.getParameter("email");
	   String post=request.getParameter("post");
	   String addr1=request.getParameter("addr1");
	   String addr2=request.getParameter("addr2");
	   String phone1=request.getParameter("phone1");
	   String phone2=request.getParameter("phone2");
	   String content=request.getParameter("content");
	   
	   MemberVO vo=new MemberVO();
	   vo.setId(id);
	   vo.setPwd(pwd);
	   vo.setName(name);
	   vo.setSex(sex);
	   vo.setBirthday(birthday);
	   vo.setEmail(email);
	   vo.setPost(post);
	   vo.setAddr1(addr1);
	   vo.setAddr2(addr2);
	   vo.setContent(content);
	   vo.setPhone(phone1+"-"+phone2);
	   
	   MemberDAO.memberInsert(vo);
	   
	   return "redirect:../main/main.do";
   }
}
