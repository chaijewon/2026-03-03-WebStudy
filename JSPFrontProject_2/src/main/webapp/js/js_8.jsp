<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.box {
  width: 200px;
  height: 200px;
  border:1px solid black;
  margin-top: 2px
}
</style>
<script type="text/javascript">
window.onload=()=>{
	let div=document.querySelectorAll(".box") // []
	for(let i=0;i<div.length;i++)
	{
		div[i].addEventListener('mousedown',function(){
			div[i].style.backgroundColor="red"
		})
		div[i].addEventListener('mouseup',function(){
			div[i].style.backgroundColor="orange"
		})
    }
}
</script>
</head>
<body>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>    
</body>
</html>