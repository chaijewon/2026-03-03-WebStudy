<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <%--
        v-if / v-else / v-if-else 
   --%>
   <%--
       View     Model View ViewModel
       
                => MVVM 
                
                data(){
		    		return {
		    			age:15 => 변경시마다 HTML에 적용 
		    		}
		    	}
		    	
		    	Model = View  : 초기값 
		    	ViewModel = Model = View
		    	       변경시마다  
    --%>
   <div id="app">
     <p v-if="age>=20">성인</p>
     <p v-else-if="age>=13">청소년</p>
     <p v-else>어린이</p>
   </div>
   <div id="app2">
     <button @click="isopen=true">Show</button>
     <button @click="isopen=false">Hide</button>
     <div v-show="isopen">
       Hello Vue3
     </div>
     <ul>
       <li v-for="(name,index) in names" :key="index" v-text="name"></li>
     </ul>
     <ul>
       <li v-for="(sa,index) in sawon" :key="index">
         {{sa.name}}({{sa.age}})
       </li>
     </ul>
   </div>
   
   <script>
    let app=Vue.createApp({
    	// Model => 데이터 관리 : VO
    	data(){
    		return {
    			age:15
    		}
    	},
    	// 변경 => ViewModel
    	mounted(){
    		this.age=30
    	}
    }).mount("#app")
    
    let app2=Vue.createApp({
    	data(){
    		return {
    			isopen:false,
    			names:['홍길동','심청이','이순신'],
    			sawon:[{name:'홍길동1',age:30},
    				   {name:'홍길동2',age:35},
    				   {name:'홍길동3',age:33}]
    		}
    	}
    }).mount("#app2")
   </script>
</body>
</html>