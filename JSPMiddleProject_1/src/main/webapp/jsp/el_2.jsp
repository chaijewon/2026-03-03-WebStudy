<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     EL 데이터를 읽는 경우 => 내장 객체 
     -----------------
      **1. request에 담긴 값 
         request.setAttribute("name","홍길동")
         => ${requestScope.name} => 홍길동 
             ------------- 생략이 가능 => ${name}
                                        ------- 키
      **2. session에 담긴 값
         session.setAttribute("name","심청이")
         => ${sessionScope.name} => 심청이 
              ------------ 생략이 안된다 (requestScope우선 = seesionScope)
              request에 없는 경우에는 sessionScope 생략이 가능 
      3. application에 담긴 값 
         application.setAttribute("name","박문수")
         => ${applicationScope.name} => 박문수 
      4. param => 다른 jsp에서 보낸 값 
         a.jsp?name=이순신
         => ${param.name} => 이순신 => request.getParameter("name")
      5. paramValues => 여러개를 동시에 받는 경우  
         => checkbox 
         a.jsp?hobby=a&hobby=b&hobby=c
         => ${paramValues.hobby}
      일반 변수는 출력이 불가능하다 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      // 자바에서 코딩 => 데이터를 JSP전송 => 받아서 출력 
      request.setAttribute("name","홍길동");
      session.setAttribute("name","심청이");
      application.setAttribute("name","박문수");
      // 키가 같은 경우 => request => session => application
  %>
  이름:${ name }<br>
  이름:${ sessionScope.name }<br>
  이름:${ applicationScope.name }<br>
</body>
</html>