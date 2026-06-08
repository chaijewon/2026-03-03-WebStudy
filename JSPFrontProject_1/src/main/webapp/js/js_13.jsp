<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    기본 문법 
       => 변수 선언 (ES 6 => let / const)
       => 연산자 (산술 , 단항 , 비교 , 논리 , 대입) => 삼항연산자 
       => 제어문 
          if / if~else / for / forEach / map
       => 자바 => ArrayList / VO 
                 [] : 배열    {} : JSON 
       => 함수 
       => 이벤트 처리 
       => 태그 제어 => DOM 
       => 내장 함수 (Number,Math,Strin, Date)
       => 브라우저 내장 객체 (BOM)
          => window / location / history / document 
       ----------------------- JQuery / Vue / React => Front-End 
       => HTML 태그 / CSS 선택자 
       => 서버와 연동 : Ajax / fetch / axios 
                     --------------------- async / await 
       => document.querySelector("tbody")
          => $('tbody') => 3버전 / 4버전 동일 
    325page 
      함수 : function (메소드) 
            => 명령문의 집합 : 명령문 여러개를 모아서 한개의 기능을 생산 
               ---------- 변수 / 연산 / 제어
            => 구조화된 프로그램 : 기능별 분리 
            => 함수 / 메소드 
                     | 클래스 종속 
               | 독립적으로 사용 
            => 기능처리 (로그인 / 목록 / 페이지 ....) : 브라우저안에서 요청이 있는 경우 
               반복제거 / 재사용이 가능 / 에러 처리가 쉽다 
            => 자바스크립트에는 함수가 데이터형으로 인식
                                 ------ 매개변수로 사용이 가능 => CallBack 
               typeof => function 
               names.map(function(){})
                         ------------ CallBack => 자동 호출되는 함수 
            => let a=function(){}
       ---------------------------------------------------------
       함수 제작 방법 
       -----------
        선언적 함수 => 가장 많이 사용된 함수형식 
          형식) 
               function 함수명(매개변수...) => 선언부 
               {
                  구현부 
               }
               
               특징 :  리턴형을 기재하지 않는다 
                      매개변수는 변수명 설정 
               예) 
                  function login(id,pwd)
                  {
                      로그인 처리 
                  }
                  
               함수 유형 
               --------------------------------------------
                       리턴형(처리 결과값) 매개변수 (사용자 요청값)
               --------------------------------------------
                            O                O
                       function 함수명(매개변수...)
                       {
                            ...
                            ...
                            return 값
                       }
               --------------------------------------------
                            O                X
                            
                       function 함수명() => 태그에 설정된 값 읽기
                       {
                            ...
                            ...
                            return 값
                       }  
               --------------------------------------------
                            X                O
                       function 함수명(매개변수...)
                       {
                            ...
                            ...
                            
                       }
               --------------------------------------------
                            X                X
                       function 함수명()
                       {
                            ...
                            ...
                            
                       }
               --------------------------------------------
                 자바 스크립트 처리 
                 외부 스크립트 : .js 파일을 만들어서 사용 
                              => 여러개의 파일에서 동시에 사용 (공통 사용) 
                              => 소스가 긴 경우 
                      <script src="자바스크립트 파일명"> : import 
                 내부 스크립트 : 한파일에서만 작업
                   <head>
                     <script>
                      function aaa(){}
                     </script>
                   </head> 
                 인라인 스크립트 : 태그 한개 제어 
                   <button onclick="javascript:hsitory.back()">
                 
               --------------------------------------------
        익명의 함수 : 함수안에 함수를 선언할 수 있다 / 매개변수 사용  
           let 변수명=function(){}
           ----------------------
        화사표 함수 : function / return 제거 =>
           let 변수명=()=>{}
        콜백함수 
           function 함수명(function(){}) : forEach / map ...
           
       ----------------------------------------------------
       함수의 구성 요소 
       -------------
       선언부 : 함수명 / 매개변수 => 리턴형을 서술하지 않는다 
       구현부 : 변수 선언 / 연산처리 / 제어문 
       function 함수명(매개변수..)
       ------------------------ 선언부 
       {
           ----------------
             구현부 
           ----------------
       }
      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 선언적 함수 
function plus(a,b)
{
	 return a+b
}
// 익명의 함수 
let plus2=function(a,b)
{
	return a+b
}
// 화살표 함수 => function / return을 제거 
let plus3=(a,b)=>{return a+b}
let plus4=(a,b)=>a+b
/*
window.onload=function(){
	
}
*/
/*window.onload=()=>{
	// ;은 생략 => 권장 => ;를 사용해도 오류는 없다 
	let a=10
	let b=20
	
	let c=plus(a,b)
	let d=plus2(a,b)
	let e=plus3(a,b)
	let f=plus4(a,b)
	
	document.write("c="+c+",type="+typeof plus+"<br>")
	document.write("d="+d+",type="+typeof plus2+"<br>")
	document.write("e="+e+",type="+typeof plus3+"<br>")
	document.write("f="+f+",type="+typeof plus4+"<br>")
	
	func(callback)
}*/
let callback=function()
{
	document.write("함수 Call...<br>")
}
function func(call)
{
	 for(let i=1;i<=10;i++)
	 {
	     call()	 
	 }
}
/*
 *   setTimer(callback) => 지정된 시간에 호출이 가능 
                        => 회원가입 => 축하메세지 => 자동으로 main으로 이동 
     setInterval(callback) => 실시간으로 뉴스 / 날씨 읽기 
     
     이벤트 처리 
     => 이벤트 등록 : $('태그').click(function(){})
     => Ajax / Axios => 서버에서 보낸 데이터를 자동으로 읽어올 수 있게 
 */
window.onload=function(){
  /*function display()
  {
	  alert("display Call..")
  }
  display()*/
  let display=()=>{
	  alert("display Call..")
  }
  display()
}
</script>
</head>
<body>

</body>
</html>