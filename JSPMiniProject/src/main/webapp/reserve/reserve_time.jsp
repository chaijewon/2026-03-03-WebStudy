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
		let t=$(this).text()
		$('#food_reserve_time').text(t)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_inwon.do',
			success:function(result)
			{
				$('#r_inwon').html(result)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
    <tbody>
      <tr>
       <td>
         <c:forTokens items="${time }" delims="," var="t">
          <span class="btn btn-xs btn-success times">${t}</span>
         </c:forTokens>
       </td>
      </tr>
    </tbody>
  </table>
</body>
</html>