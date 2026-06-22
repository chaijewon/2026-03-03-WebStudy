<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
  <div class="mypage-container">
    <aside class="mypage-sidebar">
      <div class="profile">
        <img src="../mypage/mypage.png">
        <h3>${sessionScope.name }님</h3>
        <p>환영합니다 🍾</p>
      </div>
      <ul class="menu">
       <li><a href="#">회원 정보</a></li>
       <li><a href="#">회원 탈퇴</a></li>
       <li><a href="../mypage/cart_list.do">장바구니 관리</a></li>
       <li><a href="../mypage/buy_list.do">결제 관리</a></li>
       <li><a href="#">예약관리</a></li>
       <li><a href="../mypage/jjim_list.do">찜 관리</a></li>
       <li><a href="#">커뮤니티 관리</a></li>
      </ul>
    </aside>
    <jsp:include page="${mypage_jsp }"></jsp:include>
  </div>
</body>
</html>