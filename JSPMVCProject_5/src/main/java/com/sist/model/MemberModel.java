package com.sist.model;

import com.sist.controller.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberModel {
  // 1. 로그인 (회원가입 / 회원수정 / 회원탈퇴 , 비번 변경 / 우편번호 , 중복체크..)
	   @RequestMapping("member/login.do")
	   public String food_list(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String msg="로그인 처리";
		   request.setAttribute("msg", msg);
		   request.setAttribute("main_jsp", "../member/login.jsp");
		   return "../main/main.jsp";
	   }
}
