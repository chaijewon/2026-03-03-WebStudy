<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   toLocaleString() : Number 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let total=1234567
	$('#total').text(total.toLocaleString()+"원")
})
</script>
</head>
<body>
  <span id="total"></span>
</body>
</html>