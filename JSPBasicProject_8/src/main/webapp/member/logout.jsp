<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션에 저장된 모든 정보를 삭제 
    session.invalidate();
    // main.jsp로 이동 
    response.sendRedirect("../main/main.jsp");
%>