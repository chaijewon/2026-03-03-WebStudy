<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
     tomcat 10 이상 => jakarta.tags.core
      => jakarta (웹 => 오픈 소스그룹이 이전)
     tomcat 10 미만 => http://java.sun.com/jsp/jstl/core
      => javax 
 --%>
<%
     MusicModel model=new MusicModel();
     model.musicList(request);
     // => Controller 
     // 메소드 제작 => 메소드 호출 
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
      <h3>Music Top200</h3>
      <table class="table">
        <tr class="success">
          <th width=10% class="text-center">순위</th>
          <th width=10% class="text-center"></th>
          <th width=10% class="text-center"></th>
          <th width=35% class="text-center">곡명</th>
          <th width=35% class="text-center">가수명</th>
        </tr>
        <c:forEach var="vo" items="${list }">
          <tr>
           <td width=10% class="text-center">${vo.no }</td>
           <td width=10% class="text-center">
             <c:choose>
               <c:when test="${vo.state=='상승' }">
                <font color="red">${"▲" += vo.idcrement}</font>
               </c:when>
               <c:when test="${vo.state=='하강' }">
                <font color="blue">${"▼" += vo.idcrement}</font>
               </c:when>
               <c:otherwise>-</c:otherwise>
             </c:choose> 
           </td>
           <td width=10% class="text-center">
             <img src="${vo.poster }" width=30 height="30">
           </td>
           <td width=35%>${vo.title }</td>
           <td width=35%>
            ${vo.singer }<br>
            <sub>${vo.album }</sub>
           </td>
          </tr>
        </c:forEach>
      </table>
      <table class="table">
        <tr>
          <td class="text-center">
            <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
            ${curpage } page / ${totalpage } pages
            <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-danger">다음</a>
          </td>
        </tr>
      </table>
    </div>
   </div>
</body>
</html>