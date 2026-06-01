package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class ListModel implements Model{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String strPage=request.getParameter("page");
	    if(strPage==null)
	    	strPage="1";
	    int curpage=Integer.parseInt(strPage);
	    int start=(curpage*10)-10;
	    List<DataBoardVO> list=DataBoardDAO.databoardListData(start);
	    int totalpage=DataBoardDAO.databoardTotalPage();
	    // JSP <% %> , <%= %> 사용하지 않는다
	    //             ------ EL로 출력
	    //     ----- Model클래스 처리 
	    // 결과값 보내기 => list.jsp
	    request.setAttribute("list", list); // ${list}
	    request.setAttribute("curpage", curpage); // ${curpage}
	    request.setAttribute("totalpage", totalpage); // ${totalpage}
		return "list.jsp";
	}

}
