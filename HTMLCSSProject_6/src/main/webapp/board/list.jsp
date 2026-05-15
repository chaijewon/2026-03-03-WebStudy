<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ page import="java.text.*" %>
<%
    // 출력할 데이터 
    // 1. 사용자가 요청한 데이터 받기 => page => 한파일안에서 데이터 변경 => 동적 페이지
    // HTML : 정적페이지 (데이터 변경이 안된다)
    // 동적 페이지 => JSP / JavaScript (다른 서버에 연결이 안된다)
    // Ajax / Vue / React => 데이터를 받아서 화면에 출력 => View
    // 자바 => 1. 데이터베이스 연동 , 2. JSON 생성이 가능 , 3. 브라우저로 전송 
    // 웹에서 전송하는 데이터는 무조건 문자열이다 
    String strPage=request.getParameter("page");
    // request : 내장 객체 => 이미 객체 생성이 되어 있다 
    // HttpServletRequest => 사용자가 보낸 데이터를 받는 경우 
    // 사용자 브라우저 정보를 가지고 있다 
    // => 첫번째 수행은 페이지를 보낼 수 없다 
    if(strPage==null) // default 페이지 설정 
    	strPage="1";
    /*
          list.jsp =============> null
          list.jsp?page = =======> ""
          list.jsp?page=1 ======> 1
          
          URL 주소 확인 
          OUTPUT 확인 
          Source 확인 
          ------------- 
    */
    // 현재 페이지로 설정 
    int curpage=Integer.parseInt(strPage);
    //System.out.println(curpage);
    // 오라클에서 데이터 읽기 
    BoardDAO dao=new BoardDAO();
    List<BoardVO> list=dao.boardListData(curpage);
    // 총페이지 
    int count=dao.boardRowCount();
    int totalpage=(int)(Math.ceil(count/10.0));
    count=count-((curpage*10)-10);
    
    String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    /*
        숫자 : DecimalForamt / 날짜 : SimpleDateFormat
        ==> TO_CHAR(regdate,'yyyy-mm-dd')
        ==> TO_CHAR(10000,'#,###,###')
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
  margin: 0px auto; /* 가운데 정렬 */
  width: 800px;
}
h3 {
  text-align: center;
}
.board-wrap{
  background: #fff;
  padding: 30px;
  border-radius: 18px;
  box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}
.btn-success{
  border: none;
  border-radius: 30px;
  padding: 8px 18px;
  font-weight: bold;
  transition:all 0.3s ease;
}
.btn-success{
  transform:tranlateY(-2px);
  box-shadow: 0 5px 15px rgba(0,206,201,0.4);
}
.table {
  background: white;
  border-radius: 12px;
  overflow: hidden;
}
.table tbody tr.a:hover{
  background: #f1f5ff;
  transform:scale(1.01);
}
.sub {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>
</head>
<body>
   <div class="container">
    <div class="board-wrap">
     <h3>자유 게시판 (JDBC=CRUD)</h3>
     <div class="row">
	     <table class="table">
	       <tbody>
	         <tr>
	           <td>
	            <a href="insert.jsp" class="btn btn-sm btn-success">새글</a>
	            <%--
	                 btn => link , 입체효과 
	                 btn-xs / btn-md / btn-sm / btn-lg 
	                 btn-danger(red) / btn-success(green) / 
	                 btn-warning(주황색) 
	                 btn-info(cyan) / btn-primary(blue) / 
	                 btn-default(gray) 
	             --%>
	           </td>
	         </tr>
	       </tbody>
	     </table>
     </div>
     <div class="row" style="margin-top: 10px">
     <table class="table">
       <thead>
         <tr class="danger">
           <th width=10% class="text-center">번호</th>
           <th width=45% class="text-center">제목</th>
           <th width=15% class="text-center">이름</th>
           <th width=20% class="text-center">작성일</th>
           <th width=10% class="text-center">조회수</th>
         </tr>
       </thead>
       <tbody>
             <%-- for으로 10개씩 출력 --%>
	         <%
	            for(BoardVO vo:list)
	            {
	         %>
	                 <tr class="a">
			           <td width=10% class="text-center"><%=count-- %></td>
			           <td width=45%>
			             <%-- 화면 이동 --%>
			             <a href="detail.jsp?no=<%=vo.getNo()%>" class="sub"><%= vo.getSubject() %></a>
			             &nbsp;
			             <%
			                // 오늘 날짜
			                if(today.equals(vo.getDbday()))
			                {
			             %>
			                   <sup><img src="new.gif"></sup>
			             <%
			                }
			             %>
			           
			           </td>
			           
			           
			           <td width=15% class="text-center"><%= vo.getName()%></td>
			           <td width=20% class="text-center"><%=vo.getDbday() %></td>
			           <td width=10% class="text-center"><%=vo.getHit() %></td>
			         </tr>  
	         <%
	            }
	         %>
       </tbody>
     </table>  
     </div>
     <div class="row text-center" style="margin-top: 20px">
       <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-warning">이전</a>
       <%=curpage %> page / <%=totalpage %> pages
       <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-warning">다음</a>
     </div>
    </div>
   </div>
</body>
</html>


