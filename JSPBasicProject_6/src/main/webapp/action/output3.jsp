<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<%--
       JSP 액션 태그 
         => Java코드를 직접 쓰지 않고 기능을 수행하게 만드는 표준 태그 
            ------------------------
         => 액션 태그 
            <jsp:~~>
         => XML형식으로 되어 있다 
            ------
            1. 태그나 속성명 => 대소문자 구분 
            2. 태그가 열리면 반드시 닫는다 
            3. 속성값을 입력 반드시 "" 사용 
         => Java코드가 감소 
         => 재사용성이 증가 
         => 다른 JSP / Bean 연동 
         
         <jsp:useBean id="member" class="com.sist.bean.Member">
         => JSP에서 사용이 가능 => Spring / MVC에서 거의 빈도가 없다 
         => 실무 : MVC구조 사용 
         => Member member=new Member() 
         
         <jsp:setProperty name="member" property="name" value="홍길동">
                          ------------- 객체
         member.setName("홍길동")
         <jsp:setProperty name="member" property="*">
         member객체 모든 setter호출해서 값을 채운다 
         => 리플렉션  
         <jsp:getProperty name="member" property="name">
         member.getName()
         
         자바소스가 길어진다 => 방지하기 위해서 태그를 만들어서 사용 
                                       ----------------
                                       표준으로 만든 태그 => jsp액션 태그
         *** 자바소스 최대한 줄인다 
         *** 오늘 이후에는 안 나온다 => 실무에서 없다 
         
         *** 현재까지 사용되는 액션 태그 
             <jsp:include> 
             => MVC구조 적합 
             => 동적으로 변경 
             => JSP안에 다른 JSP를 첨부할때 사용 => 메인 페이지 구조 제작이 가능
         -----------------------------------------------------------
           JSP => Java + HTML 
                  ----- 소스 길어질때 사용 
           MVC(Spring) 
               => Java : Model => 순수 자바
               => HTML : View  => HTML => 태그 (JSTL/EL)
                                  <%%> <%=%> => 제거 
               => 연결  : Controller
                         => forward() 메소드 이용 
                         => Spring에서 이미 만들어져 있다 
          1. 자바빈 (javabean) => 213page
             => 단순한 클래스 : 규칙 
             => JSP -- Servlet -- DB데이터 전송 
             => 캡슐화 : private / setter / getter => lombok
             => MVC에서도 데이터를 모아서 한번에 전송 
             => 데이터베이스 컬럼과 일치 (DESC table명) 
             
          2. -----------------------------------------------
              javabean             dto              vo
          목적: JSP 표준 객체       데이터 전달 객체      불변 => 고정 
          규칙: 엄격               자유로움 => dbday 
          사용: JSP중심            -----------------------------
                                   Spring / MyBatis 
          => 최근에는 대부분 DTO (데이터를 모아서 브라우저로 보내는 목적) 
          <form> 
            |
          JSP => Bean저장 
            |
          데이터베이스 
            |
          브라우저
          
          * 데이터 저장용 클래스 (getter/setter)
          
         => 최근 : AI도입 
                 ------ AI에서 보내준 데이터를 변경 할 수 없다 
                        => VO => record(getter만 존재)
         => 로직은 없다(순수 데이터) 
         => 캡슐화 가능 / 자유롭게 변경이 가능 
 --%>
<%--
  // 전송된 데이터를 받는다 (사용자가 데이터를 전송 => 톰캣에 의해 request에 값이 담긴다) 
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String address=request.getParameter("address");
    String phone=request.getParameter("phone");
    String content=request.getParameter("content");
    // 오라클로 보낸다 / 화면 출력 
    
    MemberBean bean=new MemberBean();
    bean.setName(name);
    bean.setSex(sex);
    bean.setAddress(address);
    bean.setPhone(phone);
    bean.setContent(content);
 --%>
<jsp:useBean id="bean" class="com.sist.bean.MemberBean">
  <%-- MemberBean bean=new MemberBean();
       클래스 메모리 할당 
       id=>객체명
   --%>
   <jsp:setProperty name="bean" property="*"/>
   <%--
        name => jsp:useBean id="bean"명 동일 
        property="name" => setName()
        property="*" => 모든 setter에 값을 채운다 
        => 정수 : Integer.parseInt() / 
    --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>받은 데이터 1</h1>
  이름:<%=bean.getName() %><br>
  성별:<%=bean.getSex() %><br>
  주소:<%=bean.getAddress() %><br>
  전화:<%=bean.getPhone() %><br>
  소개:<%=bean.getContent() %>
  <br>
  나이:<%=bean.getAge() %>
  <hr>
  <h1>받은 데이터 2</h1>
  이름:<jsp:getProperty name="bean" property="name"><br>
  <%--
      <%=bean.getName() %> => bean객체의 getName()
      출력할때 사용
   --%>
  성별:<jsp:getProperty name="bean" property="sex"><br>
  주소:<jsp:getProperty name="bean" property="address"><br>
  전화:<jsp:getProperty name="bean" property="phone"><br>
  소개:<jsp:getProperty name="bean" property="content">
  <br>
  나이:<jsp:getProperty name="bean" property="age">
</body>
</html>