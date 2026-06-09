<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    자바스크립트 
       => 제어문 (조건문 / 반복문 (for)) 
       => 배열 / 객체 (JSON)  
       => 함수 
       => 태그 조작 
          : 태그를 가지고 오는 방법 
            document.querySelector() 
            document.getElementById()
            document.querySelectorAll() => $()
          => 문자 변경 
             : textContent : 문자만 변경 => text()
             : innerHTML : <html>태그를 루가 => html()
          => 스타일 변경 
             : 태그.style.속성 (color,display....)
               => margin-top => marginTop => css()
          => 속성변경 
             : <img src="">
                       ---- img.src=""  => attr()
             : <a href=""> 
                       ---- a.href=""
          => vue/react : 함수가 없다 => 바닐라 JS를 사용해서 변경
             | v-model : 양방향 
             | ref 
    365page 이벤트 
          사용자가 행위를 한 경우 => 브라우저안에서 
                 ----- 키보드 / 마우스 
          onclick : 버튼 / 이미지 ...
          onmouseover / onmouseout => 이미지  
          onkeydown / onkeyup => text / textarea
          onchange / onsubmit => select / table 
      1. 이벤트 처리 
         = 인라인 이벤트 처리 => vue / react
                                   | 리스너 등록 
                <button onclick="처리함수호출">
                <button v-on:click=""> 
                <button @click="">
         = 고전 이벤트 처리  => jquery
           태그명.onclick(function(){})
           $().click(function(){})
         = 이벤트 리스너 사용 => Jquery
           태그명.addEventListener('click',function(){})
           $().on('click',function(){}) => 4에서 권장 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  // 인라인 이벤트 => 태그에서 호출 
function btnClick()
{
   alert("버튼 클릭!!")	  
}
</script>
</head>
<body>
  <button onclick="btnClick()">클릭</button>
</body>
</html>