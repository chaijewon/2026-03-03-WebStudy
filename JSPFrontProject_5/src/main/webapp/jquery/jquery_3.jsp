<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#btn').on('click',function(){
		$.ajax({
			type:'POST',
			// data:{}
		    url:'sub.jsp',
		    success:function(response) // 결과값을 받는 상태 => html/json
		    {
		    	alert(response)
		    	$('#print').html(response)
		    }
		})
	})
})
</script>
</head>
<body>
  <button id="btn">클릭</button>
  <div id="print">
   
  </div>
</body>
</html>