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
		let type=$(this).text()
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
	$('.btns').on('click',function(){
		let type=$(this).attr("data-type")
		let page=$(this).attr("data-page")
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_food.do',
			data:{"type":type,"page":page},
			success:function(result)
			{
				$('#food_list').html(result)
			}
		})
	})
	$('.food-item').on('click',function(){
		let no=$(this).attr("data-no")
		let poster=$(this).attr("data-poster")
		let name=$(this).attr("data-name")
		$('#food-poster').attr("src",poster)
		$('#food-name').text(name)
		$('#food-poster').show()
		$('.table-borderless').show()
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
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
       <button type="button" class="btn-xs bg-danger types text-white">한식</button>
       <button type="button" class="btn-xs bg-warning types text-white">양식</button>
       <button type="button" class="btn-xs bg-primary types text-white">중식</button>
       <button type="button" class="btn-xs bg-info types text-white">일식</button>
       <button type="button" class="btn-xs bg-success types text-white">분식</button>
      </td>
    </tr>
  </table>
  <table class="table table-hover align-middle">
    <tbody>
      <c:forEach var="vo" items="${list }">
        <tr class="food-item" data-poster="${vo.poster }" 
         data-name="${vo.name }"
         data-no="${vo.no }"
        >
          <td>
            <img src="${vo.poster }" class="rounded"
              style="width: 150px;height: 100px">
          </td>
          <td>
            <strong>${vo.name }</strong><br>
            <small>${vo.type }</small>
          </td>
        </tr>
      </c:forEach>
      <tr>
        <td colspan="2" class="text-center">
         <button class="btn bg-success btn-sm btns"
          type="button" data-page="${curpage>1?curpage-1:curpage }" data-type="${type }"
         >이전</button>
          ${curpage } page / ${totalpage } pages
         <button class="btn bg-info btn-sm btns"
          type="button" data-page="${curpage<totalpage?curpage+1:curpage }" data-type="${type }"
         >다음</a>
        </td>
      </tr>
    </tbody>
  </table>
</body>
</html>