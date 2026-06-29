<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <jsp:include page="../main/header.jsp"></jsp:include>
   <div class="container text-right">
     ID:<input type="text" ref="idRef" size=15 class="input-sm">
     &nbsp;
     PW:<input type="password" ref="pwdRef" size=15 class="input-sm">
     &nbsp;
     <button class="btn-sm btn-danger">로그인</button>
   </div>
   <hr>
   <jsp:include page="${main_jsp }"></jsp:include>
</body>
</html>