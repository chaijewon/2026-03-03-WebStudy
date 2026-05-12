<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
     JSP (Java Server Page) : 서버에서 실행되는 파일 
     장점)
           자바 + HTML 
           ---  -----
            |     |
            -------
               |
            자바 : <% %>
                 ------- 스크립트릿 <% %> : 일반 자바 
                            변수 선언 / 메소드 호출 / 제어문 
                 ------- 표현식 <%= %>
                         => println() => 화면 변수값 출력 
                 ------- 선언식 <%! %>
                         => 사용 빈도가 없다 , 멤버변수 / 메소드 선언 
      HTML : 정적 페이지 (데이터 변경이 불가능) 
      JSP  : 동적 페이지 (데이터 변경이 변경) => ASP , PHP , DJango 
      
      동작 
        브라우저에서 요청 : URL => sawon.jsp
        tomcat 
          |
        자바파일로 변경 : Servlet
          | 컴파일 
        .class
          |
        실행 => HTML만 메모리에 저장 => 브라우저에서 읽어간다 
        
      지시자 : page => 파일 정보 
             => 속성 : import => 다른 파일 불러온다
             
      1. 자바에서 데이터 수집 
      2. HTML이용해서 데이터를 출력 
      3. CSS를 이용해서 화면 UI
 --%>
<%
   EmpDAO dao=new EmpDAO();
   List<EmpVO> list=dao.empListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
  /* 가운데 정렬 : Box-Model */
  margin: 50px auto;
  /* 라인선을 통합 : 한줄 출력*/
  border-collapse: collapse; 
  width: 700px;
  border-radius: 8px; /* top right bottom left */
  /* border-radius: 8px 8px 8px 8px */
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  /* x , y , blur color */
}
thead {
  background-color: #4F46E5;
  color: white;
}
th,td {
  /* 글자의 간격 조절 */
  padding: 12px 16px;
  text-align: left
  /* 정렬 left/reght/center */
}
tbody tr{
	border-bottom: 1px solid #eee;
}
tbody tr:hover{
 background-color: #f5f7ff;
}
/*
    nth-child(2n) / nth-child(2n+1)
           ------- even      ------ odd
*/
tbody tr:nth-child(even) {
  	background-color: #fafafa;
}

tbody tr:last-child {
	border-bottom: none;
}
</style>
</head>
<body>
   <table>
     <thead>
       <tr>
         <th>사번</th>
         <th>이름</th>
         <th>직위</th>
         <th>입사일</th>
         <th>급여</th>
       </tr>
     </thead>
     <tbody>
      <%
        for(EmpVO vo:list)
        {
      %>
	       <tr>
	         <td><%= vo.getEmpno() %></td>
	         <td><%= vo.getEname() %></td>
	         <td><%= vo.getJob() %></td>
	         <td><%= vo.getDbday() %></td>
	         <td><%= vo.getSal() %></td>
	       </tr>
       <%
        }
       %>
       
     </tbody>
   </table>
</body>
</html>