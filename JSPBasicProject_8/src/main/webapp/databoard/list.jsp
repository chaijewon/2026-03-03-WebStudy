<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    DataBoardDAO dao=DataBoardDAO.newInstance();
    List<DataBoardVO> list=dao.databoardListData(curpage);
    int totalpage=dao.databoardTotalPage();
    // 이전 / 다음
    /*
       cos.jar : upload라이브러리 
         => 파일명 갱신이 된다 
         => tomcat 9.0
            ------------- javax.http 
         => tomcat 10 
            ------------- jakarata.http
    */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container" style="margin-top: 20px">
    <div class="row" style="width: 800px;margin: 0px auto">
      <table class="table">
        <tr>
          <td>
           <a href="../main/main.jsp?mode=5" class="btn btn-sm btn-danger">새글</a>
          </td>
        </tr>
      </table>
      <table class="table">
        <tr class="success">
          <th width=10% class="text-center">번호</th>
          <th width=45% class="text-center">제목</th>
          <th width=15% class="text-center">이름</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
        </tr>
        <%
           for(DataBoardVO vo:list)
           {
        %>
                <tr>
		          <td width=10% class="text-center"><%=vo.getNo() %></td>
		          <td width=45%><%=vo.getSubject() %></td>
		          <td width=15% class="text-center"><%=vo.getName() %></td>
		          <td width=20% class="text-center"><%=vo.getDbday() %></td>
		          <td width=10% class="text-center"><%=vo.getHit() %></td>
		        </tr>
        <%
           }
        %>
      </table>
    </div>
    <div class="row text-center" style="margin-top: 20px">
      <a href="#" class="btn btn-sm btn-primary">이전</a>
       <%=curpage %> page / <%=totalpage %> pages
      <a href="#" class="btn btn-sm btn-primary">다음</a>
    </div>
  </div>
</body>
</html>