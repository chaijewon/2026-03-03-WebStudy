package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *    승인 : 관리자 
 *    ----------- 승인 버튼 => 알림 (stormp) 
 *                               | 자바스크립트 라이브러리 (Socket)
 *                               | => 없는 경우 (DB=>로그인 처리)
 *    => CRUD : 데이터베이스 연동 
 *              => Cookie / Session 
 *              => MVC 이해
 *              => MyBatis 사용법 
 *              => Web 흐름 
 *              => Ajax사용법 / Jquery 
 *              ---------------------- JSP(JSTL/EL)
 *    
 */
import java.util.*;
import java.text.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class ReserveModel {
   @RequestMapping("reserve/diary.do")
   public String reserve_diary(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   Date date=new Date();
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	   // 08 => 8 
	   // MM 01 02...10 11 12
	   // M  1 2 3 4 10 11 12
	   String strYear=request.getParameter("year");
	   String strMonth=request.getParameter("month");
	   
	   String today=sdf.format(date);
	   StringTokenizer st=new StringTokenizer(today,"-");
	   String sYear=st.nextToken();
	   String sMonth=st.nextToken();
	   String sDay=st.nextToken();
	   
	   if(strYear==null)
		   strYear=sYear;
	   if(strMonth==null)
		   strMonth=sMonth;
	   
	   int year=Integer.parseInt(strYear);
	   int month=Integer.parseInt(strMonth);
	   int day=Integer.parseInt(sDay);
	   
	   Calendar cal=Calendar.getInstance();
	   cal.set(Calendar.YEAR, year);
	   cal.set(Calendar.MONTH, month-1); // month 0
	   cal.set(Calendar.DATE, 1);
	   
	   int week=cal.get(Calendar.DAY_OF_WEEK);
	   week=week-1; // week 1
	   
	   int lastday=cal.getActualMaximum(cal.DATE);
	   
	   // 데이터를 전송 
	   request.setAttribute("year", year);
	   request.setAttribute("month", month);
	   request.setAttribute("today", day);
	   request.setAttribute("week", week);
	   request.setAttribute("lastday", lastday);
	   String[] strWeek={"일","월","화","수","목","금","토"};
	   request.setAttribute("strWeek", strWeek);
	   return "../reserve/diary.jsp";
   }
   @RequestMapping("reserve/reserve_food.do")
   public String reserve_food(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String type=request.getParameter("type");
	   List<FoodVO> list=
			        FoodDAO.foodCategoryData(type);
	   request.setAttribute("list", list);
	   return "../reserve/reserve_food.jsp";
   }
   @RequestMapping("reserve/reserve_time.do")
   public String reserve_time(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String time=reserveTime();
	   request.setAttribute("time", time);
	   return "../reserve/reserve_time.jsp";
   }
   public String reserveTime()
   {
	   String time="";
	   String[] times={"10:00","11:00","12:00","12:30","13:00","13:30"
			          ,"14:00","15:00","16:00","17:00","18:00",
			          "18:30","19:00","19:30","20:00","21:00","22:00"};
	   int[] com=new int[(int)(Math.random()*7)+3];
	   int su=0;
	   boolean bCheck=false;
	   for(int i=0;i<com.length;i++)
	   {
		   bCheck=true;
		   while(bCheck) // 중복 체크 
		   {
			   su=(int)(Math.random()*times.length);
			   bCheck=false;
			   for(int j=0;j<i;j++) // 중복체크 
			   {
				   if(com[j]==su)
				   {
					   bCheck=true; // while으로 이동 
					   break;
				   }
			   }
		   }
		   com[i]=su;
	   }
	   Arrays.sort(com);
	   for(int i=0;i<com.length;i++)
	   {
		   time+=times[com[i]]+",";
	   }
	   time=time.substring(0,time.lastIndexOf(","));
	   System.out.println(time);
	   return time;
   }
	/*
	 * public static void main(String[] args) { reserveTime(); }
	 */
}








