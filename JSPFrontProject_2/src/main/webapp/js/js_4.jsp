<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     글자 조작 (357page)
     <h1>(변경)</h1> => 장바구니 => 결제 
     -------------------------------
     textContent : 글자만 변경 (HTML을 작성시에 => 파싱) => $().text()
     innerHTML : HTML을 포함해서 변경  => $().html()
     
     h1.style.background-color (X)
     h1.style.backgroundColor(O)
              marginTop 
              - 대신 첫글자가 대문자 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	//1. 태그를 가지고 온다 
	let a=document.getElementById("a") // 아이디명만 
	a.textContent="<font color=red>문자 조작</font>"
	let b=document.querySelector("#b") // CSS선택자 이용
	b.innerHTML="<font color=red>문자 조작</font>"
	b.style.border="3px soild green"
	
	let btn=document.querySelectorAll("button")
	btn[0].textContent="취소"
	btn[1].style.backgrounColor="yellow"
	
	document.body.style.backgroundColor='pink'
	// body => document.body
}
</script>
</head>
<body>
  <button type="button">삭제</button>
  <button type="button">HTML추가</button>
  <h1 id="a">Hello 문자 조작(textContent)</h1>
  <h1 id="b">Hello 문자 조작(innerHTML)</h1>
  <%--
      자바스크립트 : id가 중복되면 오류 발생 
      CSS : id가 중복되도 구동(적용)
      id => 반드시 중복이 없게 만든다 => 중복 (class)
   --%>
</body>
</html>