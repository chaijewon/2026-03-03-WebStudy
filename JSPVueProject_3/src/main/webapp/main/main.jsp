<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#login').on('click',function(){
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
		
		$.ajax({
			type:'get',
			url:'../member/login.do',
			data:{"id":id,"pwd":pwd},
			success:function(response){
				//console.log(response)
				if(response==='NOID')
				{
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus()
				}
				else if(response==='NOPWD')
				{
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else
				{
					location.reload()
				}
			}
		})
	})
	$('#logout').on('click',function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:function(response)
			{
				location.reload()
			}
		})
	})
})
</script>
</head>
<body>
   <jsp:include page="../main/header.jsp"></jsp:include>
   <div class="container text-right" id="mainApp">
    <c:if test="${sessionScope.id==null }">
	    <div>
	     ID:<input type="text" id="id" size=15 class="input-sm">
	     &nbsp;
	     PW:<input type="password" id="pwd" size=15 class="input-sm" v-model="pwd">
	     &nbsp;
	     <button class="btn-sm btn-danger" id="login">로그인</button>
	    </div>
    </c:if>
    <c:if test="${sessionScope.id!=null }">
	    <div>
	     ${sessionScope.name }(${sessionScope.isAdmin=='y'?"관리자":"일반사용자"})님 로그인중입니다
	     <button class="btn-sm btn-primary" id="logout">로그아웃</button>
	    </div>
    </c:if>
   </div>
   <hr>
   <jsp:include page="${main_jsp }"></jsp:include>
  
</body>
</html>