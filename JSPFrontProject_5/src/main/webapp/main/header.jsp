<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').on('click',function(){
		// 값 읽기 
		let id=$('#id').val()
		if(id.trim()==="")
		{
			$('#id').focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return
		}
		///// 유효성 검사 => 강제로 입력 
	})
	$('#logoutBtn').on('click',function(){
		
	})
})
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Ajax/동적쿼리</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">맛집 검색</a></li>
      <li><a href="#">동영상 검색</a></li>
      <li><a href="#">커뮤니티</a></li>
    </ul>
  </div>
</nav>
<div class="container">
  <div class="row text-right">
    <c:if test="${sessionScope.id==null }">
	    
	      <table class="table">
	       <tr>
	        <td>
	         ID:<input type=text id="id" size=15 class="input-sm">
	         PW:<input type=password id="pwd" size=15 class="input-sm">
	         <button class="btn-sm btn-danger" id="logBtn" type="button">로그인</button>
	        </td>
	       </tr>
	      </table>
	    
    </c:if>
    <c:if test="${sessionScope.id!=null }">
    
      <table class="table">
       <tr>
        <td>
         ${sessionScope.name}님 로그인되었습니다 
         <button class="btn-sm btn-primary" id="logoutBtn">로그아웃</button>
        </td>
       </tr>
      </table>
    
    </c:if>
  </div>
</div>
</body>
</html>