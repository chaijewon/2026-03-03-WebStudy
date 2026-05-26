<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
     BoardModel model=new BoardModel();
     // <jsp:useBean id="model" class="com.sist.model.BoardModel"/>
     model.boardInsert(request, response);
%>
