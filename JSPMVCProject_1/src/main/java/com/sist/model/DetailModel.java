package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class DetailModel {
	  public void execute(HttpServletRequest request)
	  {
		  String msg="게시판 상세보기";
		  request.setAttribute("msg", msg);
	  }
}
