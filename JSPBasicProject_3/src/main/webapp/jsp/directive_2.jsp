<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error_1.jsp"%>
<%--
   errorPage는 필수 => 전체 에러시에 처리 
   web.xml이용 => 에러별로 따로 처리가 가능 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     int a=10/0;
  %>
  <%= a %>
</body>
</html>