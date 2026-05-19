<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 사용자가 보내준 값을 받는다
    String name=request.getParameter("name");
    String pwd=request.getParameter("pwd");
    String sex=request.getParameter("sex");
    String loc=request.getParameter("loc");
    String content=request.getParameter("content");
    String day=request.getParameter("birthday");
    // 입력창 => 단일값
    String[] hobby=request.getParameterValues("hobby");
    // checkbox=>다중값 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름:<%=name %><br>
비밀번호:<%=pwd %><br>
성별:<%=sex %><br>
지역:<%=loc %><br>
소개:<%=content %><br>
생일:<%=day %><br>
취미:
<ul>
<%-- getParameterValues : 반드시 null체크 
     태그안에 name속성 
            <input type=text name=name>
     output.jsp?name=홍길동....
                ----- name 속성명 
                
     URL / URI 
     ---------- ?앞까지 
     ---------- ?뒤에 있는 내용은 톰캣에 의해서 request에 저장 
 --%>
<%
    if(hobby!=null)
    {
        for(String h:hobby)
        {
%>
           <li><%=h %></li>
<%
        }
    }
    else
    {
%>
       <li style="color:red">취미가 없습니다</li>
<%
    	
    }
%>
</ul>
<ul>
  <li>URL:<%=request.getRequestURL() %></li>
  <li>URI:<%=request.getRequestURI() %></li>
  <li>request/response는 화면 변경이 되면 초기화</li>
</ul>
</body>
</html>