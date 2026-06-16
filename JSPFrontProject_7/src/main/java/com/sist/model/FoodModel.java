package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
   /*
    *    Vue(thymeleaf) / Jquery(jsp) ==> CDN 
    *    => 필요한 부분에서만 사용 / 보안 (소스 노출)
    *    
    *    react (단독) === Spring-Boot + NodeJS
    */
   /*
    *     <select id="foodFindData" resultType="FoodVO" parameterType="hashmap">
		    SELECT no,name,poster,address
		    FROM food
		    WHERE ${column} LIKE '%'||#{fd}||'%'
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY 
		  </select>
    */
   // 화면 변경 
   @RequestMapping("food/find.do")
   public String food_find(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../food/find.jsp");
	   return "../main/main.jsp";
   }
   // 변경된 화면에서 작업 
   @RequestMapping("food/find_ajax.do")
   public void food_find_ajax(HttpServletRequest request,
		   HttpServletResponse response)
   {
       String fd=request.getParameter("fd"); // <input type=text name=fd>
       if(fd==null)
    	   fd="마포";
       String col=request.getParameter("col"); // <select> name/address/type
       if(col==null)
    	   col="address";
       String page=request.getParameter("page");
       if(page==null)
    	   page="1";
       
       System.out.println("page:"+page);
       System.out.println("col:"+col);
       System.out.println("fd:"+fd);
       int curpage=Integer.parseInt(page);
       Map map=new HashMap();
       map.put("fd",fd);
       map.put("column", col);
       map.put("start",(curpage*12)-12);
       List<FoodVO> list=FoodDAO.foodFindData(map);
       int totalpage=FoodDAO.foodFindTotalPage(map);
       
       final int BLOCK=10;
       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
       
       if(endPage>totalpage)
    	   endPage=totalpage;
       // JSON으로 변경후 전송 
       try
       {
    	   // List => JSONArray 
    	   JSONArray arr=new JSONArray(); // [{},{},{}...]
    	   // VO   => JSONObject 
    	   int j=0;
    	   for(FoodVO vo:list)
    	   {
    		   JSONObject obj=new JSONObject();
    		   obj.put("no", vo.getNo());
    		   obj.put("name", vo.getName());
    		   obj.put("poster", vo.getPoster());
    		   obj.put("address", vo.getAddress());
    		   if(j==0)
    		   {
    			   obj.put("curpage", curpage);
    			   obj.put("totalpage", totalpage);
    			   obj.put("startPage", startPage);
    			   obj.put("endPage", endPage);
    		   }
    		   
    		   arr.add(obj);
    		   j++;
    	   }
    	   
    	   // arr에 있는 데이터를 => Ajax(Javascript) => Restful
    	   response.setContentType("text/plain;charset=UTF-8");
    	   PrintWriter out=response.getWriter();
    	   out.write(arr.toJSONString());
       }catch(Exception ex) {}
   }
   @RequestMapping("food/movie.do")
   public String food_movie(HttpServletRequest request,
		     HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../food/movie.jsp");
	   return "../main/main.jsp";
   }
}





