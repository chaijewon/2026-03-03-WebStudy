<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 960px;
}
h3 {
   text-align: center;
}
.card {
   box-shadow: 0 4px 10px rgba(0,0,0,0.05);
   border:none;
   border-radius: 12px;
}
.card-header{
  font-weight: 700;
  font-size: 1.1em
}
#food_list{
  height: 600px;
  overflow-y:auto; /* 자동 스크롤 */ 
}
.food-item:hover{
  background-color: #f1f1f1;
  cursor: pointer;
}
img#food_poster{
   border-radius: 8px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/reserve_food.do',
		data:{"type":"한식"},
		success:function(result)
		{
			alert(result)
			// responseXML(JSON) / responseText
			$('#food_list').html(result)
		}
	})
})
</script>
</head>
<body>
  <div class="container my-4">
    <div class="row g-4">
      <div class="col-sm-4">
       <div class="card h-100">
        <div class="card-header bg-danger  text-white text-center">
         맛집 정보
        </div>
        <div class="card-body" id="food_list">
         
        </div>
       </div>
      </div>
      <div class="col-sm-5">
        <div class="card h-100">
        <div class="card-header bg-info  text-white text-center">
         예약일 정보
        </div>
        <div class="card-body" id="food_rdays">
          
        </div>
       </div>
      </div>
      <div class="col-sm-3">
        <div class="card h-100">
        <div class="card-header bg-info  text-white text-center">
         예약 정보
        </div>
        <div class="card-body text-center">
          <img src="" style="display:none;width: 200px;height: 150px" id="food_poster"
           
          >
          <table class="table table-borderless"
            style="display:none" id="reserve_info">
            <tr>
             <td class="text-muted">업체명</td>
             <td id="food_name">-</td>
            </tr>
            <tr>
             <td class="text-muted">예약일</td>
             <td id="food_reserve_day">-</td>
            </tr>
            <tr>
             <td class="text-muted">예약시간</td>
             <td id="food_reserve_time">-</td>
            </tr>
            <tr>
             <td class="text-muted">예약인원</td>
             <td id="food_reserve_inwon">-</td>
            </tr>
            <tr id="ok" style="display:none">
              <td colspan="2" class="text-center">
               <button class="btn-lg btn-primary">예약하기</button>
              </td>
            </tr>
          </table>
        </div>
       </div>
      </div>
    </div>
    <div class="row g-4 mt-3">
       <div class="col-sm-7">
        <div class="card">
        <div class="card-header bg-primary  text-white text-center">
         시간 정보
        </div>
        <div class="card-body text-center" id="r_time">
          
        </div>
       </div>
       </div>
       <div class="col-sm-5">
        <div class="card">
        <div class="card-header bg-warning  text-white text-center">
         인원 정보
        </div>
        <div class="card-body text-center" id="r_inwon">
         
        </div>
       </div>
       </div>
    </div>
  </div>
</body>
</html>