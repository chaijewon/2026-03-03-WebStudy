package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
import com.sist.vo.*;
// 상세보기 처리 클래스 
public class DetailModel implements Model{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 사용자가 보낸 값을 받는다 
		String no=request.getParameter("no");
		DataBoardVO vo=
			DataBoardDAO.databoardDetailData(Integer.parseInt(no));
		// detail.jsp로 전송 
		request.setAttribute("vo", vo);
		return "detail.jsp";
	}

}
