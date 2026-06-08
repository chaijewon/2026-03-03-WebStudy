<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      [] => 서버에서는 ArrayList : JSONArray
      {} => 서버에서는 VO : JSONObject
      
      Object[] arr={"aaa",10,10.5,'A',true};
                                      |boolean
                                  |char
                             |double
                          |int
                     |String
      let arr=["aaa",10,10.5,'A',true];
               | let
      객체 
         {키:값} => 숫자 / 문자열
                         | "" , '' 
                  | 그냥 사용
         => 키는 멤버변수로 사용 
         => 키의 갯수가 동일하지 않을 수 있다 
         => 사용 용도 => 자바 = 자바스크립트 연동 
                   JSON은 데이터를 전송시에 주로 사용 
                   서버 = 브라우저 , 서버 = 모바일
         사용법 
         let sawon={"sabun":1,"name":"홍길동"};
         sawon.sabun
             ---
         sawon.name
             ---
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
   /*
       class Sawon
       {
	      int sabun;
	      String name,job;
       }
       Sawon sawon=new Sawon()
       sawon.sabun=1
       sawon.name="홍길동"
       sawon.job="사원"
   */
   const sawon={"sabun":1,"name":"홍길동","job":"사원"}; // 객체 표현법
   // 1ROW 
   document.write("<h1>자바스크립트 객체 표현법 (JSON)</h1>")
   document.write("사번:"+sawon.sabun+"<p>")
   document.write("이름:"+sawon.name+"<p>")
   document.write("직위:"+sawon.job+"<p>")
   document.write("<hr>")
   document.write("<h1>자바스크립트 객체 표현법 (JSON)</h1>")
   document.write("사번:"+sawon['sabun']+"<p>")
   document.write("이름:"+sawon['name']+"<p>")
   document.write("직위:"+sawon['job']+"<p>")
   document.write("<hr>")
   // 객체 배열 => 배열의 함수 
   // 객체 함수 => 
}
</script>
</head>
<body>

</body>
</html>