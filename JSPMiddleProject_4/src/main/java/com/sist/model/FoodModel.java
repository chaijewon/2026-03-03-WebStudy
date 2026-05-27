package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
public class FoodModel {
   public void foodList(HttpServletRequest request)
   {
	 //1 사용자 요청한 데이터를 받는다 
	    String strPage=request.getParameter("page");
	    if(strPage==null)
	    	strPage="1";
	    int curpage=Integer.parseInt(strPage);
	    //2.받은 데이터를 DAO메소드 => 매개변수의 첨부 
	    FoodDAO dao=new FoodDAO(); // 메모리 누수 방지 => static (싱글턴)
	    //3.데이터 읽기 : 화면에 출력 
	    List<FoodVO> list=dao.foodListData(curpage);
	    int totalpage=dao.foodTotalPage();
	    //MV / MVC => 자바의 메소드
	    // 블록별 
	    final int BLOCK=10;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1 11 21 ....
	    /*
	        startPage 1 => curpage (1~10)
	                  2 => curpage (11~20)
	    */
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	    if(endPage>totalpage)
	    	endPage=totalpage;
	    
	    /// 출력에 필요한 데이터를 request에 담아서 jsp로 보낸다 
	    /// request가 매개변수 => jsp가 가지고 있는 request에 값을 첨부해서 보내줄 수 있다
	    /// Call  By Reference : 주소를 넘겨주기 주소에 값을 채우는 방법 
	    /// class / 배열 (String : Call By Value)
	    request.setAttribute("list", list);
	    // request.getAttribute() => ${list}
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
   }
}
