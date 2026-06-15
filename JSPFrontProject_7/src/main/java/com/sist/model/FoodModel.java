package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.ReplyVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
   // response가 동시에 두가지 일을 수행할 수 없다 
   // cookie응답 / html응답 
   @RequestMapping("food/detail_before.do")
   public String food_detail_before(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   Cookie cookie=new Cookie("food_"+no, no);
	   cookie.setMaxAge(60*60*24);
	   cookie.setPath("/");
	   response.addCookie(cookie);
	   return "redirect:../food/detail.do?no="+no; // request초기화 
	   // sendRedierct()
   }
   /*
    *   Cookie => 브라우저에 저장 (보안이 취약) / Session => 서버에 저장 (보안)
    *     => 단점이 문자열만 저장이 가능          => Object 단위로 저장 
    *     => 자동 로그인 / 장바구니 / 최근 방문   => 접속자 일부 정보를 저장시에 
    *    ----------------------------------------------------------
    *      request를 이용해서 생성이 가능 
    *      Cookie[] cookies=request.getCookies()
    *      HttpSession session=request.getSession()
    */
   @RequestMapping("food/detail.do")
   
   //public String food_detail(ReplyVO vo)
   public String food_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   
	   String no=request.getParameter("no");
	   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../food/detail.jsp");
	   
	   List<ReplyVO> list=ReplyDAO.replyListData(Integer.parseInt(no));
	   request.setAttribute("rList", list);
	   request.setAttribute("rcount", list.size());
	   return "../main/main.jsp"; // forward => request를 유지 
   }
}
