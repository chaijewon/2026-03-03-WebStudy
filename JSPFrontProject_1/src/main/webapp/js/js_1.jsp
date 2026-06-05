<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       자바 스크립트 (Front-End)
       1) 변수 (let (변수) , const (상수))
       2) 자료형 종류 ( number , string , boolean , null , function,
                     object , undifined )
       3) 연산자 
       4) 제어문 (조건문 , 반복문 , 반복 제어문)
       5) 함수 
       6) 배열 / 객체 => JSON
       ------------------------------ 기본 문법 
       7) 태그 제어 (HTML 화면 제어) => DOM
       8) 이벤트 
       9) 비동기 (async / await) => Promise
       -------------------------------------> 바닐라JS
       10) 라이브러리 
           Jquery 3  =====> jquery 4
       11) Vue3 => Vuex => Pinia => NuxtJS
       =====> NodeJS / TypeScript
       12) React => Redux => TanStackQuery => NextJS 
       
       웹 구성 (Front)
         = HTML : 웹페이지의 구조 
         = CSS  : 디자인 / 스타일 변경 
         = JavaScript : 동작 / 기능 처리 => 데이터 처리 
         = 전체 기반 => HTML (브라우저에서 실행하는 언어) 
       특징 
         = 인터프리터 (컴파일을 하지 않는다) => 한줄씩 읽어서 출력 
           ** 에러 처리가 어렵다 => 개발자 도구 
         = 동적 페이지 : 화면 변경이 없이 그자리에서 처리 
         = 비동기 처리가 가능 
       사용처 
         = 웹 개발 (동적 처리) 
           = 로그인처리 / 팝업창 (아이디 중복체크 , 우편번호) 
           = 검색 / 서제스트(자동 완성기) 
           = JavaScript = Vue / React 
         = Back-End 개발이 가능 (서버) => NodeJS
         = 모바일 : React Native 
         = 데스크탑 애플리케이션 : VsCode / VuErd
         = 게임개발 / 실시간 채팅 (화상) / AI
           ** 오렌지 / 스프렁크 => 데이터 분석(데이터마이닝)
           
       어떤 언어인지 : HTML과 CSS로 구성된 웹페이지를 동적으로 변경하는 역할 
                    --------- 데이터 변경을 할 수 없다 (정적페이지)
       동작 방법 
         내부 script 
            <head> 
              <script>
                처리
              </script>
            </head>
         외부 script 
            .js파일을 만들어서 처리 
            <script src="파일명">
         인라인 script 
            태그 자체 처리 
            <button onclick="javascript:history.back()">
            
      => JavaScript 
         = window.onload=function(){처리} => 변수 선언 / 제어문 / 함수 선언
                                            이벤트 등록
         = jquery : $(function(){처리})
         = vue : mounted(){} 
         = react : componentDidMount(){}
                   ==================
                   useEffect()
                   
      정의 : 웹브라우저에서 동작하는 스크립트언어 
                              ------ 단순한 언어 
      용도 : 동적 페이지 제작 , 서버 개발 , 앱 개발 
      실행환경: 브라우저에서 실행 
      특징 : 인터프리터 / 객체 기반 / 이벤트 중심 
      
      1. 기본문법 
         = 변수 : 자동 인식 변수 => ES5 : var / ES6 : let / const 
           1개의 데이터를 저장하는 공간 
           ** 데이터형이 없다 : 값을 대입하면 자동으로 인식 
           예) 
              let a=10 => a:int , a:number
              let a=10.5 => a:double , a:number : 정수,실수:숫자
              
              let a='Hello' 
              let a="Hello" => string인식 
              
              let a=["aaa","bbb"] => array
              let a={"name":"홍길동",age:20} => object 
                    ----------------------- 객체
                       name / age : 멤버변수 => a.name,a.age
                       => JSON 
              var / let : 변수 => 값을 변경이 가능  
              ----------
                    : 블록을 벗어나면 바로 사라진다 (사용범위 명확하다)
              : scope : 사용범위 명확하지 않다 => 메모리 누수현상 발생
              const  : 상수 => 값을 변경 할 수 없다 
                => 서버에서 값을 받은 경우 => final
              ----------------------------------------------
              단점 
                => 데이터형 확인이 어렵다 
                   let a=10
                   a=""
                   a=[]
                   a={}
                   가독성이 떨어진다 
                   ------------- 보완 : 데이터 지정 (타입스크립트)
                                                ------------ 자바스크립트로 변경
                   let a:string="" let a:number=10 ...
              => 자바스크립트에서 제공하는 데이터형 
                 1) 기본형 : number , string , boolean , null
                           undifined , bigint (long)
                 2) 참조형 : object , array , function 
                    => function을 데이터형으로 취급 
                    => 매개변수로 사용이 가능 
                 => 데이터형을 확인 : typeof 
               => 형변환 
                  숫자 변환 : Number("10") => 10
                            parseInt("10") => 10
                  문자 변환 : String(10) => "10"
                  논리 변환 : Boolean(0) => false
                            Boolean(1) => true
                            0,0.0,null => 아닌 경우는 true
                 *** 서버 연결 (***********) 
                     List =======> [] (배열)
                     VO   =======> {} (객체)
                     
                                  | 연결하는 기능이 없다 (NodeJS만 가능)
             자바스크립트 =============================== 오라클 
             
             자바스크립트 ============= 자바 ============= 오라클 
                                    ----- MVC (Spring,Spring-Boot)
                                    
             => Vue = SpringBoot
             => React = SpringBoot  ==> MSA (CDN)
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 // 주석 처리 (한줄 주석) 
 /*
     여러줄 주석 
 */
 // main => 자동으로 실행되는 함수 => 시작 함수 
 window.onload=function(){
	 /*
	    프로그램에 필요한 변수 선언 
	    변수 선언 : var / let(ES6 권장) / const
	    => 식별자 
	       = 알파벳으로 시작(대소문자 구분)
	       = 숫자 사용이 가능 (앞에 사용 금지)
	       = 공백이 있으면 안된다 
	       = 문자 길이는 상관없다 
	       = 키워드 사용 금지 
	       = 특수문자 : _ , $
	    이전 => ;을 사용
	    let a=10;
	    최근 => ;을 생략이 가능 
	    let a=10
	    
	    = 출력 
	      1. console.log(변수) => 개발자 도구 (명령프롬프트)  
	         System.out.println()
	      2. document.write(출력) =>  브라우저에 출력 
	      3. alert() : 팝업 
	      4. 원하는 태그안에 값을 주입 : innerHTML
	 */
	 // 1. 데이터형 확인 : typeof
	 let a=10
	 let b=10.5
	 let c="Hello JavaScript"
	 let d='Hello JavaScript' // string 
	 let e=[1,2,3,4,5]
	 let f={"name":"홍길동","age":20}
	 let g=function(){}
	 let m // undifined => 값이 없는 경우 
	 let k=true
	 
	 console.log("a="+a+",type="+ typeof a)
	 console.log("b="+b+",type="+ typeof b)
	 console.log("c="+c+",type="+ typeof c)
	 console.log("d="+d+",type="+ typeof d)
	 console.log("e="+e+",type="+ typeof e)
	 console.log("f="+f+",type="+ typeof f)
	 console.log("g="+g+",type="+ typeof g)
	 console.log("m="+m+",type="+ typeof m)
	 console.log("k="+k+",type="+ typeof k)
	 
	 // 변수값 변경 
	 let aa="Hello JavaScript"
	 aa="Hello JavaScript ES6"
	 console.log("aa="+aa) // 문자열 결합
	 
	 var bb=10
	 var bb=20
	 console.log("bb="+bb)
	 // let변수는 var의 단점 보완 => 권장 
	 // 단점 => 한개 변수로 데이터형 변경이 가능 => 가독성 (데이터형 파악이 어렵다)
	 let cc=10
	 cc="Hello"
	 cc='Hello JavaScript'
	 cc=[1,2,3,4,5]
	 cc={"name":"hong","age":10}
	 cc=true
	 cc=function(){}
	 
	 const dd=10;
	 dd="Hello JS!!"
	 console.log("dd="+dd)
 }
</script>
</head>
<body>

</body>
</html>