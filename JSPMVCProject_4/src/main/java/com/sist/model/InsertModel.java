package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// => JSP (X) => Servlet을 이용한 파일 업로드 
public class InsertModel implements Model{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "insert.jsp";
	}

}
