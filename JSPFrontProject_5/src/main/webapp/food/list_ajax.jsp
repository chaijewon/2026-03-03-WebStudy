<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 960px;
}
h1 {
   text-align: center;
}
p{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
a.link{
  cursor: pointer;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row" id="print">
    
   </div>
   <div class="row text-center" style="margin-top: 20px" id="pagination">
    
   </div>
  </div>
</body>
</html>