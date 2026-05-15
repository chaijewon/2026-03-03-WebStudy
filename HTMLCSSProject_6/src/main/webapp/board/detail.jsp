<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    //1. 사용자 보내준 값을 받는다 ? => 사용자 요청 
    String no=request.getParameter("no");
    // detail.jsp?no=2 => POST는 감춰서 전송 
    /*
        detail.jsp로 no가 2번을 보낸다 
        request.getParameter("no") => name
        
    */
    BoardDAO dao=new BoardDAO();
    BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
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

.table {
  background: white;
  border-radius: 12px;
  overflow: hidden;
}
pre {
  white-space: pre-wrap; /* 자동 즐바꿈 */
  background: white;
  border: none;
}
</style>
</head>
<%--
     HTML => Web 사이트 => 형식이 동일 
 --%>
<body>
   <div class="container">
     <div class="board-wrap">
       <h3>내용 보기</h3>
       <div class="row">
         <table class="table">
           <tbody>
            <tr>
              <th width=20% class="text-center success">번호</th>
              <td width=30% class="text-center"><%=vo.getNo() %></td>
              <th width=20% class="text-center success">작성일</th>
              <td width=30% class="text-center"><%=vo.getDbday() %></td>
            </tr>
            <tr>
              <th width=20% class="text-center success">이름</th>
              <td width=30% class="text-center"><%=vo.getName() %></td>
              <th width=20% class="text-center success">조회수</th>
              <td width=30% class="text-center"><%=vo.getHit() %></td>
            </tr>
            <tr>
              <th width=20% class="text-center success">제목</th>
              <td colspan="3"><%=vo.getSubject() %></td>
            </tr>
            <tr>
              <td colspan="4" class="text-left" valign="top" height="200">
                <pre><%=vo.getContent() %></pre>
              </td>
            </tr>
            <tr>
              <td colspan="4" class="text-right">
                <a href="update.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-info">수정</a>
                <a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-success">삭제</a>
                <%--
                      최종 : list.jsp => insert / delete 
                            detail.jsp => update
                 --%>
                <a href="list.jsp" class="btn btn-xs btn-warning">목록</a>
              </td>
            </tr>
           </tbody>
         </table>
       </div>
     </div>
   </div>
</body>
</html>