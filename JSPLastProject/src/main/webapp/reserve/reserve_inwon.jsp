<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.inwons').on('click',function(){
		let inwon=$(this).text()
		$('#food-inwon').text(inwon)
		$('#rinwon').val(inwon)
		$('#reserveBtn').show()
	})
})
</script>
</head>
<body>
   <c:forEach var="i" begin="2" end="5">
    <button class="btn btn-outline-danger btn-sm inwons">${i }명</button>
   </c:forEach>
    <button class="btn btn-outline-danger btn-sm inwons">단체</button>
</body>
</html>