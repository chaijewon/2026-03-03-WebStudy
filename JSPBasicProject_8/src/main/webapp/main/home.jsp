<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.sist.dao.*" %>
<%@ page import="com.sist.vo.*" %>
<%
   //1. 사용자 보내준 값 받기 
   //2. 데이터베이스 연결 
   //3. 데이터를 읽기 
   String strPage=request.getParameter("page");
   if(strPage==null)
	   strPage="1";
   int curpage=Integer.parseInt(strPage);
   FoodDAO dao=FoodDAO.newInstance();
   List<FoodVO> list=dao.foodListData(curpage);
   int totalpage=dao.foodTotalPage();
   
   // 블록별로 (데이터가 많은 경우) = 크롤링한 데이터 
   int startPage=((curpage-1)/10*10)+1; // 1(curpage:1~10)  11  21 
   int endPage=(((curpage-1)/10*10))+10;// 10(curpage:1~10) 20 30
   if(endPage>totalpage)
	   endPage=totalpage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 960px;
}
p{
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="container" style="margin-top: 20px">
    <div class="row">
      <%
         for(FoodVO vo:list)
         {
      %>
             <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="<%=vo.getPoster() %>" style="width:240px;height: 150px;object-fit:cover">
			        <div class="caption">
			          <p><%=vo.getName()%></p>
			        </div>
			      </a>
			    </div>
			  </div>
      <%
         }
      %>
    </div>
    <%--
        1. 목록 / 상세보기 
        2. 페이징 
        3. CRUD(게시판 , 댓글) => JSP / Spring / SpringBoot
     --%>
    <div class="row text-center" style="margin-top: 10px">
      <ul class="pagination">
       <%
         if(startPage>1) // 1 11-1 => 10
         {
       %>
        <li><a href="main.jsp?page=<%=startPage-1%>">&laquo;</a></li>
      <%
         }
      %>
        <%
           for(int i=startPage;i<=endPage;i++)
           {
        %>
             <li><a href="main.jsp?page=<%=i%>"><%=i %></a></li>
        <%
           }
        %>
        <%
          if(endPage<totalpage)
          {
        %>
        <li><a href="main.jsp?page=<%=endPage+1%>">&raquo;</a></li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</body>
</html>