<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      vue 디렉티브
      v-bind / : => HTML 속성 바인딩 => 속성에 변수값 설정
      v-model : 양방향 (input , select , textarea , checkbox , radio)
      v-if / v-else : 조건문 
      v-show : 토글 (true:show , false:hide)
      v-for : 반복 수행 => :key=""
        => v-for="(vo,index) in 배열"
      ***v-on / @ => 이벤트 리스너 
         @keydown.enter / @keydown.space ....
      v-once : 한번만 수행 => id 출력 
      v-text / {{}} : <>값 출력</> 
      v-html : html 파싱이 된다 
      =======================================
      로그인 / 회원 가입 (검증) 
           v-model / @submit.prevent, v-show , v-bind:disabled
      목록 : v-for , v-model , v-html
            => <img :src="">
      검색 (필터링) : v-model / computed / v-for / v-if  
                             | 상품 출력 1,000   
      app.directive('focus',{함수처리}) => 사용자 정의 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.page-link{
  cursor: pointer;
}
</style>
</head>

<body>
    <section class="archive-area section_padding_80" id="findApp">
        <div class="container" style="width: 1024px">
            <div class="row">
             <div class="col-12">
               
	               <select v-model="column" class="input-sm">
	                <option value="address">주소</option>
	                <option value="type">음식종류</option>
	                <option value="name">업체명</option>
	               </select>
	               <input type="text" size="20" class="input-sm" v-model="fd" @keydown.enter="find()" ref="findRef">
	               <button type=button class="btn-sm btn-primary" @click="find()">검색</button>
                
             </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-12 col-md-6 col-lg-4" v-for="(vo,index) in list" :key="index">
                    <div class="single-post wow fadeInUp" data-wow-delay="1.2s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                           <a :href="'../food/detail_before.do?no='+vo.no">
                            <img :src="vo.poster" alt="">
                           </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-date">
                                        <a href="#">{{vo.type}}</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> {{vo.likecount }}</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> {{vo.replycount }}</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a :href="'../food/detail.do?no='+vo.no">
                                <h4 class="post-headline">{{vo.name }}</h4>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               
                                <li class="page-item" v-if="startPage>1">
                                    <a class="page-link" @click="pageChange(startPage-1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i>이전</a>
                                </li>
                              
                                
                               
                                <li 
                                 v-for="i in range(startPage,endPage)"
                                 :class="i==curpage?'active':'' + ' page-item'"
                                ><a class="page-link" @click="pageChange(i)">{{i }}</a></li>
                               
                                
                               
                                <li class="page-item" v-if="endPage<totalpage">
                                    <a class="page-link" @click="pageChange(endPage+1)">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                               
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page {{curpage }} of {{totalpage }} results</p>
                        </div>
                    </div>
                </div>

            </div>
            
        </div>
    </section>
    <script>
     /*
         Vue.createApp({
        	 // 제어하는 변수 설정 => state:{}(react)
    	     data(){
    	    	 return {
    	    		 
    	    	 }
    	     },
    	     생명주기 함수 
    	     mounted(){} / updated(){} / created(){}
    	                                  | WebScoket 연동
    	                    | 데이터 변경시마다 처리 
    	        | 서버와 연결후 데이터 읽는 경우
    	     사용자 함수 
    	     methods:{
    	    	 가장 많이 사용 => 이벤트 처리 
    	     },
    	     컴포넌트 : 반복 / 다른 내용을 출력 목록 / (상세보기)
    	              결재 => 배송지 
    	     components:{
    	    	 태그명:component명
    	    	 aaa  => 호출 <aaa></aaa> : react
    	    	 <pagecard>
    	     },
    	     computed:{
    	    	 계산 처리 / 문자열 처리 
    	     },
    	     watch:{
    	    	 => 컴포넌트의 동작 감시 
    	     }
    	     => data,methods => 반드시 this.
         }).mount("#findApp")
     */
     let findApp=Vue.createApp({
    	 data(){
    		 return {
    			 column:'address',
    			 fd:'마포',
    			 curpage:1,
    			 totalpage:0,
    			 startPage:0,
    			 endPage:0,
    			 list:[]
    		 }
    	 },
    	 // 서버 연결
    	 mounted(){
    		 this.dataRecv()
    	 },
    	 methods:{
    		 async dataRecv(){
    			 await axios.get('../food/find_vue.do',{
    				 params:{
    					 page:this.curpage,
    					 column:this.column,
    					 fd:this.fd
    				 }
    			 }).then(response=>{
    				 this.list=response.data.list
    				 this.curpage=response.data.curpage
    				 this.totalpage=response.data.totalpage
    				 this.startPage=response.data.startPage
    				 this.endPage=response.data.endPage
    				 this.fd=response.data.fd
    				 this.column=response.data.column
    				 console.log(response)
    			 })
    		 },
    		 find(){
    			 if(this.fd.trim()==="")
    			 {
    				 this.$refs.findRef.focus()
    				 // $().focus()
    				 return
    			 }
    			 this.curpage=1
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
    		 },
    		 pageChange(page){
    			 this.curpage=page
    			 this.dataRecv()
    		 }
    	 }
     }).mount("#findApp")
    </script>
</body>
</html>