package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
// 데이터 관리 
// 데이터 관리 => JSP안에서 처리 => 유지보수/확장성/분업 => 자바로 변경
// Model => DAO , VO포함 
// 일반 JSP ====> MV (분리) : 메소드 ====> MVC 
// MVC ==> Spring형식 
public class MusicModel {
   public void musicList(HttpServletRequest request)
   {
	    //1. 사용자 요청 정보 받기 => page
	    String strPage=request.getParameter("page");
	    //page를 선택 못하는 경우 => 화면 실행시 
	    if(strPage==null)
	    	strPage="1";
	    // 현재 페이지 지정 
	    int curpage=Integer.parseInt(strPage);
	    // 데이터베이스 연동 => 출력할 데이터를 가지고 온다 
	    MusicDAO dao=MusicDAO.newInstance();
	    List<MusicVO> list=dao.musicListData(curpage);
	    int totalpage=10;
	    
	    // list.jsp에서 출력할 데이터 전송 => 다른 JSP에서 사용 => session
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    // 자바를 최소화 
   }
}
