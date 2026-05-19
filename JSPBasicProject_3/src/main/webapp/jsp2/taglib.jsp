<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
    uri => import 
    prefix => 접두어 
    prefix="c"  => <c:
    prefix="core" => <core:
    ------------- 제어문 / 변수 설정 / URL => 가장 많이 사용 
    <c:for>
    <c:if> => <c:else>없다 
    <c:choose>
      <c:when test=""></c:when>
      <c:when test=""></c:when>
      <c:when test=""></c:when>
      <c:otherwise></c:otherwise>
    </c:choose>
    
    <c:set> 변수 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>일반 자바</h1>
  <%
     for(int i=1;i<=10;i++)
     {
    	 if(i%2==0)
    	 {
  %>
        <%=i %>&nbsp;
  <%
    	 }
     }
  %>
  <h1>JSTL</h1>
  <c:forEach var="i" begin="1" end="10" step="1">
    <c:if test="${i%2==0}">
    ${i }&nbsp;
    </c:if>
  </c:forEach>
</body>
</html>