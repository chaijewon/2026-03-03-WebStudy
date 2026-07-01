<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
[v-cloak]{
  display: none
}
</style>
</head>
<body>
   <div id="app" v-cloak>
     <h3>v-cloak:Vue가 완전히 실행전에 {{}} 잠시 보이는 현상을 방지</h3>
     <h2>{{title}}</h2>
   </div>
   <script>
   let app=Vue.createApp({
	   data(){
		   return {
			   title:'v-cloak: 깜박임 방지'
		   }
	   }
   }).mount("#app")
   </script>
</body>
</html>