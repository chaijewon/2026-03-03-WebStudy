<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      논리 연산자  : && , ||
      && => 직렬 연산자 => 두개의 조건이 true일때 true 
      || => 병렬 연산자 => 조건 둘중에 한개 이상 true일때 true
         (조건) &&(||) (조건) 
         =====    ====
           |       |
           ---------
              | 
             처리 
        =======================
                     &&    ||
        =======================
        true true    true  true
        =======================
        true false   false true
        =======================
        false true   false true
        =======================
        false false  false false  => 로그인 (id && pwd)
        =======================
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let i=(6<7) && (6==7)
	console.log("i="+i)
	let j=(6<7) || (6==7)
	console.log("j="+j)
	
	/*
	  대입 연산자 
	  = , += , -= 
	  
      let k=10
      k+=10 ======> k=k+10 20
      k-=10 ======> k=k-10 0
	*/
	let k=10
	k+=10 // k=20
	console.log("k="+k)
	k-=10 // k=10
	console.log("k="+k)
	
	let g=(6%2==0)?"짝수":"홀수"
	console.log("g="+g) // => if~else
		
	let h=10/0
	console.log("h="+h)  // Infinity => 0으로 나눈 경우 
	/*
	  1. 연산처리가 불가능 : null, 값이 없는 경우 
	                    => 서버 / 입력값 
	                    = NaN (산술연산) => 장바구니 총액 
	  2. Infinity => 0으로 나눈 경우 
	  3. 변수의 초기값이 없는 경우 : undifined 
	  4. 정수 / 정수 = 실수 
	  5. HTML에 입력값을 가지고 오는 경우 : string => Number(),parseInt()
	  6. 단점 : 서버를 연결할 수 없다 => 서버를 연결할 수 있는 라이브러리 
	                               => ajax / axios
	  7. 같다 / 같지 않다 
	     ===   !==
	  나머지는 자바와 동일             
	*/
}
</script>
</head>
<body>

</body>
</html>