<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSP Basic</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <%--
          Cookie / Session (12장)
       --%>
      <li><a href="#">스토어</a></li>
      <%--
          파일업로드 (13장) => COS.jar => javax (X) 
          = commons-fileupload.jar = Apache => Spring-Boot
          
       --%>
      <li><a href="#">자료실</a></li>
    </ul>
  </div>
</nav>
</body>
</html>