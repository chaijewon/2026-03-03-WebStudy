<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     함수 응용 : 영화 진흥원 => JSON으로 전송 
     --------------------------------- 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 960px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
// 변수 선언 => 전역변수 
let movie=[]
window.onload=function()
{
	  movieList(1)
	  /*
	  searchMainDailyBoxOffice.do
	  searchMainRealTicket.do
	  searchMainDailySeatTicket.do
	  https://www.kobis.or.kr/kobis/business/main/
	  */
}
function movieList(no)
{
	// 서버 연결 movie_list.do?no=1
	axios.get('movie_list.do',{
		params:{
			no:no
		}
	// response =  out.write(json);
	}).then(response=>{
		// response => JSON / 일반 문자열 
		movie=response.data
		console.log(movie)
		// <tbody>로 데이터 전송 
		let html='';
		movie.forEach((m)=>{
			html+='<tr onmouseover="movieDetail('+m.rank+')">'
	            +'<td class="text-center">'+m.rank+'</td>'
	            +'<td class="text-center"><img src="https://www.kobis.or.kr'+m.thumbUrl+'" width=30 height=30></td>'
	            +'<td>'+m.movieNm+'</td>'
	            +'<td>'+m.director+'</td>'
	            +'<td>'+m.genre+'</td>'
	            +'</tr>'
		})
		document.querySelector('tbody').innerHTML=html
	})
}
function movieDetail(mno)
{
	
}
</script>
</head>
<body>
  <div class="container">
   <div class="row text-center">
     <button class="btn-lg btn-warning" onclick="movieList(1)">박스오피스</button>
     <button class="btn-lg btn-info" onclick="movieList(2)">실시간 예매율</button>
     <button class="btn-lg btn-success" onclick="movieList(3)">좌석 점유율</button>
   </div>
   <div class="row" style="margin-top: 20px">
     <div class="col-sm-8">
       <table class="table" id="list">
         <thead>
           <tr class="success">
             <th class="text-center">순위</th>
             <th class="text-center"></th>
             <th class="text-center">영화명</th>
             <th class="text-center">감독</th>
             <th class="text-center">장르</th>
           </tr>
         </thead>
         <tbody>
          
         </tbody>
       </table>
     </div>
     <div class="col-sm-4">
       
     </div>
   </div>
  </div>
</body>
</html>







