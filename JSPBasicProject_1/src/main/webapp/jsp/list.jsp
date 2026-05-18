<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("  ");

    String name="홍길동"; <% %>
  
      out.write("\r\n");
      out.write("  ");
      out.print( name ); <%= %>
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      
      =====>  servlet
   
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
    String name="홍길동";
  %>
  <%= name %>
  <%!
       public void display()
       {
          
       }
  %>
</body>
</html>