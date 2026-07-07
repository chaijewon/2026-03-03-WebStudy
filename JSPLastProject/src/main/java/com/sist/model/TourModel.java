package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class TourModel {
   
   @RequestMapping("tour/travel.do")
   public String travel(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String cti=request.getParameter("contenttypeid");
	   String ac=request.getParameter("areaCode");
	   System.out.println(cti);
	   System.out.println(ac);
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*12)-12;
	   
	   Map map=new HashMap();
	   map.put("contenttypeid", cti);
	   map.put("areacode", ac);
	   map.put("start", start);
	   
	   List<TourVO> list=TourDAO.travelListData(map);
	   int totalpage=TourDAO.travelTotalPage(map);
	   
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
	   
	   
	   
	   String loc="";
	   if(Integer.parseInt(ac)==1)
		   loc="서울";
	   else if(Integer.parseInt(ac)==6)
		   loc="부산";
	   else if(Integer.parseInt(ac)==39)
		   loc="제주";
	   
	   String title="";
	   if(Integer.parseInt(cti)==12)
		   title="관광지";
	   else if(Integer.parseInt(cti)==14)
		   title="문화시설";
	   else if(Integer.parseInt(cti)==15)
		   title="행사/공연/축제";
	   else if(Integer.parseInt(cti)==32)
		   title="숙박";
	   else if(Integer.parseInt(cti)==38)
		   title="쇼핑";
	   else if(Integer.parseInt(cti)==39)
		   title="음식점";
	   request.setAttribute("title", loc+" "+title); 
	   request.setAttribute("cti", cti); // 콘텐츠 구분 
	   request.setAttribute("ac", ac);// 지역 구분 
	   
	   request.setAttribute("main_jsp", "../tour/travel.jsp");
	   return "../main/main.jsp";
   }
   
}
