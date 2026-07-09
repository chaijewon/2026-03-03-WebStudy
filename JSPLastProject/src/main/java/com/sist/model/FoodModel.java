package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
// => @RequestMapping() => 속도가 느려진다 => 요청시마다 메모리 할당 
// => Spring : 싱글턴 
/*
 *   자바 : 기본문법 = 변수 / 제어문 / 연산자 / 배열 
 *         OOP => 클래스 / 3대요소 / 인터페이스 / 예외처리 
 *         API => IO / Collection / 제네릭 
 *   웹 : JSP의 내장 객체 / 지시자 (page , taglib) / 내장객체 
 *                                              request/ response / session / application
 *       => MVC 
 *   데이터베이스 : DML => MyBatis / JPA 
 *   --------------------------
 *   
 *   스프링 :
 *            Framework : Container / DI / AOP / ORM 
 *            Boot : 보안 
 *            우대 : MSA
 *   DevOps : AWS / Docker / Jenkins 
 *                  |=> Docker-conpose , Docker-Hub
 *                  |=> 우대 : 쿠바네티스 
 *   Front 
 *          Jquery (Ajax) 
 *          Vue => vuex / pinia 
 *          React => redux / tanStack-query
 *          우대 : nextJS / NodeJS / TypeScript 
 *                | 표준 
 *   JSP MVC 
 *    => 한개의 Controller => 서블릿 직접 구현  => 제작되어 있음 
 *    => HttpServletRequest => JSP 값 전송  => @Controller / @RestController
 *       ------------------ Model
 *    
 */
public class FoodModel {
   @RequestMapping("food/food_main.do")
   public String food_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*12)-12;
	   List<FoodVO> list=FoodDAO.foodListData(curpage);
	   int totalpage=FoodDAO.foodTotalPage();
	   
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("startPage", startPage);
	   
	   
	   request.setAttribute("food_jsp", "../food/list.jsp");
	   request.setAttribute("main_jsp", "../food/food_main.jsp");
	   
	   // Cookie 전송 
	   List<FoodVO> cList=new ArrayList<FoodVO>();
	   Cookie[] cookies=request.getCookies();
	   if(cookies!=null)
	   {
		   // 최신순으로 읽어 온다 
		   for(int i=cookies.length-1;i>=0;i--)
		   {
			    // Cookie cookie=new Cookie("food_"+no, no);
			   if(cookies[i].getName().startsWith("food_"))
			   {
				   String no=cookies[i].getValue();
				   if(no!=null)
				   {
					   FoodVO vo=
							  FoodDAO.foodCookieData(Integer.parseInt(no));
					   cList.add(vo);
				   }
			   }
		   }
	   }
	   request.setAttribute("cList", cList);
	   return "../main/main.jsp";
   }
   @RequestMapping("food/detail.do")
   public String food_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   // 댓글 => vue / find => vue 
	   
	   request.setAttribute("food_jsp", "../food/detail.jsp");
	   request.setAttribute("main_jsp", "../food/food_main.jsp");
	   return "../main/main.jsp";
   }
   /*
    *   @RequestMapping("food/detail_before.do")
        public String food_detail_before(int no,MemberVO vo)
        {
	        
        }
    */
   
   
   @RequestMapping("food/detail_before.do")
   public String food_detail_before(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   /*
	    *    쿠키 
	    *      => 브라우저에 저장된 작은 데이터 
	    *      => String으로 저장 
	    *      => 아이디 저장 => 자동 로그인 
	    *      => 최근 본 상품 
	    *      => 즐겨찾기 
	    *      => 주요 메소드 
	    *         1. 저장 
	    *            Cookie cookie=new Cookie("키","값")
	    *         2. 기간 설정 
	    *            cookie.setMaxAge(초단위) => 0 삭제
	    *         3. 전송 
	    *            response.addCookie(cookie)
	    *         4. 값읽기
	    *            = getName() => 키 읽기
	    *            = getValue() => 실제 값 읽기 
	    *         5. 쿠키 가지고 오기
	    *            request.getCookies()
	    */
	   Cookie[] cookies=request.getCookies();
	   if(cookies!=null)
	   {
		   for(int i=0;i<cookies.length;i++)
		   {
			   if(cookies[i].getName().equals("food_"+no))
			   {
				   cookies[i].setPath("/");
				   cookies[i].setMaxAge(0);
				   response.addCookie(cookies[i]);
				   break;
			   }
		   }
	   }
	   Cookie cookie=new Cookie("food_"+no, no);
	   // Map 형식 => 키 + 값 => 키가 종복되면 저장이 안된다 
	   cookie.setMaxAge(60*60*24);
	   cookie.setPath("/");
	   response.addCookie(cookie);
	   return "redirect:../food/detail.do?no="+no;
   }
   
}
