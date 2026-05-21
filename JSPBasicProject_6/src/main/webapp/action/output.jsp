<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전송된 데이터를 받는다 (사용자가 데이터를 전송 => 톰캣에 의해 request에 값이 담긴다) 
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String address=request.getParameter("address");
    String phone=request.getParameter("phone");
    String content=request.getParameter("content");
    // 오라클로 보낸다 / 화면 출력 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>받은 데이터</h1>
  이름:<%=name %><br>
  성별:<%=sex %><br>
  주소:<%=address %><br>
  전화:<%=phone %><br>
  소개:<%=content %>
</body>
</html>