<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Java 날짜 변환</h1>
  <%
      Date date=new Date();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
      String today=sdf.format(date);
  %>
  오늘 날짜:<%=today %>
  <h1>JSTL 날짜 변환</h1>
  <%-- 사용 빈도가 거의 없다 : TO_CHAR(regdate,'yyyy-mm-dd') --%>
  <c:set var="today" value="<%=new Date() %>"/>
  오늘 날짜:<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
  <%--
     숫자 변환 1,000  => 자바스크립트 : toLocaleString()
   --%>
  <h1>Java 숫자 변환</h1>
  <%
      int won=1234567;
      DecimalFormat df=new DecimalFormat("##,###,###");
      String data=df.format(won);
  %>
  <%= data %>
  <h1>JSTL 숫자 변환</h1>
  <%-- 우선시는 자바에서 오라클에서 먼저 처리 : JSTL --%>
  <fmt:formatNumber value="1234567" type="currency"/>
  <%--
       오라클 => TO_CHAR()
   --%>
  <br>
  <fmt:setLocale value="en_US"/>
  <fmt:formatNumber value="1234567" type="currency"/>
  <br>
  <%-- 특가  --%>
  <fmt:formatNumber value="0.75" type="percent"/>
  
</body>
</html>