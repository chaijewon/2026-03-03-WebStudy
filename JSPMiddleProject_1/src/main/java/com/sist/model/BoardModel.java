package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import jakarta.servlet.http.*;
public class BoardModel {
   public void boardListData(HttpServletRequest request)
   {
	   // 1. 사용자 요청 정보 => page 
	   String strPage=request.getParameter("page");
	   if(strPage==null)
		   strPage="1";
	   // 현재 페이지 
	   int curpage=Integer.parseInt(strPage);
	   // 데이터베이스 연동 
	   BoardDAO dao=BoardDAO.newInstance();
	   List<BoardVO> list=dao.boardListData(curpage);
	   int totalpage=dao.boardTotalPage();
	   // JSP로 출력에 필요한 데이터를 전송
	   request.setAttribute("list", list);// ${}
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
   }
}
