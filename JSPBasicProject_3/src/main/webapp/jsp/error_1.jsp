<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%--
   현재 페이지가 에러처리 페이지인지 설정
   isErrorPage="true" => exception사용이 가능 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%= exception.getMessage() %>
</body>
</html>