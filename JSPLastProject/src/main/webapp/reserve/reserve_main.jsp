<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body{
      background-color:#f8f9fa;
      font-family:'Noto Sans KR', sans-serif;
    }
    .card{
      box-shadow:0 4px 10px rgba(0,0,0,0.05);
      border:none;
      border-radius:12px;
    }
    .card-header{
      font-weight:700;
      font-size:1.1rem;
    }
    #food_list{
      height:600px;
      overflow-y:auto;
    }
    .food-item:hover{
      background-color:#f1f1f1;
      cursor:pointer;
    }
    img#food_poster{
      border-radius:8px;
    }
</style>

<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/reserve_food.do',
		data:{"type":"한식"},
		success:function(result)
		{
			$('#food_list').html(result)
		}
	})
})
</script>
</head>
<body>
    <%--
         my-4 
         m = margin 
         y = top / bottom
         => margin : 24px ,0 24px, 0
         => 4 => 1.5rem => 24px  
     --%>
    <div class="container my-4">
     <div class="row g-4">
       <%-- 맛집 정보 --%>
       <div class="col-md-4">
	       <div class="card h-100"> <%-- h-100 : height:100% --%>
	         <div class="card-header bg-danger text-white text-center">맛집 정보</div>
	         <div class="card-body" id="food_list">
	           
	         </div>
	       </div>
       </div>
       <%-- 예약일 --%>
       <div class="col-md-5">
	       <div class="card h-100"> <%-- h-100 : height:100% --%>
	         <div class="card-header bg-info text-white text-center">예약일 정보</div>
	         <div class="card-body" id="food_rdays">
	          
	         </div>
	       </div>
       </div>
       <%-- 예약정보 --%>
       <div class="col-md-3">
	       <div class="card h-100"> <%-- h-100 : height:100% --%>
	         <div class="card-header bg-success text-white text-center">맛집 정보</div>
	         <div class="card-body text-center">
	          <img src="" id="food-poster" style="display:none">
	          <table class="table table-borderless text-start"
	            style="display:none">
	            <tr>
	             <td class="text-muted">업체명<td>
	             <td id="food-name">-</td>
	            </tr>
	            <tr>
	             <td class="text-muted">예약일<td>
	             <td id="food-day">-</td>
	            </tr>
	            <tr>
	             <td class="text-muted">예약시간<td>
	             <td id="food-time">-</td>
	            </tr>
	            <tr>
	             <td class="text-muted">인원<td>
	             <td id="food-inwon">-</td>
	            </tr>
	          </table>
	          <form method="post" action="../reserve/reserve_insert.do"
	            id="reserveBtn" style="display:none">
	              <input type="hidden" name="no" id="rno">
	              <input type="hidden" name="day" id="rdays">
	              <input type="hidden" name="time" id="rtime">
	              <input type="hidden" name="inwon" id="rinwon">
	              <button type="submit" class="btn-primary w-100">
	               예약하기
	              </button>
	          </form>
	         </div>
	       </div>
       </div>
     </div>
     <div class="row g-4 mt-3">
       <div class="col-md-8">
        <div class="card"> <%-- h-100 : height:100% --%>
	         <div class="card-header bg-warning text-white text-center">시간 정보</div>
	         <div class="card-body text-center" id="food_times">
	          
	         </div>
	       </div>
       </div>
       <div class="col-md-4">
        <div class="card"> <%-- h-100 : height:100% --%>
	         <div class="card-header bg-primary text-white text-center">인원 정보</div>
	         <div class="card-body text-center" id="food_inwons">
	          
	         </div>
	       </div>
       </div>
     </div>
    </div>
</body>
</html>




