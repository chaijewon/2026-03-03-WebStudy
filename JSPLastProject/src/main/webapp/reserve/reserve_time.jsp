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
	$('.times').on('click',function(){
		let time=$(this).text()
		alert(time)
		$('#food-time').text(time)
		$('#rtime').val(time)
		$.ajax({
			type:'post',
			url:'../reserve/reserve_inwon.do',
			success:function(result)
			{
				$('#food_inwons').html(result)
			}
		})
	})
})
</script>
</head>
<body>
  <c:forEach var="time" items="${times }">
    <button class="btn btn-outline-primary btn-sm times">${time }</button>
  </c:forEach>
</body>
</html>