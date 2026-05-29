package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class InsertModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String msg="게시판 추가";
		request.setAttribute("msg", msg);
		return "view/insert.jsp";
	}

}
