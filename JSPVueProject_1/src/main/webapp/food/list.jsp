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
<script type="text/javascript" src="food_detail.js"></script>
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
	     <fooddetail v-bind:food_detail="food_detail" ></fooddetail>
	    </div>
    </div>
  </div>
  <script src="main.js"></script>
</body>
</html>