<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    문자 조작 
     = textContent : 태그와 태그에 값을 주입 (순수한 문자열) => HTML은 파싱이 안된다
                     => text()
     = innerHTML : 태그와 태그에 HTML을 추가 => HTML 파싱이 가능
                     => html() 
     = appendChild : 태그사이에 태그 첨부
                     => append()
     => html() VS append()
                  => 여러번이 가능 (추가)
        => 한번만 사용이 가능 (수정)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let h1=document.querySelector("h1")
	let val=h1.textContent
	console.log("h1:"+val)
	
	val=$('h1').text()
	console.log('h1:jquery=>'+val)
	
	//h1.textContent="바닐라 JS 이용"
	$('h1').text("Jquery JS 이용")
	
	let h2=document.querySelector("h2")
	h2.innerHTML='<font color=red>순수 자바스크립트</font>'
	
	$('h2').html('<font color=green>Jquery 사용1</font>')
	$('h2').html('<font color=blue>Jquery 사용2</font>')
	alert($('div').text())
})
</script>
</head>
<body>
  <h1>Hello Jquery</h1>
  <h2>Hello Jquery</h2>
  <h3>Hello Jquery</h3>
  <h4>Hello Jquery</h4>
  <h5>Hello Jquery</h5>
  <div>
    <h6>Div안에 h1</h6>
    <h6>Div안에 h2</h6>
    <h6>Div안에 h3</h6>
  </div>
</body>
</html>






