<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1. Vue특징 
          1) 가상돔을 이용한다 
             ----- 임시메모리 => 모든 작업을 한다 => 실제 저장된 데이터와 비교 
                                               다른 곳만 갱신
             => 저장 => mount("어떤 부분을 처리")
                             --------------> CSS 선택자 이용 (성능 최적화)
                             부분적으로 처리 
          2) 가볍다 / 사용이 쉽다 : 모든 개발자 같은 패턴 사용 
          3) vue => 점차적으로 react형식으로 변경 
                            ------ facebook + opensource 
                                   react-query  tanstack-query 
          4) 컴포지션 API (setup() => 도입)
          5) TypeScript를 친화적 
      2. Vue의 역할 
          1) 상태 관리 : 데이터 변경 => 자동으로 HTML에 적용 
             -------- Vue => 관리 / 화면 => Vuex => 라이브러리화 : Pinia 
                     ----- 관리+화면        | 프레임워크화 : NustJS
             *** Front의 표준화 : NextJS (AI) 
                                ------- react 
                                | JSP => MVC
                                  ----------- SpringFrame
             => 유지 보수
                ------- 메소드 
            Vue3 =====> UI 프레임워크
            Pinia =====> 최신 상태 관리 표준 
            Vuex ===> 레거시 (MVC)
            
        => UI 
           디렉티브 
             v-if / v-if ~ v-else / v-else-if ... 조건문 
             v-for : 반복문 
             v-bind => :으로 대체 (변수와 태그의 매칭) 
               ==> 속성값 추가시에는 bind <img :src="vo.poster" :title="Hello">
             v-model => 양방향 
             
             v-show : => 토글 
             v-text / v-html 
              => textContent => text() => v-text
              => innerHTML => html() => v-html
             v-memo : Callback => 재호출 
             v-once : 한번만 호출이 필요시에 
             v-on : 이벤트 처리 ===> @
             v-pre : 컴파일 생략 
             v-cloak :  로딩 깜박임 방지 
             
           => 화면 출력 : <태그>{{}}</태그> => react : {}
                             ---- ThymeLeaf 동일 => [[]]
           형식)
                Vue.createApp({
                   Model
                   data(){
                      return {
                         변수 ===> 여기에 설정된 변수만 수정시에 HTML에 적용
                      }
                   },
                   처리 => 데이터 갱신 : ViewModel
                   생명주기 함수 
                   사용자정의 함수
                   methods:{
                   
                   }, 
                   components:{
                      화면 조각 => 통합 
                   },
                   computed:{
                     
                   },
                   watch:{
                     
                   }
                })
        => Server : axios / fetch 
                            => 자바스크립트 지원 : OpenApi
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
  <%-- View--%>
  <div class="container">
    <div class="row">
     <select class="input-sm" v-model="column">
       <option value="type">음식종류</option>
       <option value="name">업체명</option>
       <option value="address">주소</option>
     </select>
     <input type=text size=20 class="input-sm" v-model="ss">
     <button type=button class="btn-sm btn-primary" @click="find()">검색</button>
    </div>
    <div class="row" style="margin-top: 20px">
      <div class="col-sm-3" v-for="vo in food_list">
        <a href="#">
          <div class="thumbnail">
            <img :src="vo.poster" :title="vo.address" style="width:250px;height: 150px;object-fit:cover">
            <p>{{vo.name}}</p>
          </div>
        </a>
      </div>
    </div>
    <div class="row text-center" style="margin-top: 20px">
      <pagecard></pagecard>
    </div>
  </div>
  <script>
    let find=Vue.createApp({
    	// 1. 서버에서 읽어오는 데이터 저장 => 변수 : Model
    	data(){
    		return {
    			startPage:0,
    			endPage:0,
    			totalpage:0,
    			curpage:1,
    			column:'address',
    			ss:'마포',
    			food_list:[]
    		}
    	},
    	// 2. 데이터를 제어 : ViewModel
    	mounted(){
    		this.dataRecv()
    		// => 자동 호출 => 생명주기 함수 
    	},
    	methods:{
    		// 사용자 정의 함수 : 반드시 호출이 필요
    		// axios.post(url,data,config)
    		dataRecv(){
    			
    			axios.post('../food/find_vue.do',{},{
    				
    				params:{
    					page:this.curpage,
    					column:this.column,
    					ss:this.ss
    				}
    					
    			})
    			.then(response=>{
    				console.log(response.data)
    				this.food_list=response.data.food_list
    				this.startPage=response.data.startPage
    				this.endPage=response.data.endPage
    				this.curpage=response.data.curpage
    				this.totalpage=response.data.totalpage
    			})
    		},
    		move(page){
    			this.curpage=page
    			this.dataRecv()
    		},
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
    	},
    	components:{
    		pagecard:page_card
    	},
    	computed:{
    		
    	}
    }).mount(".container")
  </script>
</body>
</html>




