<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
   List<String> names=new ArrayList<String>();
   names.add("홍길동");
   names.add("심청이");
   names.add("박문수");
   names.add("춘향이");
   names.add("이순신");
   
   List<String> sexs=new ArrayList<String>();
   sexs.add("남자");
   sexs.add("여자");
   sexs.add("남자");
   sexs.add("여자");
   sexs.add("남자");
   
%>
<c:set var="list" value="<%=names %>"/>
<c:set var="sexs" value="<%=sexs %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Java 구구단</h1>
  <table border=1 bordercolor=black width=560>
    <tr>
      <%
         for(int i=2;i<=9;i++)
         {
      %>
            <th><%=i+"단" %></th>
      <% 
         }
      %>
    </tr>
    <%
        for(int i=1;i<=9;i++)
        {
    %>
            <tr>
    <%
        	for(int j=2;j<=9;j++)
        	{
    %>
               <td><%= j+"*"+i+"="+(j*i) %></td>
    <%
        	}
    %>
            </tr>
    <%
        }
    %>
  </table>
  <h1>JSTL 구구단</h1>
  <table border=1 bordercolor=black width=560>
    <tr>
      <%-- step="1" 이면 생략이 가능
           단점 : 감소는 할수 없다 step="-1" (사용이 불가능)
       --%>
      <c:forEach var="i" begin="2" end="9">
         <th>${ i+="단" }</th>
      </c:forEach>
    </tr>
    <c:forEach var="i" begin="1" end="9">
      <tr>
      <c:forEach var="j" begin="2" end="9">
        <td>${j }*${i }=${i*j }</td>
      </c:forEach>
      </tr>
    </c:forEach>
  </table>
  <h1>Java 이용한 for-each</h1>
  <ul>
    <%
       int i=1;
       for(String name:names)
       {
    %>
          <li><%=i%>.<%= name %></li>
    <%
          i++;
       }
    %>
  </ul>
  <h1>JSTL 이용한 for-each</h1>
  <ul>
     <%--
          var="name" items="${list }" varStatus="s"
                     배열 / 컬렉션       인덱스번호를 가지고 올때 
          List에서 값을 읽어온다 
      --%>
    <c:forEach var="name" items="${list }" varStatus="s">
      <li>${s.index+1 }.${name }</li>
    </c:forEach>
  </ul>
  <h1>Java 이용한 컬렉션 출력 (두개일 경우)</h1>
  <ul>
    <%
       for(i=0;i<names.size();i++)
       {
    %>
         <li><%=names.get(i) %>(<%=sexs.get(i) %>)</li>
    <%
       }
    %>
  </ul>
  <h1>JSTL 이용한 컬렉션 출력 (두개일 경우)</h1>
  <ul>
    <c:forEach var="name" items="${list }" varStatus="s">
      <li>${name }(${sexs[s.index] })</li>
    </c:forEach>
  </ul>
</body>
</html>