package com.sist.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainModel {
   @RequestMapping("main/main.do")
   public String main_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   List<FoodVO> list=FoodDAO.foodListData((curpage*12)-12);
	   int totalpage=FoodDAO.foodTotalPage();
	   
	   // 블록별 페이지 
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1 11 21 
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;// 10 20 30...
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   // 출력에 필요한 데이터를 보낸다 => food/list.jsp 
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   // include되는 파일명 지정 
	   request.setAttribute("main_jsp", "../food/list.jsp");
	   // 이동은 main으로 
	   
	   // Cookie읽기
	   Cookie[] cookies=request.getCookies();
	   List<FoodVO> cList=new ArrayList<FoodVO>();
	   int j=0;
	   if(cookies!=null)
	   {
		   for(int i=cookies.length-1;i>=0;i--)
		   {
			  if(cookies[i].getName().startsWith("food_"))
			  {
			     if(j>=9) break;
			     // getName() => key읽기 
			     String no=cookies[i].getValue();
			     FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
			     cList.add(vo);
			     j++;
			  }
		   }
	   }
	   request.setAttribute("cList", cList);
	   request.setAttribute("size", cList.size());
	   return "../main/main.jsp";
   }
   @RequestMapping("member/login.do")
   public void member_login(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   System.out.println("id:"+id);
	   System.out.println("pwd:"+pwd);
	   MemberVO vo=MemberDAO.memberLogin(id, pwd);
	   System.out.println("result:"+vo.getMsg());
	   if(vo.getMsg().equals("OK"))
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
