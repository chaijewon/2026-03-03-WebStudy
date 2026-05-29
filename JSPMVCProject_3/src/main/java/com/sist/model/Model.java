package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *  Spring / struts
 *           | Action => execute 
 *  | Controller => handleRequest
 */
public interface Model {
   // 사용자 요청시에 처리하는 메소드
   public String handleRequest(HttpServletRequest request,
		   HttpServletResponse response);
}
