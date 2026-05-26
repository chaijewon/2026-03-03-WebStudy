<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
     if(조건문) 
     {
        조건문이 true일때 처리 
     }
     
     <c:if test="조건문">
       조건문이 true일때 처리 
     </c:if>
     
     단점 : <c:else>가 없다 
     단일 조건문만 있다 
     
     
     MVC => 자바 / HTML을 분리 
            JSP에서는 자바를 사용하면 안된다 <% %> <%= %>
                    ------------------------------
            <%= %> : ${} => EL 
            <% %>  : JSTL 
                     ----- 메소드 호출 fn:
            ----- 메소드 호출 / 제어문 / 연산자
                             ------------- <c:forEach> <c:if> ...
     --------------------------------------------
     MVC 
        Model : <% %> => 내용 => 일반 자바 
        View  : 순수하게 자바없이 출력 
        Controller  : Model / View 연결하는 역할 
        
        JSP로 코딩 => 확장성이 없다 => 재사용도 안된다 => 한번 사용후 폐기 
        --------- 일반 홈페이지 / 작은 단위 프로그램 
        --------- 파일 자체 (보안의 문제)
        MVC => 자바로 되어 있다 (확장성) => 재사용이 가능 
            => 보안이 좋다 => .java => .class
            
        => if / for / switch
           |     |      |
                      <c:choose>
               <c:forEach>
         <c:if> 
     --------------------------------------------
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Java 조건문</h1>
  <%
     for(int i=1;i<=10;i++)
     {
        if(i%2==0)
        {
  %>
          <%=i %>&nbsp;
  <%
        }
     }
  %>
  <h1>JSTL 조건문</h1>
  <c:forEach var="i" begin="1" end="10">
    <c:if test="${i%2==0 }">
      ${i }&nbsp;
    </c:if>
  </c:forEach>
  <h1>Java 다중 조건문</h1>
  <%
     int star=3;
  %>
  <%
     if(star==0)
     {
  %>
       <span style="color:orange;">☆☆☆☆☆</span>
  <%
     }
     else if(star==1)
     {
  %>
       <span style="color:orange;">★☆☆☆☆</span>
  <%
     }
     else if(star==2)
     {
  %>
       <span style="color:orange;">★★☆☆☆</span>
  <%
     }
     else if(star==3)
     {
  %>
        <span style="color:orange;">★★★☆☆</span>
  <%
     }
     else if(star==4)
     {
  %>
        <span style="color:orange;">★★★★☆</span>
  <%
     }
     else if(star==5)
     {
  %>
        <span style="color:orange;">★★★★★</span>
  <%
     }
  %>
  <h1>JSTL 다중 조건문:선택문</h1>
  <c:set var="star" value="6"/>
  <c:choose>
    <c:when test="${star==0 }"><span style="color:orange;">☆☆☆☆☆</span></c:when>
    <c:when test="${star==1 }"><span style="color:orange;">★☆☆☆☆</span></c:when>
    <c:when test="${star==2 }"><span style="color:orange;">★★☆☆☆</span></c:when>
    <c:when test="${star==3 }"><span style="color:orange;">★★★☆☆</span></c:when>
    <c:when test="${star==4 }"><span style="color:orange;">★★★★☆</span></c:when>
    <c:when test="${star==5 }"><span style="color:orange;">★★★★★</span></c:when>
    <c:otherwise>없음</c:otherwise>
  </c:choose>
  <h1>Java 선택조건문</h1>
  <%
      int sex=1;
  %>
  <%
     if(sex==1)
     {
  %>
        남자
  <%
     }
     else
     {
  %>
        여자
  <%
     }
  %>
  <h1>JSTL : 선택조건문 (else가 없다)</h1>
  <c:set var="sex" value="1"/>
  <c:if test="${sex==1 }">
    남자
  </c:if>
  <c:if test="${sex!=1 }">
    여자
  </c:if>
  <h1>JSTL : 선택조건문 (else가 없다)</h1>
  <c:choose>
    <c:when test="${sex==1 }">남자</c:when>
    <c:otherwise>여자</c:otherwise>
  </c:choose>
</body>
</html>