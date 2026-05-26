<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>고전적인 방식</h1>
  <%
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
  %>
  ID:<%= id %>,Password:<%= pwd %>
  <h1>현재 방식</h1>
  ID:${param.id },Password:${param.pwd }
  <!-- EL은 화면에 데이터를 출력 : request,session에 데이터를 첨부해서 전송
       request.setAttribute() => request.getAttribute()
   -->
   <h1>고전적인 방식</h1>
   <%
      String[] hobby=request.getParameterValues("hobby");
      for(String h:hobby)
      {
   %>
        <%=h %>&nbsp;
   <%
      }
   %>
   <h1>현재 방식</h1>
   ${paramValues.hobby[0] }
   ${paramValues.hobby[1] }
   ${paramValues.hobby[2] }
   ${paramValues.hobby[3] }
   ${paramValues.hobby[4] }
</body>
</html>