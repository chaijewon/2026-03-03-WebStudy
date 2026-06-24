<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  width: 100%;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
button {
  margin-left: 2px
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<%-- 지도 출력 : Vue/React 동일 
     댓글 / 좋아요 / 찜하기 / 예약 => 회원가입 / 로그인 
--%>
<body>
   <div class="container">
     <div class="row">
       <table class="table">
         <tbody>
           <tr>
             <th width=30% class="text-center" rowspan="8">
              <img :src="food_detail.poster" style="width:100%;object-fit:cover">
             </th>
             <td colspan="2"><h3>{{food_detail.name}}</h3></td>
           </tr>
           <tr>
             <th width=10% class="text-center">주소</th>
             <td width=60%>{{food_detail.address}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">전화</th>
             <td width=60%>{{food_detail.phone}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">음식종류</th>
             <td width=60%>{{food_detail.type}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">주차</th>
             <td width=60%>{{food_detail.parking}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">가격대</th>
             <td width=60%>{{food_detail.price}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">영업시간</th>
             <td width=60%>{{food_detail.time}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">테마</th>
             <td width=60%>{{food_detail.theme}}</td>
           </tr>
           <tr>
             <td colspan="3">{{food_detail.content}}</td>
           </tr>
           <tr>
             <td colspan="3" class="text-right">
              <button type="button" class="btn-xs btn-danger">좋아요</button>
              <button type="button" class="btn-xs btn-success">찜하기</button>
              <button type="button" class="btn-xs btn-info">예약하기</button>
              <button type="button" class="btn-xs btn-primary" onclick="javascript:history.back()">목록</button>
             </td>
           </tr>
         </tbody>
       </table>
     </div>
   </div>
   <script>
    let detail=Vue.createApp({
    	data(){
    		return {
    			no:${param.no}, // EL
    			food_detail:{} // => 데이터가 있는 경우에 HTML에 적용
    		}
    	},
    	mounted(){
    		//console.log("no="+this.no)
    		axios.get('../food/detail_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(response=>{
    			console.log(response.data)
    			this.food_detail=response.data
    		})
    	},
    	methods:{
    		// 이벤트 처리 => 버튼 클릭시
    	}
    }).mount(".container")
   </script>
</body>
</html>







