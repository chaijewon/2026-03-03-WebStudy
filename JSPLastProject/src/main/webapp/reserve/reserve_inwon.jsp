<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:forEach var="i" begin="2" end="5">
    <button class="btn btn-outline-danger btn-sm times">${i }명</button>
   </c:forEach>
    <button class="btn btn-outline-danger btn-sm times">단체</button>
</body>
</html>