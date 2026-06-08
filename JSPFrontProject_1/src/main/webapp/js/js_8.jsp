<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      변수 : let(변수) / const (상수) => 자동으로 데이터형 설정 
      연산자 : === , !=
             => 데이터형이 다른 경우에는 비교가 불가능 
             비교연산자 : 숫자 / 문자 / 날짜 
             + : 문자열 가능 / 덧셈 
             / : 정수 / 정수 = 실수 
      제어문 : if / if ~ else 
             반복문 
             -----
               ***일반 for(let i=0;i<10;i++) 
               for in / for of 
               ------   ------- 실제 데이터값 
               인덱스 번호  
               => 함수화 => Jquery / Vue / React => 배열 / JSON
                  **map() => 새로운 배열을 생성 
                  **forEach() => 일반 반복문 
       배열 : 관련된 데이터를 모아서 관리 영역 => Object형 
             형식) 
                  [값,값...] => 데이터형이 다를 수 있다  
       객체(JSON)
       DOM => HTML태그 제어 ( CSS 선택자 사용 )
              DOMScript ====> Jquery 3 / Jquery 4 
                |=> VueJS / ReactJS
                            = Redux / TanStackQuery / NextJS    
                    = Vuex / Pinia 
       이벤트 처리 
       -------- 
       
       
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 800px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	// $(function(){}) : Jquery 
	// mounted() : Vue
	// componentDidMount() : react => hooks => useEffect()
	// 자바 main하고 동일한 함수 => 자동 호출되는 함수 
	// 1. 배열 선언 
	// [{},{},{}]
	let arr=[];
	axios.get('js_8.do')
	     .then(response=>{
	    	 console.log(response)
	    	 let html=''
	    	 let data=response.data
	    	 data.map((emp)=>{
	    		 html+='<tr>'
	    		     +'<td>'+emp.empno+'</td>'
	    		     +'<td>'+emp.ename+'</td>'
	    		     +'<td>'+emp.job+'</td>'
	    		     +'<td>'+emp.dbday+'</td>'
	    		     +'<td>'+emp.dname+'</td>'
	    		     +'<td>'+emp.loc+'</td>'
	    		     +'</tr>'
	    	 })
	    	 let tbody=document.querySelector("tbody")
	    	 // DOM 
	    	 tbody.innerHTML=html
	    	 /*
	    	     1. document.write() 
	    	     2. alert() 
	    	     3. innerHTML => 지정된 태그에 값을 첨부 
	    	        Jquery => html() 
	    	     4. VueJS는 태그에서 처리 => 값을 서버에서 받으면 자동으로 HTML 적용(양방향)
	    	        React는 HTML을 만들어서 추가 : 단방향 
	    	        
	    	     1) 배열 [] 
	    	     2) 객체 : JSON {}
	             3) 함수 
	             4) DOM => 원하는 태그를 가지고 온다 
	                querySelector("tbody") 
	             5) 이벤트 처리 방식
	             ------------------------------
	             기타 
	               = 내장 함수 / 브라우저 내장 함수 
	             -----------------------------라이브러리화 : Jquery 
	            	   
	    	 */
	     })
	
}
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3 class="text-center">사원 목록</h3>
      <table class="table">
        <thead>
          <tr class="danger">
            <th>사번</th>
            <th>이름</th>
            <th>직위</th>
            <th>입사일</th>
            <th>부서명</th>
            <th>근무지</th>
          </tr>
        </thead>
        <tbody>
         
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>