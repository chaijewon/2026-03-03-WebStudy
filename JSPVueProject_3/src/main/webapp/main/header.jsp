<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
     1. 예약 : Ajax 
     2. 로그인 / 댓글 : Vue
     3. 검색 : Vue 
     -----------------------
     4. 지도 : Vue 
     -----------------------
     JSP 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../main/main.do">MiniProject</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../main/main.do">Home</a></li>
      <c:if test="${sessionScope.id==null }">
       <li><a href="../member/join.do">회원가입</a></li>
      </c:if>
      
      <c:if test="${sessionScope.id!=null }">
       <li><a href="../member/join.do">회원수정</a></li>
      </c:if>
      
      <li><a href="../food/list.do">맛집</a></li>
      
      <c:if test="${sessionScope.id!=null }">
       <li><a href="../chat/chat.do">채팅</a></li>
       <li><a href="../news/find.do">뉴스검색</a></li>
       <li><a href="../news/news.do">실시간 뉴스</a></li>
      </c:if>
      
      <c:if test="${sessionScope.id!=null && sessionScope.isAdmin=='n'}">
       <li><a href="../mypage/mypage_main.do">마이페이지</a></li>
      </c:if>
      
      <c:if test="${sessionScope.id!=null && sessionScope.isAdmin=='y'}">
       <li><a href="../admin/admin_main.do">관리자페이지</a></li>
      </c:if>
      
    </ul>
  </div>
</nav>
</body>
</html>