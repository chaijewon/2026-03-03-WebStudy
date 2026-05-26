<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
       JSTL => Java Standard Tag Lib
       core 
         1) 변수 설정 : < c:set var="vo" value="<%= new SawonVO()%>">
                     => request.setAttribute("vo",new SawonVO()) 
         2) 화면 출력 : <c:out value=""> : 자바스크립트에서 출력시 
         3) 제어문 
            <c:forEach> : 반복문 
            <c:if> : 조건문
            <c:choose> : 다중 조건문
            <c:forTokens> : StringTokenizer
         4) URL => 화면 이동 : <c:redirect url=""> sendRedirect()
       ---------------------------------------------------
       fmt 
         1) 날짜 변경 : <fmt:formatDate> SimpleDateFormat
         2) 숫자 변경 : <fmt:formatNumber> DecimalFormat
       fn 
         1) String클래스의 메소드 
            fn:length() , fn:substring() fn:trim() ....
       ----------------------------------- 자바에서 처리 
       --------
       sql 
       xml 
       -------- X
 --%>
<%
    String name="홍길동"; // ${name}(X)
    request.setAttribute("name", name);
%>
<c:set var="name1" value="심청이"/>
<%-- var:key , value:값 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름:${name }<br>
이름:${name1 }
</body>
</html>