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
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="page_card.js"></script>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
	     <div class="col-sm-8">
	      <div class="col-sm-3" v-for="vo in food_list">
	        <a class="a-link" @click="detail(vo.no)">
	         <div class="thumbnail">
	           <img :src="vo.poster" style="width: 320px;height: 130px;object-fit:cover">
	           <p v-text="vo.name"></p>
	         </div>
	        </a>
	      </div>
	      <div class="text-center" style="margin-top: 20px">
	        <pagecard></pagecard>
	      </div>
	    </div>
	    <div class="col-sm-4" v-show="isShow">
	     <food-detail></food-detail>
	    </div>
    </div>
  </div>
  <script>
  const food_detail={
	template:
		`
		  <table class="table">
           <tbody>
            <tr>
             <td class="text-center" width=30% rowspan="8">
               <img src="" style="width:100%">
             </td>
             <td colspan="2"><h3>&nbsp;<span style="color:orange"></span></h3></td>
            </tr>
            <tr>
              <td width=20%>주소</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td width=20%>전화</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td width=20%>음식종류</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td width=20%>주차</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td width=20%>가격대</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td width=20%>영업시간</td>
              <td width=50%></td>
            </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
           </tbody>
          </table>
		`
  }
  let food=Vue.createApp({
	  data(){
		  return {
			  curpage:1,
			  totalpage:0,
			  endPage:0,
			  startPage:0,
			  food_list:[],
			  isShow:false
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
		  },
		  move(page){
			  this.curpage=page
			  this.dataRecv()
		  },
		  detail(no){
			  this.isShow=true
		  }
	  },
	  components:{
		  pagecard:page_card,
		  food-detail:food_detail
	  }
  }).mount(".container-fluid")
  </script>
</body>
</html>