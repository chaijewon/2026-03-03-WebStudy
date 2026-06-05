<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    이항 연산자 
    : JQuery , Vue , React ..... 기반 자바스크립트 
    : JSP / MVC / JDBC / DBCP / MyBatis 
      => 사용되는 프로그램 java
    ASP.Net => C# , 안드로이드 : kotlin , IPhone : Swift 
    
    Web 
     1. BackEnd
        언어(Java) = JSP = MVC = SpringFramework = SpringBoot 
        ---------------------
        
     2. DataBase = 오라클 (SQL) = JDBC = DBCP = ORM 
                                              (MyBatis,JPA)
                                              --------
     3. Front = HTML = CSS = JavaScript 
                = Jquery = Vue = React 
                ---------
     
      이항연산자 
        산술 연산자  ( + , - , * , / , % )
             + : 덧셈 , 문자열 결합 => 연산이 안되는 경우 : NaN
             / : 0으로 나눌 수 없다 
                 정수 / 정수 = 실수  (자바 : 5/2 : 2, 5/2=2.5)
                 ---------------
             % : 왼쪽부호가 남는다 
                 + % +  +
                 + % -  +
                 - % +  -
                 - % -  - 
        비교 연산자 : 장점 => 문자열 / 날짜를 비교할 수 있다 
           == (데이터형과 관련없이 비교) === (데이터과 관련이 있다:권장)
               '10'==10   '10'===10
               ---------  ----------
                 true       false
                 
               => == 같은 데이터형으로 변경 
                  parseInt('10')==10
           !=  ====================> !==
           < 
           > 
           <= 
           >=
        논리 연산자
        대입 연산자 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=5
	let b=2
	console.log("a+b="+(a+b)) // 7
	console.log("a-b="+(a-b)) // 3
	console.log("a*b="+(a*b)) // 10
	console.log("a/b="+(a/b)) // 2.5
	console.log("a%b="+(a%b)) // 1
	// 장바구니 총액(금액*수량) / 예약 총액(영화*인원수) 
	
	let c="10"
	let f=20000
	console.log(c+f) // 문자열 결합 
	console.log(parseInt(c)+f)
	/*
	   주의점 
	     숫자가 아닌 경우 연산 처리 => 연산이 불가능 => NaN 
	     (+:문자열 결합)
	     "" , '' => 문자열 
	     HTML을 통해서 숫자를 가지고 오면 =>문자열로 읽어 온다 
	     
	*/
	let m=10
	let n="10"
    
	console.log("m==n:"+(m==n))
	console.log("m===n:"+(m===n)) // 유효성 검사 (id==="") NOT NULL
	console.log("m!==n:"+(m!==n)) // (pwd!==pwd1)
	console.log("m!=n:"+(m!=n)) // => 회원 가입 / 검색 / 로그인 
	console.log("m<n:"+(m<n)) // required => HTML5
	console.log("m>n:"+(m>n)) // 이메일 => 정규식
	console.log("m<=n:"+(m<=n))
	console.log("m>=n:"+(m>=n))
}
function ok()
{
	let frm=document.frm
	if(frm.id.value==="")
	{
		alert("아이디 입력!!")
		return
	}
	if(frm.pwd.value==="")
	{
		alert("비번 입력!!")
		return
	}
	if(frm.pwd1.value==="")
	{
		alert("비번 재입력 입력!!")
		return
	}
	if(frm.pwd.value!==frm.pwd1.value)
	{
		alert("비밀번호가 틀립니다")
		return
	}
}
</script>
</head>
<body>
  <form name="frm">
   ID:<input type=text name=id size=15><br>
   Password:<input type=password name=pwd size=15><br>
   재확인:<input type=password name=pwd1 size=15><br>
   <input type=button value="확인" onclick="ok()">
  </form> 
</body>
</html>