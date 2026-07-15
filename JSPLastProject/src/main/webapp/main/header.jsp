<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.link{
  cursor: pointer;
}
</style>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
 Shadowbox.init({
	 players:['iframe']
 })
 $(function(){
	 $('#login').on('click',function(){
		 Shadowbox.open({
			 content:'../member/login.do',
			 player:'iframe',
			 width:350,
			 height:300,
			 title:'로그인'
		 })
	 })
	 
 })
</script>
<style type="text/css">
.welcome{
    font-size: 15px;
    color: #555;
}

.welcome strong{
    color: #ff6b6b;
}

</style>
</head>
<body>
<div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                           <c:if test="${sessionScope.id==null }">
                            <div class="login">
                                <a class="btn-xs btn-success btn link" id="login">로그인</a>
                            </div>
                           </c:if>
                           <c:if test="${sessionScope.id!=null }">
                            <div class="logout">
                              <span>
                                <strong class="welcome">
                                  ${sessionScope.name }(${sessionScope.admin=='y'?"관리자":"일반사용자" })님 환영합니다
                                </strong>
                              </span>
                                <a class="btn-xs btn-danger btn link" 
                                   href="../member/logout.do"
                                   id="logout" style="margin-left: 5px">로그아웃</a>
                            </div>
                           </c:if>
                        </div>
                        <!-- Search Button Area -->
                        <!-- <div class="search_button">
                            <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div> -->
                        <!-- Search Form -->
                        <!-- <div class="search-hidden-form">
                            <form action="#" method="get">
                                <input type="search" name="search" id="search-anything" placeholder="Search Anything...">
                                <input type="submit" value="" class="d-none">
                                <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                            </form>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="../main/main.do" class="yummy-logo">Travel</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="../main/main.do">Home</a>
                                </li>
                                <c:if test="${sessionScope.id==null }">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../member/join.do">회원가입</a>
                                        <a class="dropdown-item" href="archive.html">아이디찾기</a>
                                        <a class="dropdown-item" href="single.html">비밀번호찾기</a>
                 
                                    </div>
                                </li>
                                </c:if>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">서울여행</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=12&areaCode=1">관광지</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=14&areaCode=1">문화시설</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=15&areaCode=1">행사/공연/축제</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=32&areaCode=1">숙박</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=38&areaCode=1">쇼핑</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=39&areaCode=1">음식점</a>
                                        <a class="dropdown-item" href="#">날씨</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제주여행</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=12&areaCode=39">관광지</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=14&areaCode=39">문화시설</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=15&areaCode=39">행사/공연/축제</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=32&areaCode=39">숙박</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=38&areaCode=39">쇼핑</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=39&areaCode=39">음식점</a>
                                        <a class="dropdown-item" href="single.html">날씨</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">부산여행</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=12&areaCode=6">관광지</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=14&areaCode=6">문화시설</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=15&areaCode=6">행사/공연/축제</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=32&areaCode=6">숙박</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=38&areaCode=6">쇼핑</a>
                                        <a class="dropdown-item" href="../tour/travel.do?contenttypeid=39&areaCode=6">음식점</a>
                                        <a class="dropdown-item" href="#">날씨</a>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.id!=null }">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">빠른예약</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../reserve/reserve_main.do">맛집</a>
                                        <a class="dropdown-item" href="archive.html">공연&축제</a>
                                    </div>
                                </li>
                                </c:if>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../board/list.do">자유게시판</a>
                                        <a class="dropdown-item" href="../notice/user_list.do">공지사항</a>
                                        <c:if test="${sessionScope.id!=null }">
                                         <a class="dropdown-item" href="single.html">실시간채팅</a>
                                        </c:if>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.id!=null }">
                                <c:if test="${sessionScope.admin=='n' }">
                                 <li class="nav-item">
                                    <a class="nav-link" href="../mypage/mypage_main.do">마이페이지</a>
                                 </li>
                                </c:if>
                                <c:if test="${sessionScope.admin=='y' }">
                                <li class="nav-item">
                                    <a class="nav-link" href="../adminpage/admin_main.do">관리자페이지</a>
                                </li>
                                </c:if>
                                </c:if>
                                
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->
</body>
</html>