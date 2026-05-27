<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
   JSTL => Java Standard Tag Lib
                -------- 표준 (실무=> 사용자 정의도 가능 => JSTL)
   기본 
     -------------------------------------------------
     core   ==> prefix="c" uri="jakarta.tags.core"
       => 변수 선언 
          String name="홍길동"
          request.setAttribute("name",name)
          => <c:set var="name" value="홍길동"/> => request.setAttribute("name",name)
                    ---------- -------------
                      key          값 ==> Map 방식
       => 제어문 
           = 반복문 
             for(int i=1;i<=10;i++)
                           
             => <c:forEach var="i" begin="1" end="10" step="1">
                          -------- --------- -------- ---------
                          int i     i=1      i<=10     i++
             for(String name:list)
                           String name        list
             => <c:forEach var="name" items="${list}">
              
           = 조건문 
             if(i>10) ==> <c:if test="${i>10}">
             if(name.equals("aaa")) ==> <c:if test="${name=='aaa'}">
                                              ----- 조건문 작성
           = 다중 조건문 
             if ~ else / 다중조건문 / 선택문 
             <c:choose>
               <c:when test="조건">출력값</c:when> => if
               <c:otherwise></c:otherwise> => else
             </c:choose>
             <c:choose>
               <c:when test="조건">출력값</c:when> => if
               <c:when test="조건">출력값</c:when>
               <c:when test="조건">출력값</c:when>
               <c:when test="조건">출력값</c:when>
               <c:when test="조건">출력값</c:when>
               <c:otherwise></c:otherwise> => else
             </c:choose>
       => 화면이동 
          response.sendReidrect("list.jsp")
          <c:redirect url="list.jsp">
     -------------------------------------------------
     format ==> prefix="fmt" uri="jakarta.tags.format"
       <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd">
        => SimpleDateFormat 
        => TO_CHAR
       <fmt:formatNumber value="1234567" type="currency">
          1,234,567
        => DecimalFormat 
        => TO_CHAR
     functions ==> prefix="fn" uri="jakarta.tags.functions"
        => 자바의 String 클래스 메소드 
        fn:length() , fn:substring() , fn:trim() ....
     ------------------------------------------------------
     사용하지 않는다 : 보안 
     xml => prefix="xml" uri="jakarta.tags.xml" => Manager
     sql => prefix="sql" uri="jakarta.tags.sql" => DAO
     
     EL / JSTL => 실무 
 --%>
<%
    List<String> list=new ArrayList<String>();
    list.add("홍길동");
    list.add("심청이");
    list.add("춘향이");
    list.add("박문수");
    list.add("이순신");
    
    request.setAttribute("list1", list); // jstl / el
    session.setAttribute("list2", list); // session => Object 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>고전적인 방식 (2002)</h1>
  <ul>
   <%
      for(String name:list)
      {
   %>
         <li><%=name %></li>
   <%
      }
   %>
  </ul>
  <h1>현대적인 방식</h1>
  <%--
     var i=10
     i=10.5
     i=[]
     i={}
     i="aaa"
  --%>
  <ul>
    <%--
         items="${list}"
         request.setAttribute("list", list); // jstl / el
         => request
         session.setAttribute("list", list); // session => Object
     --%>
    <c:forEach var="name" items="${list1}"><%-- 배열 / 컬렉션 --%>
       <li>${name}</li>
    </c:forEach>
  </ul>  
  <h1>Session 값 출력</h1>
  <ul>
    <c:forEach var="name" items="${list2}"><%-- 배열 / 컬렉션 --%>
       <li>${name}</li>
    </c:forEach>
  </ul>
  <h1>조건 처리</h1>
  <%
      for(int i=1;i<=10;i++)
      {
    	  if(i%2==0)
    	  {
  %>
             <%= i %> &nbsp;
  <%
    	  }
      }
  %>
  <h1>JSTL</h1>
  <%--
        step="1" => 생략이 가능 => i+=2 => step="2"
        i-- : forEach구문은 step가 -가 없다 
        출력 용도로만 사용이 가능 
   --%>
  <c:forEach var="i" begin="1" end="10" step="1">
     <c:if test="${i%2==0 }">
       ${i } &nbsp;
     </c:if>
  </c:forEach>
  <h1>다중 조건문</h1>
  <%
     for(int i=1;i<=10;i++)
     {
    	 if(i%2==0)
    	 {
  %>
             <h3><%=i+"는 짝수입니다" %></h3>
  <%
    	 }
    	 else
    	 {
  %>
            <h3><%=i+"는 홀수입니다" %></h3>
  <% 
    	 }
     }
  %>
  <h1>JSTL</h1>
  <%--
    1. JSTL : XML 형식 
              -------
              1. 문법이 엄격하다 
              2. 문법
                 여느태그 / 닫는 태그가 동일 
                 ---------------- 독립태그도 반드시 닫는다 <input />
                 속성값은 반드시 ""
                 대소문자 구분
                 반드시 루프 태그가 존재 
                 <a>
                  <b></b>
                  <c></c>
                 </a>
                 
                 => 트리형태 => 소속 관계 명확하다 
                 <a><b><c></b></c></a> 
                 => XML은 오류
                 => 사용자 정의 태그 / 설정 파일 
                                   web.xml 
                                   server.xml
                                   ----------- xml을 문서형 데이터베이스
                 => yml , yaml ....
                 => ci/cd => yml: 들여쓰기 (파이썬)     
   --%>
  <c:forEach var="i" begin="1" end="10">
    <c:choose>
      <c:when test="${i%2==0 }">
        <h3>${ i += "는 짝수입니다"}</h3>
      </c:when>
      <c:otherwise>
        <h3>${ i += "는 홀수입니다"}</h3>
      </c:otherwise>
    </c:choose>
  </c:forEach>
  <h1>변환 : 날짜</h1>
  <%
      Date date=new Date();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
      String today=sdf.format(date);
  %>
  실제 날짜:<%=date %><br>
  오늘 날짜:<%=today %><br>
  <c:set var="date" value="<%=date %>"/>
  오늘 날짜:<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
  <h1>변환 : 숫자</h1>
  <%
      int won=1234567;
      DecimalFormat df=new DecimalFormat("##,###,###");
      String s=df.format(won);
  %>
  실제 값:<%=won %><br>
  브라우저 출력값 : <%=s %><br>
  <c:set var="won" value="1234567"/>
  변환: <fmt:formatNumber value="${won }" type="currency"/>
</body>
</html>



