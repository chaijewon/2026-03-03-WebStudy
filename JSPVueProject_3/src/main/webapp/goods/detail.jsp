<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
  width: 700px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
.btn {
  margin-left: 2px
}
h3{
  text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
  <div class="container" id="detailApp">
    <div class="panel panel-success product-card">
      <div class="panel-body">
        <div class="row">
          <div class="col-sm-6 text-center">
            <img :src="vo.goods_poster" class="img-responsive img-thumbnail" style="width: 100%;max-width: 350px">
          </div>
          <div class="col-sm-6">
            <h3>{{vo.goods_name}}</h3>
            <p class="text-muted">
             {{vo.goods_sub}}
            </p>
            <hr>
            <table class="table">
              <tr>
                <th width="15%">가격</th>
                <td width="85%">{{vo.goods_price}}</td>
              </tr>
              <tr>
                <th width="15%">특가</th>
                <td width="85%">{{vo.goods_discount}}%</td>
              </tr>
              <tr>
                <th width="15%">배송</th>
                <td width="85%">{{vo.goods_delivery}}</td>
              </tr>
            </table>
            <div class="form-inline">
              <button class="btn btn-primary">장바구니</button>
              <button class="btn btn-danger" @click="buyBtn()">바로구매</button>
              <button class="btn btn-success" @click="go">목록</button>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <div class="panel panel-success" style="margin-top: 20px">
      <div class="panel-body">
        <div class="row">
              <table class="table" v-if="replyList.length===0">
                <tr>
                  <td class="text-center">
                    <strong>댓글이 없습니다</strong>
                  </td>
                </tr>
              </table>
              <table class="table">
                <tr>
                  <td>
                    <table class="table" v-for="rvo in replyList" :key="rvo.no">
                      <tr>
                        <td class="text-left" width=80%>◑{{rvo.name}} ({{rvo.dbday}})</td>
                        <td class="text-right" width=20%>
                          <button class="btn-xs btn-success" v-if="rvo.id===loginId" @click="toggle(rvo)">{{rvo.show?"취소":"수정"}}</button>
                          <button class="btn-xs btn-info" v-if="rvo.id===loginId"
                           @click="deleteReply(rvo.no)"
                          >삭제</button>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" style="white-space: pre-wrap;">
                         {{rvo.msg}}
                        </td>
                      </tr>
                      
                      <tr v-show="rvo.show">
			             <td colspan="2">
			               <textarea rows="4" cols="60" style="float: left" v-model="rvo.umsg"></textarea>
			               <input type=button value="댓글수정" 
			               style="width: 100px;height: 88px;float: left;margin-left: 3px" 
			               class="btn-primary" @click="update(rvo)">
			             </td>
			           </tr>
                    </table>
                  </td>
                </tr>
              </table>
	          <table class="table" v-if="loginId">
	           <tr>
	             <td>
	               <textarea rows="4" cols="60" style="float: left" v-model="msg"></textarea>
	               <input type=button value="댓글쓰기" 
	               style="width: 100px;height: 88px;float: left;margin-left: 3px" 
	               class="btn-primary" @click="insert()">
	             </td>
	           </tr>
	          </table>
          
        </div>
      </div>
    </div>
  </div>
  <script>
    var IMP = window.IMP; 
    IMP.init("");
    let detail=Vue.createApp({
    	data(){
    		return {
    			no:${no},
    			vo:{},
    			cno:${cno},
    			replyList:[],
    			msg:'',
    			loginId:'${sessionScope.id}'
    		}
    	},
    	mounted(){
    		axios.get('../goods/detail_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(response=>{
    			console.log(response.data)
    			this.vo=response.data
    		})
    		
    		axios.get('../reply/list_vue.do',{
    			params:{
    				cno:this.cno,
    				rno:this.no
    			}
    		}).then(response=>{
    			console.log(response.data)
    			this.replyList=response.data
    			
    		
    		})
    	},
    	/*
    	     BOM / DOM 
    	      |
    	     
    	        window : 브라우저 = 외곽 담당(메뉴,상태바,주소창)
    	            = open / close 
    	            |
    	      -----------------------------
    	      |          |       |        |
    	    document   location history  screen 
    	                         back() / forward()
    	                href:화면 이동 
    	    (HTML화면 위치)
    	*/
    	methods:{
    		go(){
    			window.history.back()
    		},
    		buyBtn(){
    			this.requestPay(this.vo.goods_name,this.vo.price)
    		},
    		requestPay(name,price) {
    		   IMP.request_pay({
    		        pg: "html5_inicis",
    		        pay_method: "card",
    		        merchant_uid: "ORD20180131-0000011",   // 주문번호
    		        name: name ,
    		        amount: price,         // 숫자 타입
    		        buyer_email:'',
    		        buyer_name: '',
    		        buyer_tel: '',
    		        buyer_addr: '',
    		        buyer_postcode: ''
    		    }, function (rsp) { // callback
    		    	
    		    	alert("구매가 완료되었습니다.\n마이페이지에서 확인하세요")
    		    	//window.location.href="../mypage/buy_list.do"
    		    	//parent.Shadowbox.close()
    		   });
    		},
    		insert(){
    			axios.get('../reply/insert_vue.do',{
    				params:{
    					cno:this.cno,
    					rno:this.no,
    					msg:this.msg
    				}
    			}).then(response=>{
    				this.replyList=response.data
    				this.msg=''
    			})
    		},
    		deleteReply(no){
    			axios.get('../reply/delete_vue.do',{
    				params:{
    					no:no,
    					cno:this.cno,
    					rno:this.no
    				}
    			}).then(response=>{
    				this.replyList=response.data
    			})
    		},
    		toggle(rvo){
    			this.replyList.forEach(r=>{
    				if(r.no!=rvo.no)
    				{
    					r.show=false
    				}
    			})
    			rvo.show=!rvo.show
    		},
    		update(rvo){
    			axios.post('../reply/update_vue.do',{},{
    				params:{
    					no:rvo.no,
    					cno:rvo.cno,
    					rno:rvo.rno,
    					msg:rvo.umsg
    				}
    			}).then(response=>{
    				this.replyList=response.data
    			})
    		}
    		
    	}
    }).mount("#detailApp")
  </script>
</body>
</html>