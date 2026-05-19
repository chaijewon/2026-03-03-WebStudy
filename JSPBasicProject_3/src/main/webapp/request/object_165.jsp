<%--
    public void _jspService(
        HttpServletRequest request, 
        HttpServletResponse response)
    {
        PageContext pageContext;
        HttpSession session = null;
        ServletContext application;
        ServletConfig config;
        JspWriter out = null;
        Object page = this;
        Exception exception  ==> 9개 지원 
        
        => 사용자 요청시마다 호출되는 메소드 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     *** 새로고침/화면 이동 => request는 초기화 => 한번 사용후에 버림 
     내장 객체 (내부 객체) : 미리 객체 생성되어 있다 
     public void _jspService(
        HttpServletRequest request, ===> 유지하는 방법 (forward)
        HttpServletResponse response)
     {
        
        
        --------------------
          JSP에서 소스 코딩 => JSP => _jspService(){완성}
          --- 파일(X) --- 메소드를 완성  
        -------------------
     }
     
     request 
       = 사용자 요청 정보 
       = 서버 정보 
       = 브라우저 정보 
       = 추가 정보 
     response 
       = 이동 정보 
       = 응답 정보 
     session 
       = 상태 유지 => 데이터 유지 (로그인 => 사용자 저장 , 장바구니)
       = 서버에 저장 
     out 
       = 출력 정보 
     application 
       = 서버 정보 / 자원 정보 
     pageContext 
       = include / forward / 내장 객체 읽기 
     ----------------
     config : web.xml을 이용해서 설정시에 사용 
              ------- 등록된 데이터 읽기 => 경로명 / username / password 
     exception : try ~ catch 
     page : this 
     ----------------
     Cookie => 저장요청시마다 => 메모리 할당 (브라우저에 저장)
               최근 방문 / JWT 
               
     
     
     request객체 => 가장 많이 사용되는 객체 
     1) 클래스 
        HttpServletRequest 
        1. 서버 정보 
           getServerName() : 서버의 이름 출력 
           getProtocol() : 사용된 프로토콜 
           getMethod() : GET / POST 
           getRequestURL()
           getRequestURI()
           getContextPath()
     http://localhost /JSPBasicProject_3/jsp3/object_165.jsp => URL
     ---------------- -------------------------------------- 
        서버 정보             클라이언트 요청 정보 
     1) getServerName() : localhost 
     2) getProtocol() : http => 80
     3) getRequestURL()
     4) getRequestURI() : /JSPBasicProject_3/jsp3/object_165.jsp
     5) getContextPath() : /JSPBasicProject_3
     
        브라우저 정보 => log파일
     1) 사용자의 IP : getRemoteAddr() ***** 
     2) 사용자의 PORT : getPort() 
     
        사용자 요청 정보 
     1) 단일값 : text / radio / password / textarea / select 
               file / date  
               getParameter() ********
     2) 다중값 : checkbox => multiple
               getParameterValues() ********
     3) 한글 => decode : setCharecterEncoding() *****
     -----------------------------------------------------
        추가 정보 
         => setAttribute() / getAttribute() *****
     
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>request => 서버 정보</h1>
  <ul>
    <li>서버 이름:<%=request.getServerName() %></li>
    <li>사용 프로토콜:<%=request.getProtocol() %></li>
    <li>URL:<%=request.getRequestURL() %></li>
    <li style="color:red">URI:<%=request.getRequestURI() %></li>
    <li style="color:red">ContextPath:<%=request.getContextPath() %></li>
  </ul>
  <h1>request => 브라우저 정보</h1>
  <ul>
    <li style="color:blue">클라이언트 IP:<%= request.getRemoteAddr() %></li>
    <li>클라이언트 PORT: <%=request.getServerPort() %></li>
  </ul>
  <h1>request => 사용자 요청 정보</h1>
  <ul>
     <li style="color:red">단일값 : getParameter()</li>
     <li style="color:red">다중값 : getParamterValues()</li>
     <li style="color:red">한글변환: setCharacterEncoding()</li>
  </ul>
  <h1>데이터 추가 정보(MVC)</h1>
  <ul>
    <li style="color:pink">데이터 추가 : setAttribute()</li>
    <li style="color:pink">데이터 읽기 : getAttribute()</li>
  </ul>
</body>
</html>
<%--
    }
--%>