<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	               <input type="text" size="20" class="input-sm" v-model="fd">
	               <button type=button class="btn-sm btn-primary">검색</button>
                
             </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="1.2s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                           <a href="../food/detail_before.do?no=${vo.no }">
                            <img src="${vo.poster }" alt="">
                           </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-date">
                                        <a href="#">${vo.type}</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> ${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> ${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail.do?no=${vo.no }">
                                <h4 class="post-headline">${vo.name }</h4>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/food_main.do?page=${stratPage-1 }"><i class="fa fa-angle-double-left" aria-hidden="true"></i>이전</a>
                                </li>
                               </c:if>
                                
                               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../food/food_main.do?page=${i }">${i }</a></li>
                               </c:forEach> 
                                
                               <c:if test="${endPage<totalpage }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/food_main.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                               </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
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
    				 //this.list=response.data.list
    				 //this.curpage=response.data.curpage
    				 console.log(response.data)
    			 })
    		 }
    	 }
     }).mount("#findApp")
    </script>
</body>
</html>