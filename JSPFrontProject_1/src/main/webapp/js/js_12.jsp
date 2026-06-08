<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     객체 배열 : [{},{},{},{}...]
     JSP 파일 
     -------
        - , . 이용이 불가능 
        _,$
        
        a b.jsp 
        
        class a_b_jsp => 파일명 클래스명이다 => 자바문법 (식별자) 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 서버에서 값을 받아서 처리 
let sawons=[
	{sabun:1,name:"홍길동",dept:"개발부",job:"대리",pay:3600,loc:"서울"},
	{sabun:2,name:"이순신",dept:"영업부",job:"사원",pay:3000,loc:"부산"},
	{sabun:3,name:"강감찬",dept:"기획부",job:"과장",pay:4000,loc:"서울"},
	{sabun:4,name:"심청이",dept:"개발부",job:"부장",pay:7000,loc:"서울"},
	{sabun:5,name:"박문수",dept:"개발부",job:"사원",pay:3000,loc:"서울"}	
]
// 데이터 출력 ==> 함수
const sawonList=()=>{
	document.write("<h3>사원 목록</h3>")
	document.write("<ul>")
	sawons.map((sa)=>{
		document.write("<li>"+sa.name+"</li>")
	})
	document.write("</ul>")
}
const sawonInsert=()=>{
	sawons.push({sabun:6,name:"춘향이",dept:"총무부",job:"사원",pay:3000,loc:"경기"})
}
const sawonDetail=(sabun)=>{
	document.write("<h3>사원 상세</h3>")
	let sawon=sawons.find(sa=>sa.sabun===sabun)
	document.write("사번:"+sawon.sabun+"<p>")
	document.write("이름:"+sawon.name+"<p>")
	document.write("부서:"+sawon.dept+"<p>")
	document.write("직위:"+sawon.job+"<p>")
	document.write("연봉:"+sawon.pay+"<p>")
	document.write("근무지:"+sawon.loc+"<p>")
}
const sawonDelete=(sabun)=>{
	const result=sawons.filter(sa => sa.sabun!==sabun )
	document.write("<ul>")
	result.map((sa)=>{
		document.write("<li>"+sa.name+"</li>")
	})
	document.write("</ul>")
}
window.onload=function(){
	sawonList()
	//sawonInsert()
	//sawonList()
	//sawonDetail(2)
	sawonDelete(3)
	
}
</script>
</head>
<body>

</body>
</html>