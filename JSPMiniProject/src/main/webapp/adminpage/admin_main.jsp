<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
  <div class="admin-container">
    <header class="admin-header">
      <h1>관리자 페이지</h1>
      <div class="admin-user">
        <span>${sessionScope.name }</span>
      </div>
    </header>
    <aside class="admin-sidebar">
      <ul>
        <li class="active"><a href="#">대시보드</a></li>
        <li><a href="#">회원 관리</a></li>
        <li><a href="#">공지 관리</a></li>
        <li><a href="#">묻고답하기 관리</a></li>
        <li><a href="#">예약 관리</a></li>
        <li><a href="#">통계 관리</a></li>
      </ul>
    </aside>
    <jsp:include page="${admin_jsp }"></jsp:include>
  </div>
</body>
</html>