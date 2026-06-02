package com.sist.model;

import java.util.List;

import com.sist.controller.*;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 메소드 => 어떻게 찾을까? 
// if => 대체 
/*
 *   클래스 검색 => Map (if을 제거)
 *   메소드 => (if 제거) => 구분자 찾기 => Annotation 
 *   => 리플렉션 => 메소드명과 관련이없이 자동 검색이 가능 => Spring 
 *   => Controller : 이미 업체마다 제작되어 있다 
 *      | Spring에서 제공하는 Controller 
 *             => 공기업 / 금융권 
 *      | 포털 : 자체에서 Controller 제작 
 *      
 *   MVC 구조 파악 
 *   ----------- Model(DAO,VO) => View(JSP,JavaScript)
 *                     --- MyBatis이해 
 *   
 */
@Controller
public class FoodModel {
   // 1. 목록
   @RequestMapping("main/main.do")
   public String food_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // 사용자 보낸 데이터 받기 => page
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   // 현재 페이지 지정 
	   int curpage=Integer.parseInt(page);
	   // 해당 페이지의 목록 가지고 오기 
	   int start=(curpage*12)-12;
	   List<FoodVO> list=FoodDAO.foodListData(start);
	   int totalpage=FoodDAO.foodTotalPage();
	   
	   // 브라우저(JSP)에서 출력할 데이터 전송 
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
	   
	   // include하는 JSP 확인 
	   request.setAttribute("main_jsp", "../food/list.jsp");
	   // 실제 화면 출력 
	   return "../main/main.jsp";
   }
   // 2. 상세보기 
   @RequestMapping("food/detail.do")
   public String food_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String msg="맛집 상세 보기";
	   // 데이터베이스 연동 
	   request.setAttribute("msg", msg); // 출력할 데이터 전송 
	   // include하는 JSP 확인 
	   request.setAttribute("main_jsp", "../food/detail.jsp");
	   // 실제 화면 출력 
	   return "../main/main.jsp";
   }
   // 기타 : 좋아요 / 찜하기 / 예약하기 / 추천 / 근처 맛집 / 길찾기 / 검색 ...
}
