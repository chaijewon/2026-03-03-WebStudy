<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   경로 pageContext.request.contextPath => 루트 경로 
       css 읽기 <link href="${pageContext.request.contextPath}/jsp/a.css"> => react / vue 
       채팅 / 자바스크립트로 값 전송 
       
    중심 : 출력 
          ${값}
           --- request/session에 있는 값
           --- 키 
           --- 연산자 
                + : 덧셈 
                += : 문자열 
           --- 비교연산자 / 논리연산자 
           --- empty 
           내장 객체 
             requestScope 
             sessionScope 
             pageContext
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- ${pageContext.request.contextPath } --%>
</body>
</html>