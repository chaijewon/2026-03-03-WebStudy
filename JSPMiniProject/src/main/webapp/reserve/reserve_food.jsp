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
	$('.types').on('click',function(){
		let type=$(this).val()
		$.ajax({
			type:'post',
			url:'../reserve/reserve_food.do',
			data:{"type":type},
			success:function(result)
			{
				$('#food_list').html(result)
			}
		})
		
	})
	
	$('.food-item').on('click',function(){
		let poster=$(this).attr('data-poster')
		let name=$(this).attr('data-name')
		$('#food_poster').attr("src",poster)
		$('#food_name').text(name)
		$('#food_poster').show()
		$('#reserve_info').show()
		
		$.ajax({
			type:'post',
			url:'../reserve/diary.do',
			success:function(result)
			{
				$('#food_rdays').html(result)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
   <tr>
    <td class="text-center">
     <input type=button class="btn-xs btn-warning types" value="한식">
     <input type=button class="btn-xs btn-info types" value="양식">
     <input type=button class="btn-xs btn-success types" value="일식">
     <input type=button class="btn-xs btn-primary types" value="중식">
    </td>
   </tr>
  </table>
  <table class="table table-hover align-middle">
    <tbody>
      <c:forEach var="vo" items="${list }">
        <tr class="food-item" data-no="${vo.no }"
              data-poster="${vo.poster }" data-name="${vo.name }">
          <td><img src="${vo.poster }" class="rounded"
              style="width: 150px;height: 100px" 
              ></td>
          <td>
            <strong>${vo.name }</strong><br>
            <small class="text-muted">${vo.type }</small>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>