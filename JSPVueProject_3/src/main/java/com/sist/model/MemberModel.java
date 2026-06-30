package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.Commons;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.dao.*;
@Controller
public class MemberModel {
   @RequestMapping("member/login.do")
   public void member_login(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   
	   MemberVO vo=MemberDAO.isLogin(id, pwd);
	   if(vo.getMsg().equals("OK"))
	   {
		   HttpSession session=request.getSession();
		   session.setAttribute("id", vo.getId());
		   session.setAttribute("name", vo.getName());
		   session.setAttribute("isAdmin", vo.getIsadmin());
	   }
	   // NOID , NOPWD , OK
	   try
	   {
		   //ObjectMapper mapper=new ObjectMapper();
		   //String json=mapper.writeValueAsString(vo);
		   Commons.sendData(response, "text/html", vo.getMsg());
	   }catch(Exception ex){}
	   
   }
   @RequestMapping("member/logout.do")
   public void member_logout(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   session.invalidate();
   }
}
