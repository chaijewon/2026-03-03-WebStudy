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
</head>
<body>
  <div class="container" id="detailApp">
    <div class="panel panel-success product-card">
      <div class="panel-body">
        <div class="row">
          <table class="table">
          <tbody>
           <tr>
             <th width=30% class="text-center" rowspan="8">
              <img :src="vo.poster" style="width:100%;object-fit:cover">
             </th>
             <td colspan="2"><h3>{{vo.name}}</h3></td>
           </tr>
           <tr>
             <th width=10% class="text-center">주소</th>
             <td width=60%>{{vo.address}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">전화</th>
             <td width=60%>{{vo.phone}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">음식종류</th>
             <td width=60%>{{vo.type}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">주차</th>
             <td width=60%>{{vo.parking}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">가격대</th>
             <td width=60%>{{vo.price}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">영업시간</th>
             <td width=60%>{{vo.time}}</td>
           </tr>
           <tr>
             <th width=10% class="text-center">테마</th>
             <td width=60%>{{vo.theme}}</td>
           </tr>
           <tr>
             <td colspan="3">{{vo.content}}</td>
           </tr>
           <tr>
             <td colspan="3" class="text-right">
              <button type="button" class="btn-xs btn-danger" v-if="loginId">좋아요</button>
              <button type="button" class="btn-xs btn-success" v-if="loginId">찜하기</button>
              <button type="button" class="btn-xs btn-info" v-if="loginId">예약하기</button>
              <button type="button" class="btn-xs btn-primary" @click="go()">목록</button>
             </td>
           </tr>
         </tbody>
        </table>
        </div>
      </div>
    </div>
    <div class="panel panel-success product-card">
      <div class="panel-body">
        <script src="../commos/replycard.js"></script>
        <replycard :cno="cno" :rno="no" :login-id="loginId"></replycard>
      </div>
    </div>
    <!-- <div class="panel panel-success product-card">
      <div class="panel-body">
        <script src="replycard.js"></script>
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
  </div> -->
  <script>
    let app=Vue.createApp({
        data(){
        	return {
        		no:${no},
        		cno:${cno},
        		vo:{},
        		loginId:'${sessionScope.id}'
        	}
        },
        mounted(){
        	axios.get('../food/detail_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(response=>{
    			console.log(response.data)
    			this.vo=response.data
    		})
        },
        methods:{
        	go(){
        		window.history.back()
        	}
        },
        components:{
        	replycard:ReplyComponent
        }
    }).mount("#detailApp")
  </script>
</body>
</html>