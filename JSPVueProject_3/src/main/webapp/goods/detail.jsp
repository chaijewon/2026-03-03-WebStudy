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
  </div>
  <script>
    var IMP = window.IMP; 
    IMP.init("");
    let detail=Vue.createApp({
    	data(){
    		return {
    			no:${param.no},
    			vo:{}
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
    		}
    	}
    }).mount("#detailApp")
  </script>
</body>
</html>