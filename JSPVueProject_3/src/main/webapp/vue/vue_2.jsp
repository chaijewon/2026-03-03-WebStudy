<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div id="app">
    <h3>v-once:한번만 렌더링=데이터가 변경된 경우 화면 갱신이 안된다(로고,검색기)</h3>
    <h4 v-once>{{message}}</h4>
    <h4>{{message}}</h4>
    <button @click="change">변경</button>
    <div>
      <ul>
        <li>회사명</li>
        <li>작성자</li>
        <li>게시물번호</li>
        <li>변경되지 않는 정보(로그,개인정보 방침:Footer)</li>
      </ul>
    </div>
  </div>
  <script>
    let app=Vue.createApp({
    	data(){
    		return {
    			message:'Hello Vue!!'
    		}
    	},
    	methods:{
    		change(){
    			this.message="Vue3 v-once";
    		}
    	}
    }).mount("#app")
  </script>
</body>
</html>