<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     1. show / hide 
     2. addClass / removeClass => class속성 제어 
     3. append / prepend
        밑에      앞에 추가 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu {
  list-style: none;
  display: flex;
  gap:10px;
}
.item {
  padding: 10px 15px;
  cursor: pointer;
  background: #eee
}
.item.active{
  background: #007bff;
  color: white;
  font-weight: bold;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<script type="text/javascript">
$(function(){ // main => window.onload / mounted / useEffect
	$('.item').on('click',function(){
		$('.item').removeClass('active')
		$(this).addClass('active')
	})
})
</script>
</head>
<body>
  <ul class="menu">
    <li class="item active">홈</li> <%-- removeClass('active') --%>
    <li class="item">회원</li> <%-- addClass('active') --%>
    <li class="item">맛집</li>
    <li class="item">여행</li>
    <li class="item">레시피</li>
  </ul>
</body>
</html>