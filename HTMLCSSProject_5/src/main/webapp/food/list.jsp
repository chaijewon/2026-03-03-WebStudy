<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*" %>
<%--
     클래스가 아니고 메소드 영역이다 
     
     => 
     public class list_jsp extends HttpServlet
     {
         public void _jspInit(){} = 초기화
         public void _jspDestory(){} = 메모리 해제 
         public void _jspService() => 브라우저 전송 
         {
            out.println("<!DOCTYPE html>");
         }
     }
 --%>
<%--
    1. 사용자가 요청한 데이터를 받는다 => request.getParameter()
    2. 자바에서 데이터베이스 연결 => 화면에 출력할 데이터를 읽어 온다 
 --%>
<%
    // 자바 소스 : 모든 문법이 자바와 동일 
    FoodDAO dao=new FoodDAO();
    // 1. 사용자 보낸 데이터를 받기 
    String type=request.getParameter("type");
    if(type==null) // 전송된 데이터가 없는 경우
    {
    	type="한식";
    }
    String strPage=request.getParameter("page");
    if(strPage==null)
    {
    	strPage="1";
    }
    int curpage=Integer.parseInt(strPage);
    // 데이터 받기 시작 
    List<FoodVO> list=dao.foodListData(curpage, type);
    int totalpage=dao.foodTotalPage(type);
    // 데이터 확인 
    System.out.println("요청:"+type);
    System.out.println("페이지:"+curpage);
    System.out.println("총페이지:"+totalpage);
    System.out.println("데이터:"+list);
    /*
       URL 
         데이터를 받는 jsp
         데이터 전송 ?변수=값 
        		  ?변수=값&변수=값
        		  
         list.jsp?page=1 
                  ------
         --------  page값을 list.jsp로 보낸다
         detail.jsp?no=10
                    --
                    request.getParameter("no") => 모든 String으로 받는다
         GET 방식 
    */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
  <div class="container">
    <div class="row text-center">
      <a href="list.jsp?type=한식" class="btn btn-lg btn-danger">한식</a>
      <a href="list.jsp?type=양식" class="btn btn-lg btn-success">양식</a>
      <a href="list.jsp?type=중식" class="btn btn-lg btn-warning">중식</a>
      <a href="list.jsp?type=일식" class="btn btn-lg btn-info">일식</a>
      <a href="list.jsp?type=분식" class="btn btn-lg btn-primary">분식</a>
    </div>
    <div class="row" style="margin-top: 20px">
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
      <a href="list.jsp?page=<%= curpage>1?curpage-1:curpage%>&type=<%=type %>" class="btn btn-sm btn-warning">이전</a>
      <%=curpage %> page / <%=totalpage %> pages
      <a href="list.jsp?page=<%= curpage<totalpage?curpage+1:curpage%>&type=<%=type %>" class="btn btn-sm btn-warning">다음</a>
    </div>
  </div>
</body>
</html>