<%@page import="com.sist.vo.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
   List<DataVO> list=new ArrayList<DataVO>();
   list.add(new DataVO("홍길동",10));
   list.add(new DataVO("이순신",2));
   list.add(new DataVO("춘향이",20));
   list.add(new DataVO("심청이",15));
   list.add(new DataVO("김두한",13));
   list.add(new DataVO("강감찬",30));
   list.add(new DataVO("박문수",24));
   //request.setAttribute("list", list); // JSTL사용이 가능 
%>
<%--
   <c:forEach> 
   <c:if> 
   <c:choose>
   <c:redirect> 
   <c:set>
   <c:out> 
   
   <fmt:formatDate> 
   <fmt:formatNumber> 
   
   EL : 문자열 결합  += , + , % , / 
        == , != , < , > , <= , >=
        empty / 삼항연산자 
        
        requestScope / sessionScope 
 --%>
<c:set var="list" value="<%=list %>"/>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['이름', '로그인 횟수'],
          <c:forEach var="vo" items="${list}">
          ['<c:out value="${vo.word}"/>', <c:out value="${vo.count}"/>],
          </c:forEach>
        ]);

        var options = {
          title: '로그인 횟수 통계'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>

