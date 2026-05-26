<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<%
     model.boardListData(request); // => Controller (X) => MV
     /*
        자바 / HTML 분리
              => View 
        => Model
        ------------------ MV구조 
     */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
</body>
</html>