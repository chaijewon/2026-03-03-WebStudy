<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
    자바 / HTML 분리 
    <% %> <%= name%> => ;을 사용하면 안된다 
      |      | 출력 => System.out.println();
    자바 소스 
    => 자바 문법과 동일 => 문장 ; 
 --%> 
<%
   //1. 자바에서 화면에 출력할 데이터를 가지고 온다 
   FoodDAO dao=new FoodDAO();
   List<FoodVO> list=dao.foodListData(1);
   int totalpage=dao.foodTotalPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 
     화면 간격 조절 
     밖 => margin 
          좌우 : margin-left margin-right
                -----------
          상하 : margin-top margin-bottom 
                ----------
          간단한 형식 
          ---------
           margin: () () () () 
                    |  | |   |
                            left
                         bottom
                   top right  ===> 시계방향 
     안 => padding 
     선 => border 
 -->
<style type="text/css">
 .container {
   margin-top: 50px;
 }
 .row {
   /* 화면에 출력 */
   margin: 0px auto;
   width:960px;
 }
 p {
     overflow: hidden;
     white-space: nowrap;
     text-overflow: ellipsis;
 }
</style>
</head>
<body>
  <div class="container"><!-- 전체 영역 -->
    <div class="row"><!-- 출력하는 영역 -->
    <%
       for(FoodVO vo:list)
       {
    %>
      <div class="col-md-3"> <!-- 숫자합 12가 되면 자동으로 다음줄로 내려간다 -->
	    <div class="thumbnail">
	      <a href="#">
	        <img src="<%=vo.getPoster() %>" alt="" style="width:240px;height: 150px">
	        <div class="caption">
	          <p><%=vo.getName() %></p>
	        </div>
	      </a>
	    </div>
	  </div>
	<%
       }
	%>
    </div>
    <div class="row text-center">
     <ul class="pagination">
       <li><a href="#">&laquo;</a></li>
       <li><a href="#">1</a></li>
       <li><a href="#">2</a></li>
       <li><a href="#">3</a></li>
       <li><a href="#">4</a></li>
       <li><a href="#">5</a></li>
       <li><a href="#">&raquo;</a></li>
     </ul>
    </div>
  </div>
</body>
</html>







