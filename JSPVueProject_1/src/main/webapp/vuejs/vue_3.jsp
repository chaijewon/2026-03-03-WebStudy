<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 800px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <div class="container" id="a">
    <div class="row">
     {{msg}}
    </div>
  </div>
  <div class="container" id="b">
    <div class="row">
     {{msg}}
    </div>
  </div>
  <script>
   // 대소문자 구분
   let a=Vue.createApp({
	   data(){
		   return {
			   msg:'Hello a영역'
		   }
	   }
   }).mount("#a")
   let a=Vue.createApp({
	   data(){
		   return {
			   msg:'Hello b영역'
		   }
	   }
   }).mount("#b")
  </script>
</body>
</html>