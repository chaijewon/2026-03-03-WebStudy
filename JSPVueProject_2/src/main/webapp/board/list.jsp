<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     JSP : HTML+JAVA => 분리 (MVC)
           View Model
            |    |
            ------
               |
            Controller  : 분업 
            
     DAO : SQL + JAVA  => MyBatis 
     -----------------------------
      JSP => 깜박 거림 효과 / 입력된 데이터를 손실 
             1. Ajax => 중간에 HTML을 만들어서 첨부 
             2. Vue => HTML자체 제어 
                JSP => HTML을 이용 => 태그에서 제어 : ThymeLeaf
     
     ThymeLeaf + Spring-Boot(MVC) + Pinia
     -------------------------------------> MyBatis 
     React는 CDN => Mudule => 개인 프로젝트 
     ----- NextJS
     ----- CI/CD        
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
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
button {
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
  <div class="container">
    <div class="row">
      <h3>Vue를 이용한 게시판</h3>
      <table class="table">
        <tbody>
          <tr>
            <td>
             <a href="../board/insert.do" class="btn btn-sm btn-warning">새글</a>
            </td>
          </tr>
        </tbody>
      </table>
      <table class="table table-striped">
        <thead>
          <tr class="danger">
           <th width=10% class="text-center">번호</th>
           <th width=45% class="text-center">제목</th>
           <th width=15% class="text-center">이름</th>
           <th width=20% class="text-center">작성일</th>
           <th width=10% class="text-center">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(vo,index) in list" :key="index">
           <td width=10% class="text-center">{{vo.no}}</th>
           <td width=45%><a :href="'../board/detail.do?no='+vo.no">{{vo.subject}}</a></th>
           <td width=15% class="text-center">{{vo.name}}</th>
           <td width=20% class="text-center">{{vo.dbday}}</th>
           <td width=10% class="text-center">{{vo.hit}}</th>
          </tr>
          <tr>
            <td colspan="5" class="text-center">
              <button class="btn-sm btn-primary" type="button" @click="prev()">이전</button>
              {{curpage}} page / {{totalpage}} pages
              <button class="btn-sm btn-primary" type="button" @click="next()">다음</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <script type="importmap">
   {
      "imports":{
         "vue":"https://unpkg.com/vue@3/dist/vue.esm-browser.js"
      }
   }
  </script>
  <%--
        import java.util.Scanner
   --%>
  <script type="module">
    import {createApp} from "vue"
    const app=createApp({
        // 변수 설정 => HTML에 적용 => 호출시에는 반드시 this.
        data(){
           return {
              curpage:1,
              totalpage:0,
              count:0,
              list:[]
           }
        },
        // 시작과 동시에 서버에서 데이터 값 읽기
        mounted(){
            // $(function(){}) , window.onload=function(){}
            // created() / updated()
            this.dataRecv()
        },
        // 사용자 정의 함수 
        methods:{
            async dataRecv(){
              await axios.get('../board/list_vue.do',{
                  params:{
                    page:this.curpage
                  }
              }).then(response=>{
                 console.log(response.data)
                 this.list=response.data.list
                 this.curpage=response.data.curpage
                 this.totalpage=response.data.totalpage
                 this.count=response.data.count
              })
            },
            prev(){
               this.curpage=this.curpage>1?this.curpage-1:this.curpage
               this.dataRecv()
            },
            next(){
               this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
               this.dataRecv()
            }
        }
    })
    app.mount(".container")
  </script>
</body>
</html>