package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GoodsListModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../goods/list.jsp");
		return "../main/main.jsp";
	}

}
