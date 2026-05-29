<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    BoardModel model=new BoardModel();
    model.boardList(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 
   CSS : 선택자 => Jquery , 바닐라 JS / Vue / React 
         text/font 속성 
         박스속성 : margin / padding / border
         배경속성 : background
         유동속성 : z-index / float 
         가시속성 : overflow / display 
         위치속성 : absolute / relative / fixed 
         ------------------------------------
 -->
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
   <div class="row">
     <h3>묻고 답하기</h3>
     <table class="table">
       <tr>
         <td><a href="insert.jsp" class="btn btn-sm btn-danger">새글</a></td>
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
       <%-- for(BoardVO vo:list) 
            vo.getName()
       --%>
       <c:set var="count" value="${count }"/>
       <%-- int count=7 --%>
       <c:forEach var="vo" items="${list }">
         <tr>
           <td width=10% class="text-center">${count }</td>
           <td width=45%>
             <c:if test="${vo.group_tab>0 }">
               <c:forEach var="i" begin="1" end="${vo.group_tab }">
                &nbsp;&nbsp;
               </c:forEach>
               <img src="re_icon.png">
             </c:if>
             <%-- 상세보기는 1개만 실행 => primary key 컬럼을 넘겨준다 --%>
             <c:if test="${vo.subject!=msg }">
              <a href="detail.jsp?no=${vo.no }">${vo.subject }</a> <%-- vo.getSubject() --%>
             </c:if>
             <c:if test="${vo.subject==msg }">
              <span style="color:gray">${vo.subject }</span>
             </c:if>
             <c:if test="${vo.dbday==today }">
              &nbsp;<sup><img src="new.gif"></sup>
             </c:if>
           </td>
           <td width=15% class="text-center">${vo.name }</td>
           <td width=20% class="text-center">${vo.dbday }</td>
           <td width=10% class="text-center">${vo.hit }</td>
         </tr>
         <c:set var="count" value="${count-1 }"/>
         <%--
            count--
          --%>
       </c:forEach>
     </table>
     <table class="table">
       <tr>
         <td class="text-left">
          <select class="input-sm">
            <option>이름</option>
            <option>제목</option>
            <option>내용</option>
          </select>
          <input type=text name=fd size=15 class="input-sm">
          <button class="btn-sm btn-primary">검색</button>
         </td>
         <td class="text-right">
           <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-info">이전</a>
            ${curpage } page / ${totalpage } pages
           <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-warning">다음</a>
         </td>
       </tr>
     </table>
   </div>
  </div>
</body>
</html>