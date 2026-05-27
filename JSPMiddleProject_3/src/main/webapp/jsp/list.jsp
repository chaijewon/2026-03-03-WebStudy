<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    //1. 사용자 요청 정보 받기 => page
    String strPage=request.getParameter("page");
    //page를 선택 못하는 경우 => 화면 실행시 
    if(strPage==null)
    	strPage="1";
    // 현재 페이지 지정 
    int curpage=Integer.parseInt(strPage);
    // 데이터베이스 연동 => 출력할 데이터를 가지고 온다 
    MusicDAO dao=MusicDAO.newInstance();
    List<MusicVO> list=dao.musicListData(curpage);
    int totalpage=10;
    
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
   margin: 0px auto;
   width:960px;
}
h3 {
  text-align: center;
}
</style>
</head>
<body>
   <div class="container">
     <div class="row">
       <h3>뮤직 Top200</h3>
       <table class="table">
         <tr class="danger">
          <th class="text-center" width=10%>순위</th>
          <th class="text-center" width=10%></th>
          <th class="text-center" width=10%></th>
          <th class="text-center" width="40%">곡명</th>
          <th class="text-center" width="30%">가수명</th>
         </tr>
         <%-- 데이터 출력 --%>
         <%
            for(MusicVO vo:list)
            {
         %>
                <tr>
		          <td class="text-center" width=10%><%=vo.getNo() %></td>
		          <td class="text-center" width=10%>
		           <%
		               String s="-";
		               if(vo.getState().equals("상승"))
		               {
		            	   s="<font color='red'>▲ "+vo.getIdcrement()+"</font>";
		               }
		               else if(vo.getState().equals("하강"))
		               {
		            	   s="<font color='blue'>▼ "+vo.getIdcrement()+"</font>";
		               }
		               else
		               {
		            	   s="-";
		               }
		           %>
		           <%=s %>
		          </td>
		          <td class="text-center" width=10%>
		           <img src="<%=vo.getPoster() %>" width=30 height="30">
		          </td>
		          <td width=40%><%=vo.getTitle() %></td>
		          <td width=30%><%=vo.getSinger() %>
		              <br><sub><%=vo.getAlbum() %></sub>
		          </td>
		          
		         </tr>
         <%
            }
         %>
       </table>
       <table class="table">
         <tr>
           <td class="text-center">
            <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
              <%=curpage %> page / <%=totalpage %> pages
            <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
           </td>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>