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
  width: 900px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-3" v-for="vo in food_list">
        <a href="#">
         <div class="thumbnail">
           <img :src="vo.poster" style="width: 250px;height: 130px">
           <p v-text="vo.name"></p>
         </div>
        </a>
      </div>
    </div>
    <div class="row text-center" style="margin-top: 20px">
      <ul class="pagination">
        <li v-if="startPage>1"><a href="#">&laquo;</a></li>
        <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a href="#">{{i}}</a></li>
        <li v-if="endPage<totalpage"><a href="#">&raquo;</a></li>
      </ul>
    </div>
  </div>
  <script>
  let food=Vue.createApp({
	  data(){
		  return {
			  curpage:1,
			  totalpage:0,
			  endPage:0,
			  startPage:0,
			  food_list:[]
		  }
	  },
	  mounted(){
		 this.dataRecv()  
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../food/list_vue.do',{
				  params:{
					  page:this.curpage
				  }// ? => 데이터 전송 
			  }).then(response=>{
				  // 결과값 => response에 채워서 가지고 온다 
				  console.log(response.data)
				  this.endPage=response.data.endPage
				  this.startPage=response.data.startPage
				  this.curpage=response.data.curpage
				  this.totalpage=response.data.totalpage
				  this.food_list=response.data.food_list
			  })
		  },
		  // 숫자 증가 = 배열에 저장 
		  range(start,end){
			  let arr=[]
			  let len=end-start
			  for(let i=0;i<=len;i++)
			  {
				  arr[i]=start
				  start++
			  }
			  return arr
		  }
	  }
  }).mount(".container")
  </script>
</body>
</html>