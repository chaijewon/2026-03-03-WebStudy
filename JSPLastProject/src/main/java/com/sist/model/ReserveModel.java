package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.ReserveVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 데이터 JSP로 전송  => @Controller가 있는 클래스만 => DispatcherServlet
/*
 *   ajax : 비도동기식 
 *     | 화면 변환이 없다 
 *     
 *     | => return "a.jsp"; : 화면 변경 => 변경된 데이터 전송 
 *                            => forward
 *     | => return "redirect:" : 화면만 변경 sendRedirect
 *     ------------------------------------------------ Spring
 *     | 화면변경이 없다 
 *       : void => Spring : 데이터만 전송  
 *     |
 *       @RequestMapping("") => 요청 받은 경우 
 *        => if문 대신에 사용 
 *        public void aaa(){}
 *       ---------------------
 *       
 *       @RequestMapping("")
 *       @ResponseBody
 *       public void aaa(){}
 *       -------------------------- @RestController 
 *       
 *     서버 
 *      | => Back / Front
 *      
 *     서버  =======  Front
 *                   vue / react / next
 *     | spring-boot/nodejs 
 *       
 */
@Controller  // DispatcherServlet (요청 = 응답) Controller => Servlet
public class ReserveModel {
   @RequestMapping("reserve/reserve_main.do")
   public String reserve_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("reserve/reserve_food.do")
   public String reserve_food(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String type=request.getParameter("type");
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*20)-20;
	   Map<String,Object> map=new HashMap<String,Object>();
	   map.put("type", type);
	   map.put("start",start);
	   List<FoodVO> list=ReserveDAO.reserveFoodListData(map);
	   int totalpage=ReserveDAO.reserveFoodTotalPage(type);
	   
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("type", type);
	   return "../reserve/reserve_food.jsp";
   }
   @RequestMapping("reserve/reserve_date.do")
   public String reserve_date(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   Date date=new Date();
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	   String today=sdf.format(date);
	   StringTokenizer st=new StringTokenizer(today,"-");
	   int year=Integer.parseInt(st.nextToken());
	   int month=Integer.parseInt(st.nextToken());
	   int day=Integer.parseInt(st.nextToken());
	   
	   Calendar cal=Calendar.getInstance();
	   cal.set(Calendar.YEAR, year);
	   cal.set(Calendar.MONTH, month-1);
	   cal.set(Calendar.DATE, 1);
	   
	   int week=cal.get(Calendar.DAY_OF_WEEK);
	   int lastday=cal.getActualMaximum(Calendar.DATE);
	   
	   week=week-1;
	   
	   request.setAttribute("year", year);
	   request.setAttribute("month", month);
	   request.setAttribute("day", day);
	   request.setAttribute("week", week);
	   request.setAttribute("lastday", lastday);
	   
	   String[] weeks={"일","월","화","수","목","금","토"};
	   request.setAttribute("weeks", weeks);
	   
	   return "../reserve/reserve_date.jsp";
   }
   @RequestMapping("reserve/reserve_time.do")
   public String reserve_time(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String[] times={"10:00","11:00","12:00","12:30","13:00",
			           "14:00","18:00","19:00","20:00","20:30"};
	   request.setAttribute("times", times);
	   return "../reserve/reserve_time.jsp";
   }
   
   @RequestMapping("reserve/reserve_inwon.do")
   public String reserve_inwon(HttpServletRequest request,
		   HttpServletResponse response)
   {
	  
	   return "../reserve/reserve_inwon.jsp";
   }
   
   @RequestMapping("reserve/reserve_insert.do")
   public String reserve_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   /*
	    *         <input type="hidden" name="no" id="rno">
	              <input type="hidden" name="day" id="rdays">
	              <input type="hidden" name="time" id="rtime">
	              <input type="hidden" name="inwon" id="rinwon">
	    */
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   String no=request.getParameter("no");
	   String day=request.getParameter("day");
	   String time=request.getParameter("time");
	   String inwon=request.getParameter("inwon");
	   
	   ReserveVO vo=new ReserveVO();
	   vo.setId(id);
	   vo.setName(name);
	   vo.setFno(Integer.parseInt(no));
	   vo.setRdate(day);
	   vo.setRtime(time);
	   vo.setInwon(inwon);
	   // DB로 연동 
	   ReserveDAO.reserveInsert(vo);
	   return "redirect:../mypage/mypage_reserve.do";
   }
   @RequestMapping("reserve/reserve_delete.do")
   public String reserve_delete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String rno=request.getParameter("rno");
	   ReserveDAO.reserveDelete(Integer.parseInt(rno));
	   return "redirect:../mypage/mypage_reserve.do";
   }
   
} 







