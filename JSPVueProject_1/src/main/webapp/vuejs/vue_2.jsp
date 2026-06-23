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
  width: 800px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <div class="container">
    <div class="row">
      <input type=text size=20 class="input-sm" v-model="msg">
      <div>{{msg}}</div>
    </div>
  </div>
  <script> <%-- 일반 , moudle형식 : setup() --%> 
   let con=Vue.createApp({
	   data(){
		   return {
			   msg:''
		   }
	   },
	   // 자동 호출되는 함수
	   beforeCreate(){
		   console.log("Vue 객체 생성 전...")
	   },
	   created(){
		   console.log("Vue 객체 생성 완료...")
	   },
	   beforeMount(){
		   console.log("가상돔에 올라가기 전...")
	   },
	   mounted(){
		   console.log("가상돔에 HTML을 트리 형태로 저장 완료..(onload) *****")
	       // 화면 출력과 동시에 서버 연결 = 데이터를 읽어오는 경우
	       // JSON 파싱이 자동으로 처리 
	       // 제어를 실제 HTML에서 제어 
	       // JSP / Jquery => HTML을 만들어서 첨부 
	       // Vue / ThymeLeaf => 실제 HTML을 제어 
	   },
	   beforeUpdate(){
		   console.log("데이터 갱신 전...")
	   },
	   updated(){
		   console.log("데이터 갱신 완료...******")
		   // 이벤트 발생 
	   },
	   beforeUnmout(){
		   console.log("가상돔 해제전...")
	   },
	   unMounted(){
		   console.log("가상돔이 해제된 상태...")
	   }
	   /*
	      1. 배우기 쉽다 
	      2. 컴포넌트 기반 개발이 가능 
	      3. 최적화 (성능이 뛰어나다)
	      4. 풍부한 라이브러리 제공 
	      5. 단점 : 바로 갱신이 되는 사이트가 없다 
	      6. 만든사람 : google (AngularJS) 
	      
	      형식)
	      
	          Vue.createApp({
	        	  1. 사용할 데이터 (화면 출력에 필요한 데이터 설정)
	        	  data(){
	        		  return {
	        			  데이터 설정 => HTML에 적용 
	        		  }
	        	  },
	        	  2. 생명주기 함수 설정 
	        	  mounted(){},
	        	  updated(){},
	        	  3. 이벤트 처리 : 사용자 정의 함수 
	        	  methods:{
	        		  함수 정의 
	        	  },
	        	  => 부가적인 화면 => 상세보기 / 결제 정보 / 예약 정보 
	        	  4. components:{
	        		  
	        	  },
	        	  5. computed:{
	        		  계산 / 완성 => 10,000
	        	  }
	        	  6. watch:{
	        		  
	        	  }
	        	  
	          })
	          
	          부분적으로 처리가 가능 
	   */
   }).mount('.container')
  </script>
</body>
</html>