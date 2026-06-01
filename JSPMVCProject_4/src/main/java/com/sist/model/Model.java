package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 인터페이스 => 서로 다른 클래스를 한개 묶어서 사용 : 스프링에서 주로 사용하는 방법 
public interface Model {
   // 요청 => 요청 처리 
   public String requestHandler(HttpServletRequest request,
		      HttpServletResponse response);
   // Model에 요청처리 => 요청 내용(request), 응답 (response)
}
