package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
// Model구분자 => 유일하게 Controller와 연결되는 부분
/*
 *   MVC 
 *    => 브라우저에서 사용자 요청 : URL (주소창)
 *    => Controller가 요청값을 받는다 
 *    => Model에 등록된 메소드를 찾아서 요청 수행 완료 
 *                    -----------
 *                    자동 호출 : 어노테이션을 이용 
 *                              @RequestMapping => invoke()
 *                                                 --------
 *                                                 매개변수 : request/response
 *    => 완료된 내용(출력)을 JSP로 전송 
 *    --------------- 구조 : SpringFramework / Spring-Boot 
 *                              |                  |
 *                              --------------------
 *                              @RequestMapping 
 *                                 |- @GetMapping
 *                                 |- @PostMapping
 *                              @Autowired / @Before @After 
 *                              @Component / @Repository / @Service
 *                              
 */
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class FoodModel {
   @RequestMapping("food/list.do")
   public String food_list(HttpServletRequest request,HttpServletResponse response)
   {
	   // 비지니스로직 
	   // Model : Model / VO / DAO / Service => 모델 (자바 클래스)
	   /*
	    *    View 단 : JSP ==> 퍼블리셔 
	    *    로직 단 : Model (자바) => Back 
	    *    디비 단 : XML ==> DBA
	    *    ----------------------------
	    */
	   //1. 사용자 요청 
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   //2. 현재페이지 저장 
	   int curpage=Integer.parseInt(page);
	   //3. 출력할 데이터 목록 
	   List<FoodVO> list=FoodDAO.foodListData((curpage*12)-12);
	   //4. 총페이지 
	   int totalpage=FoodDAO.foodTotalPage();
	   //5. 블록별 
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   // 1 11 21 31...
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   // 10 20 30 40....
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   // 데이터 전송 
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   return "../food/list.jsp";
   }
   @RequestMapping("food/list_ajax.do")
   public void foodListData_ajax(HttpServletRequest request,HttpServletResponse response)
   {
	 //1. 사용자 요청 
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   //2. 현재페이지 저장 
	   int curpage=Integer.parseInt(page);
	   //3. 출력할 데이터 목록 
	   List<FoodVO> list=FoodDAO.foodListData((curpage*12)-12);
	   //4. 총페이지 
	   int totalpage=FoodDAO.foodTotalPage();
	   //5. 블록별 
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   // 1 11 21 31...
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   // 10 20 30 40....
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   JSONArray arr=new JSONArray(); // List => 자바스크립트에서 인식 []
	   int i=0;
	   for(FoodVO vo:list)
	   {
		   // vo와 일치 => JSONObject {} => RestFul [{},{},{}...]
		   JSONObject obj=new JSONObject();
		   obj.put("no", vo.getNo());
		   obj.put("poster", vo.getPoster());
		   obj.put("name", vo.getName());
		   if(i==0)
		   {
			   obj.put("curpage", curpage);
			   obj.put("totalpage", totalpage);
			   obj.put("startPage", startPage);
			   obj.put("endPage", endPage);
		   }
		   arr.add(obj);
		   i++;
		   
	   }
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter(); // 브라우저 찾기
		   out.write(arr.toJSONString());
	   }catch(Exception ex) {}
	   
   }
   @RequestMapping("food/detail.do")
   // "food/detail.do"이 중복되면 실행 안된다 
   public String foodDetailData(HttpServletRequest request,HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   String[] address=vo.getAddress().split(" ");
	   request.setAttribute("addr", address[2]);
	   System.out.println(address[2]);
	   return "../food/detail.jsp";
   }
}
