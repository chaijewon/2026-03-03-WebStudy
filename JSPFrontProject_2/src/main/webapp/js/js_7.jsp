<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   이벤트에서 주로 사용 
     => 인라인 이벤트 / 이벤트 리스너 사용이 가장 많이 사용 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1=document.getElementById("h1")
	let gBtn=document.getElementById("green")
	let bBtn=document.getElementById("blue")
	let rBtn=document.getElementById("red")
	/*
	     let gBtn=document.querySelector("#green")
	     let bBtn=document.querySelector("#blue")
	     let rBtn=document.querySelector("#red")
	*/
	// $("#green").on("click",function(){}) => Jquery 4 권장 
	// $("#green").click(function(){}) : 고전적인 이벤트 
	/*
	    <button v-on:click="처리함수">
	    <button @click="처리함수">
	    
	    <button onClick={함수 호출}> react
	*/
	gBtn.addEventListener('click',function(){
		h1.style.color="green"
	})
	
	
	bBtn.addEventListener('click',function(){
		h1.style.color="blue"
	})
	
	rBtn.addEventListener('click',function(){
		h1.style.color="red"
	})
	
}
</script>
</head>
<body>
  <h1 id="h1">제목</h1>
  <button id="green">Green</button>
  <button id="blue">Blue</button>
  <button id="red">Red</button>
</body>
</html>