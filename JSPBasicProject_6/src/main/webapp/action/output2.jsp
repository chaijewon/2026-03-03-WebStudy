<%@page import="com.sist.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전송된 데이터를 받는다 (사용자가 데이터를 전송 => 톰캣에 의해 request에 값이 담긴다) 
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String address=request.getParameter("address");
    String phone=request.getParameter("phone");
    String content=request.getParameter("content");
    // 코드가 지저분 / 유지보수가 어렵다 
    // 오라클로 보낸다 / 화면 출력 
    
    MemberBean bean=new MemberBean();
    bean.setName(name);
    bean.setSex(sex);
    bean.setAddress(address);
    bean.setPhone(phone);
    bean.setContent(content);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>받은 데이터</h1>
  이름:<%=bean.getName() %><br>
  성별:<%=bean.getSex() %><br>
  주소:<%=bean.getAddress() %><br>
  전화:<%=bean.getPhone() %><br>
  소개:<%=bean.getContent() %>
</body>
</html>