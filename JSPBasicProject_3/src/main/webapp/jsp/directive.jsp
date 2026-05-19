<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%-- MVC에서 사용하지 않는다 : 데이터만 전송 => 데이터만 출력하면 된다 --%>
<%--
      JSP 동작 과정 (Java Server Page) : 서버에서 실행되는 자바 파일 
      --- JSP도 내부적으로는 Servlet으로 변환되어 실행 
      
      예) JSP ---- Servlet 변환 ----- 컴파일 ---- 실행 
                                             ------
                                             out.write("<html>");
                                             --------------------
                                             메모리에 저장 : 출력 버퍼
                                             => 해당 브라우저에서 읽어서 출력
     JSP 실행 단계 
     1. 클라이언트에서 요청 => 주소창 
        http://localhost/JSPBasicProject_3/jsp/a.jsp
     2. 웹서버에서 주소를 받는다 (URL주소) 
     3. a.jsp 파일을 찾는다 
        => 존재(O) / 존재(X) 
           ------  ------- 브라우저로 404 파일 전송 
           | 톰캣으로 전송  
     4. 톰캣 
        = a.jsp => class a_jsp extends HttpServlet 
                   {
                       public void _jspInit(){}
                       public void _jspDestory(){}
                       public void _jspService(): 실행시 브라우저 출력
                       {
                           -----------------
                            메모리에 저장된 HTML일 추가 
                           -----------------
                       }
                   }
        = a_jsp.class => 서블릿 파일 => 실행 
     5. 실행된 결과를 브라우저에서 읽어서 출력 
     
        => _jspInit() : 1번 실행 => web.xml => 초기화 
        => _jspService() : 요청처리 / 응답 생성 
        => _jspDestory() : 메모리 해제 
        
        브라우저 요청 : URL => 데이터 전송 
           |
         JSP 파일 확인 
           |
         JSP => Servlet변경 
           |
         Servlet 컴파일 
           |
         서블릿 객체 생성 
           |
         _jspInit() 호출 
           |
         _jspService() 
           |
        HTML 응답 
           |
        _jspDestory() 
        
        ----------------------------------
                   Servlet             JSP
        ----------------------------------
        중심        Java기반           HTML기반 
                   class        
        ----------------------------------
        화면 UI  out.write("<html>")    <html>
                CSS/JavaScript첨부가 불편  편리 
        ----------------------------------
        유지보수    어렵다              상대적으로 쉽다 
        ----------------------------------
        역할     Controller          View(화면 UI)
               HTML/Java를 연결 
        ----------------------------------
        실무 
          Servlet + JSP : MVC (SpringFramework)
        => 현재 
           SpringBoot + ThymeLeaf => 배포시 배포 파일이 작다 .jar
           SpringBoot + VueJS/ReactJS 
                        ----- CDN 
        *** 공기업 / 일부 SI에서 아직 사용중 
    JSP 학습 
    1. 동작 과정 
    2. 스크립트 : 자바 / HTML  <% %> <%= %> <%! %> 
    3. 지시자 
       page  : 파일에 대한 정보 => import / buffer / session../ contentType..
       taglib : 태그를 사용해서 자바 제어문 / 라이브러리 => 태그로 제작 
                => 태그형 구조 
       include : 특정위치 다른 JSP를 추가 => 조립식 
    4. 내장 객체 
       -------------------------------------
       request / response / session 
       out / pageContext / application 
       --------------------------------------
       config / exception /page 
    5. JSP 액션 태그 
       <jsp:forward> <jsp:include> ...
    6. Cookie 사용법 
    7. 데이터베이스 연동 : ConnectionPool
    --------------------------------------- JSP 
    8. JSTL / EL 
    9. MVC구조 
    
    ===> 지시자 : page 
         가장 많이 사용되는 지시자 => JSP 시작 코드 
         형식) <%@ page 속성="값"%>
                      -----
         속성) 
              1) language : 언어
                 <%@page language="java"%>
                 => 다른언어도 사용이 가능하게 만들려고 했는데 오라클이 인수
              2) contentType : 응답 타입 (브라우저에 알려준다) 
                 = text/html => html
                 = text/xml => xml
                 = text/plain => JSON
                 = 한글 포함 여부 확인 => charset=UTF-8 (EUC-KR)
              3) import : 자바 라이브러리 로드
                 ------- 다른 속성은 한번만 사용이 가능 
                 ------- 여러개 사용이 가능 
                 <%@ page import="java.util.*,java.io.*"%>
                                  ------------------------
                 <%@ page import="java.io.*"%>
                 <%@ page import="java.util.*"%>
              4) pageEncoding : 한글 깨짐 방지 => ?
                 사용법 : pageEncoding="UTF-8"
              5) errorPage 
                 예외발생시에 이동 페이지 
                 <%@ page errorPage="이동할 파일명"%>
 --%>
<%
    Date date=new Date();
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    String today=sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>오늘 날짜: <%=today %></h1>
</body>
</html>