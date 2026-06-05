<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       자바스크립트에서 지원하는 연산자
       1) 단항연산자 
           => 증감연산자 (++ , --)
           => 부정연산자 (!)
           => 형변환 연산자  
              Number() , parseInt()
              Boolean() 
              String()
              let a=(int)10.5 X
       2) 이항연산자 
           => 산술 연산자 : + , - , * , / , %
           => 비교 연산자 : == , != , < , > , <= , >=
                         --------
                         === , !== (데이터형이 같은 경우)
           => 논리 연산자 : && , ||
           => 대입 연산자 : = , += , -= , *= ...
                         ------------ 
       3) 삼항연산자  
           조건 ? 값1 : 값2
            | true = 값 1
            | false = 값 2 ==> if~else
       자바 개발자 => 자바스크립트 
       ==> 파산 => 네스케이프 (브라우저) => 이직 => 만든 언어 (자바스크립트) 
       
       <script type="text/javascript">
         => Vue / React 
            <script type="text/babel">
            <script>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
<script type="text/javascript">
window.onload=function(){
	// 1. 단항 연산자 (증감연산자 , 부정연산자 , 형변환 연산자) 
	/*
	    증감 연산자 : 1개 증가 , 1개 감소  
	*/
	let a=10
	document.write("<h1> 증가전:"+a+"</h1>")
	a++
	document.write("<h1> 증가후:"+a+"</h1>")
	document.write("<h1> 감소전:"+a+"</h1>")
	a--
	document.write("<h1> 감소후:"+a+"</h1>")
	document.write("<hr>")
	
	a=10
	let b=a++
	/*
	    let b=a => b=10
	    a++ => a=11
	    후치연산 
	      => 대입 / 나중에 증가 
	*/
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> b="+b+"</h1>")
	
	a=10
	b=++a
	/*
	   a=a+1
	   b=a
	   전치연산 
	     증가 / 나중에 대입
	*/
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> b="+b+"</h1>") // <body>
	
	document.write("<hr>")
	// document => 화면을 출력하는 브라우저 영역 
	
	let c=true
	document.write("c="+c+"<br>")
	c=!c
	document.write("c="+c+"<br>")
	
	c=1  // 0,0.0아닌수는 true
	document.write("c="+c+"<br>")
	c=!c // true/false를 출력하는 연산자 => 자동으로 boolean으로 변경 
	document.write("c="+c+"<br>")
	
	document.write("<hr>")
	let a1=10
	document.write("a1="+a1+",type="+typeof a1)
	a1=String(a1) // String.valueOf()
	document.write("a1="+a1+",type="+typeof a1)
	//a1=parseInt(a1)
	a1=Number(a1)
	document.write("a1="+a1+",type="+typeof a1)
	document.write("<hr>")
	document.write("Boolean(1)="+Boolean(1)
			       +",type="+typeof Boolean(1)+"<p>")
	document.write("Boolean(0)="+Boolean(0)
			       +",type="+typeof Boolean(0)+"<p>")
    document.write("Boolean(0.0)="+Boolean(0.0)
			       +",type="+typeof Boolean(0.0)+"<p>")
	document.write("Boolean(0.1)="+Boolean(0.1)
			       +",type="+typeof Boolean(0.1)+"<p>")
	document.write("Boolean('Hello JavaScript')="+Boolean('Hello JavaScript')
			       +",type="+typeof Boolean('Hello JavaScript')+"<p>")
	document.write("Boolean('')="+Boolean('')
			       +",type="+typeof Boolean('')+"<p>")
	document.write("Boolean(\"\")="+Boolean("")
			       +",type="+typeof Boolean("")+"<p>")
	// 특별한 경우가 아닌 경우 => 일반 데이터형 사용 
}
</script>
--%>
<script type="text/javascript">
function calc()
{
	let f=document.getElementById("first").value
	let s=document.getElementById("second").value
	console.log("f="+f+",type="+typeof f)
	console.log("s="+s+",type="+typeof s)
	let span=document.getElementById("result")
	//span.innerHTML="<h2>"+(Number(f)+Number(s))+"</h2>"
	// 서버에서 값을 받아서 원하는 위치 값 출력 => Ajax / Axios
	span.innerHTML="<h2>"+(parseInt(f)+parseInt(s))+"</h2>"
	/*
	    1. 문자열 => 숫자변환 Number() / parseInt()
	    2. 숫자 => 문자열 변환 String()
	    3. 논리형 변환 => Boolean()
	                   0,0.0,'',"" ,null을 제외 => 나머지 true
	*/
}
</script>
</head>
<body>
  첫번째 값: <input type=text id="first" size=10><br>
  두번째 값: <input type=text id="second" size=10><br>
  <input type=button value="계산" onclick="calc()"><br>
  <span id="result"></span>
  
</body>
</html>