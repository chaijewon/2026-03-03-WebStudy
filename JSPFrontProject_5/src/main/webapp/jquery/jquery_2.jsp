<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li:hover{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').hover(function(){
		$(this).css({
			         'opacity':0.3,
			         'cursor':'pointer',
			         'border':'2px solid green'
			       })
	},function(){
		  $(this).css({
	         'opacity':1.0,
	         'cursor':'none',
	         'border':'none'
	       })
	})
	
	$('li').on('click',function(){
		let data=$(this).text()
		alert("선택된 과정:"+data)
		$(this).text(data+"과정")
	})
	
	$('#readBtn').on('click',function(){
		let msg=$('#msg').val()
		let sel=$('#sel').val()
		let t=$('textarea').val()
		alert("text:"+msg+"\nselect:"+sel+"\ntextarea:"+t)
	})
	$('#writeBtn').on('click',function(){
		$('#msg').val("Hello Spring")
		$('#sel').val("Front-End")
		$('textarea').val("안녕하세요")
		
	})
	$('#htmlBtn').on('click',function(){
		$('#html').html('<font color=red>Hello HTML</font>')
	})
	
	// click / hover / keyup / change => 가장 많이 사용되는 이벤트 
	/*
	   $('선택자').on('keyup',function(){})
	   $('선택자').on('change',function(){})
	   $('선택자').on('mousedown',function(){})
	   
	   val() / text() / html() / prop() / append() / attr()
	   
	   여러개중에 선택된 태그를 가지고 오는 경우 : $(this)
	   
	   서버와 연동 => 화면 변경 없이 => 데이터만 변경 : 동적 페이지 
	   ------------------------------------------------
	   검색 / 댓글 / 페이징 / 로그인 / 실시간 채팅 / 실시간 데이터 읽기 
	   --- 
	   1. JSP 검색 
	   2. Ajax 
	   ----------
	   1. 댓글  
	   2. 페이징
	   ----------
	   로그인 처리
	*/
})
</script>
</head>
<body>
  <h1>이미지 스타일 변경</h1>
  <img src="m1.jpg" style="width:150px;height: 200px">
  <img src="m2.jpg" style="width:150px;height: 200px">
  <h1>this 사용</h1>
  <ul>
    <li>자바 : JSP / JDBC / Spring / Spring-Boot</li>
    <li>오라클: 데이터 저장 공간 (CRUD,JOIN,SubQuery,Index)</li>
    <li>HTML/CSS : (브라우저 화면 UI)</li>
    <li>JavaScript: 동적 페이지(클라이언트용)</li>
    <li>라이브러리 : Jquery 3 / Jquery 4 (Ajax: 서버연동)</li>
    <li>MVC를 이용한 프로젝트(세미 프로젝트)</li>
    <li>SpringFramework:MVC라이브러리 : 지원하지 않는다(유지보수)</li>
    <li>우분투 : Host방법 : AWS이용</li>
    <li>SpringBoot : JSP,ThymeLeaf</li>
    <li>CI/CD: Git Actions,Docker / Docker-Compose</li>
    <li>CI/CD: Jenkin / 쿠바네티스</li>
    <li>최종 프로젝트 : SpringBoot:ThymeLeaf:VueJS</li>
    <li>CI/CD : 무중단</li>
    <li>AWS에서 작업</li>
    <li>1. MySQL </li>
    <li>2. JPA </li>
    <li>3. NodeJS </li>
    <li>4. TypeScript </li>
    <li>5. React / Redux </li>
    <li>6. TanStackQuery = 개인프로젝트</li>
  </ul>
  <h1>val() / 입력창 : input,textarea , select</h1>
  <%--
           <textarea>값</textarea> => text() (X) => val()
           
   --%>
   <input type="button" value="읽기" id="readBtn">
   <input type="button" value="쓰기" id="writeBtn">
   <input type="button" value="HTML" id="htmlBtn">
   <br>
   <input type=text id="msg" size=20 value="Hello JavaScript"><br>
   <select id="sel">
    <option>Back-End</option>
    <option>Front-End</option>
    <option>DataBase</option>
   </select><br>
   <textarea rows="3" cols="20">Hello</textarea>
   <br>
   <span id="html"></span>
</body>
</html>






