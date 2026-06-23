<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      1. vue를 사용하는 목적 
         상태관리 (변수를 관리 => 데이터 관리)
         --- state : React 
      2. MVVM 구조 
         Model : 데이터 저장 => VO
         View  : HTML 
         ViewModel  : VO의 데이터 갱신 ===> HTML에 적용 
                      -------------
                        | => HTML이 바로 갱신 (양방향 통신) 
         형식) 
              let name=Vue.createApp({
                  data(){
                     변수 => HTML에 적용 => 멤버변수
                     => this.
                  },
                  생명주기함수
                  beforeCreate()
                  created()
                  beforeMount() 
                  ***mounted() : => onload => $(function(){})
                  beforeUpdate()
                  updated()
                  beforeDestory()
                  destoryed(),
                  methods:{
                     사용자 정의 => 이벤트 처리 
                  },
                  components:{
                     다른 창을 관리 
                  },
                  computed:{
                     계산 / 천단위 앞에 , => 게산된 상태
                  },
                  watch:{
                     이벤트 감지 
                  }
              })
        3. vue 기초 
           => 가상돔
                                     diff => 다른 내용이 있는 경우에 바로 적용
               Vue => 가상메모리에 저장 ====== 실제 메모리 
               
                           |                  |
                          작업                브라우저와 연동 
               => 사용자 입력 == 저장 데이터가 동시에 처리 
                              
           => 디렉티브 
           => 명령어 
        4. vuex : HTML / 관리 => Pinia 
           MVC                  Spring
           => 데이터형 일치가 안되는 경우 : TypeScript 
           => 표준화 : nextjs (react)
           
 --%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript">
$(function(){
	$('#t').on('keyup',function(){
		let msg=$(this).val()
		$('#print').text(msg)
	})
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <input type=text size=30 class="input-sm" id="t">
    <div id="print"></div>
   </div>
  </div>
  <%-- View --%>
  <div class="container" id="app">
    <input type=text size=30 class="input-sm" v-model="msg">
    <div>{{msg}}</div>
  </div>
  <script><%-- text/babel --%>
    let s=Vue.createApp({
    	// 관리할 데이터 저장 공간 = Model =>  이벤트 = 처리 (ViewModel)
    	data(){
    		return {
    			msg:''
    		}
    	},
    	// ViewModel => 데이터 갱신 
    	mounted(){
    		// $(function()) => 시작과 동시 서버에서 데이터 읽기 
    		// 다른 라이브러리 연동 => Jquery
    		this.msg="Hello Vue3"
    	}
    }).mount('#app')
    // Model = ViewModel = View(HTML)
    // data()안에 설정된 데이터만 변경 
  </script>
</body>
</html>