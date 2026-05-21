<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
      11장 데이터베이스 / 12장 Cookie / Session / 13장 파일 업로드 => JSP
      -------------------------- Spring / String-Boot
      JSP 장점 / 단점 
       X=> 스트립트 <% %> <%= %>
       default => 지시자 page : contentType / import / errorPage 
       => 내장 객체 
          request / response / application / session
                              ------------ JSP에서만 
       => 자바빈즈 => VO (getter/setter)
       => jsp 액션 태그
          <jsp:include>
          
       ------------------------------------------------------
       | DBCP 
         DataBase Connection Pool
                  ----------- 연결 부분 
         Pool => 저장 공간 
         => DB연결을 미리 여러개 만든후에 재사용하는 기술 
         1. DB연결은 생성 비용이 크다 
            요청마다 새로 Connection을 생성 => 성능이 떨어진다 
            Connection객체가 많이 생성되면 메모리 누수현상이 많다 
            Connection => 제어 
            ------------------ DDOS => 서버가 부하가 많아서 종료 
           
            1. Connection 제한 => 재사용 
            2. 쉽게 서버 다운이 안되게 만든다 
            3. 연결하는 시간소요를 방지 
            4. 일반적으로 웹 프로그램의 일반화 
         => getConnection만 변경 => 연결된 주소값 얻어서 처리 
         
         동작 순서 
         프로그램 시작과 동시에 Connection Pool을 만든다 
                          ---------------- 톰캣
         | 미리 연결된 Connection이 저장된다 
         사용자 요청 => Pool안에서 Connection 주소를 가지고 온다 
         사용자 => Connection 사용 
         작업이 종료 => Connection을 닫는 것이 아니라 => Pool로 반환 (재사용) 
         conn.close() => 닫기(X) , 반환(O)
         
         설정 
           maxActive : 동시에 사용할 수 있는 Connection 갯수 (8)
           maxIdle : 항상 유지하는 최소 Connection (8)
           maxWait : 반환까지 기다리는 시간 
        ---------------------  데이터베이스 성능 최적화 기술 
 --%>
<%
    // 자바에서 오라클에 있는 데이터를 가지고 온다 
    EmpDAO dao=EmpDAO.newInstance();
    List<EmpBean> list=dao.empListData();
    // 가지고 온 데이터를 HTML을 이용해서 출력 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>사원 목록</h1>
   <table border=1 bordercolor=black width=500>
     <tr>
       <th>사번</th>
       <th>이름</th>
       <th>직위</th>
       <th>입사일</th>
       <th>급여</th>
     </tr>
     <%
        for(EmpBean vo:list)
        {
     %>
             <tr>
		       <td><%= vo.getEmpno() %></td>
		       <td><%= vo.getEname() %></td>
		       <td><%= vo.getJob() %></td>
		       <td><%=vo.getDbday() %></td>
		       <td><%=vo.getSal() %></td>
		     </tr>
     <%
        }
     %>
   </table>
</body>
</html>