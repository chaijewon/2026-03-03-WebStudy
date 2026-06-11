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
  width: 960px;
}
h1 {
   text-align: center;
}
p{
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>
<script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container">
   <div class="row">
      <a href="#" v-for="vo in list">
       <div class="col-sm-3">
        <div class="thumbnail">
         <img :src="vo.poster" style="width: 204px;height: 130px;object-fit:cover">
         <p>{{vo.name }}</p>
        </div>
       </div>
      </a>
   </div>
   <div class="row text-center" style="margin-top: 20px">
     <%--<ul class="pagination">
      <c:if test="${startPage>1 }">
       <li><a href="list.do?page=${startPage-1 }">&laquo;</a></li>
      </c:if>
      
      <c:forEach var="i" begin="${startPage }" end="${endPage }">
        <li ${curpage==i?"class=active":"" }>
          <a href="list.do?page=${i }">${i }</a></li>
      </c:forEach>
      
      <c:if test="${endPage<totalpage }">
       <li><a href="list.do?page=${endPage+1 }">&raquo;</a></li>
      </c:if>
     </ul>
     --%>
   </div>
  </div>
  <script>
   let list=Vue.createApp({
	   data(){
		   return {
			   // 멤버변수 
			   list:[],
			   curpage:1,
			   endPage:0,
			   startPage:0,
			   totalpage:0
		   }
	   },
	   // => window.onload / $(function(){})
	   mounted(){
		   this.dataRecv()
	   },
	   methods:{
		   dataRecv(){
			   axios.get('list_ajax.do',{
				   params:{
					   page:this.curpage
				   }
			   }).then(response=>{
				   console.log(response.data)
				   this.list=response.data
				   this.curpage=response.data[0].curpage
				   this.totalpage=response.data[0].totalpage
				   this.startPage=response.data[0].startPage
				   this.endPage=response.data[0].endPage
			   })
		   }
	   }
   }).mount('.container')
  </script>
 </body>
</html>