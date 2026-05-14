<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.temp.*"%>
<%
     String no=request.getParameter("no");
     MovieManager mm=new MovieManager();
     String result=mm.movieListData(Integer.parseInt(no));
     // watchGradeNm
%>
<%= result %>
