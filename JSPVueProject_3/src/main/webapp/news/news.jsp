<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.news-box{
  width: 400px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rega(0,0,0,0.1);
  padding: 20px
}
h2 {
  text-align: center;
  color:#2536eb
}
ul {
  list-style: none;
  padding: 0
}
li {
   margin: 10px 0;
   padding: 10px;
   border-bottom: 1px solid #eee;
}
a {
  text-decoration: none;
  color:#333;
}
a:hover{
  color:#2563eb
}
</style>
</head>
<body>
  <div class="news-box">
    <h2>실시간 뉴스</h2>
    <ul id="newsList">
     
    </ul>
  </div>
</body>
</html>