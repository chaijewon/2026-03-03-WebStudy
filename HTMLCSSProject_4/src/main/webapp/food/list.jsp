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
   //1-1. 사용자가 전송한 값을 받는다 (page를 보내준다)
   //웹은 모든 데이터가 String으로 들어온다 => Wrapper => 정수로 변경 
   // list.jsp?page=1 => URL뒤에 데이터를 전송 ?
   String strPage=request.getParameter("page");
   if(strPage==null) // 첫페이지 => 페이지를 선택 못하는 경우 
		 strPage="1"; // default page 
   int curpage=Integer.parseInt(strPage);
   FoodDAO dao=new FoodDAO();
   List<FoodVO> list=dao.foodListData(curpage);
   int totalpage=dao.foodTotalPage();
   
   final int BLOCK=10;
   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
   // 1 11 21....
   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
   // 10 20 30...
   if(endPage>totalpage)
	   endPage=totalpage;
   
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
       <%
          if(startPage>1) // 1 11 21 31 ....
          {
       %>
            <li><a href="list.jsp?page=<%=startPage-1%>">&laquo;</a></li>
       <%
          }
       %>
       <%
          for(int i=startPage;i<=endPage;i++)
          {
       %>
       <li <%=i==curpage?"class=active":"" %>><a href="list.jsp?page=<%=i %>"><%=i %></a></li>
       <%
          }
       %>
       
       <%
          if(endPage<totalpage)
          {
       %>
       <li><a href="list.jsp?page=<%=endPage+1%>">&raquo;</a></li>
       <%
          }
       %>
     </ul>
    </div>
  </div>
</body>
</html>







