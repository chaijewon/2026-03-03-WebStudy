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
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
.btn-xs {
  margin-left: 2px
}
h3{
  text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="../goods/pagecard.js"></script>
</head>
<body>
  <div class="container" id="listApp">
    <div class="row">
     <div class="col-sm-3" v-for="(vo,index) in list" :key="index">
       <a :href="'../goods/detail.do?no='+vo.no">
        <div class="thumbnail">
          <img :src="vo.goods_poster" style="width: 250px;height: 150px;object-fit:cover">
          <p>{{vo.goods_name}}</p>
        </div>
       </a>
     </div>
    </div>
    <%-- 권장 : startPage="startPage" :오류 발생이 있을 수 있다 
         --- start-page="startPage"
     --%>
    <div class="row text-center" style="margin-top: 20px">
      <pagecard :start-page="startPage"
                :end-page="endPage"
                :cur-page="curpage"
                :total-page="totalpage"
                @page-change="pageChange"
      ></pagecard>
    </div>
  </div>
  <script>
    let list=Vue.createApp({
    	data(){
    		return {
    		   list:[],
    		   curpage:1,
    		   totalpage:0,
    		   endPage:0,
    		   startPage:0
    		}
    	},
    	mounted(){
    		this.dataRecv()
    	},
    	methods:{
    		// goods/list_vue.do?page=1
    		async dataRecv(){
    			await axios.get('../goods/list_vue.do',{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				//console.log(response)
    				this.list=response.data.list
    				this.curpage=response.data.curpage
    				this.totalpage=response.data.totalpage
    				this.startPage=response.data.startPage
    				this.endPage=response.data.endPage
    			})
    		},
    		pageChange(page){
    			this.curpage=page
    			this.dataRecv()
    		}
    		
    	},
    	components:{
    		pagecard:pagecard
    	}
    }).mount("#listApp")
  </script>
</body>
</html>