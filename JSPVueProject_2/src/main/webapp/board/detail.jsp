<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      1. MVC 
      2. MyBatis 
      3. JSP 
      ----------- Back 
      4. Jquery 
      5. Ajax : 예약
      6. Vue : 검색 / 댓글 
      ------------------ 게시판 / 회원 가입 / 로그인 / 회원 수정 / 회원 탈퇴
      => 목록 페이지 / 상세보기 / 좋아요 / 찜하기 
      => 공지사항 
      => 관리 /마이페이지 
         --- 
      ------------------------ 최종 : ThymeLeaf + Pinia 
      Next (react) 
      => CI/CD => 우분투 명령어 => AWS
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
.btn-xs {
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
      <h3>내용보기</h3>
      <table class="table">
        <tbody>
          <tr>
            <th width=20% class="danger text-center">번호</th>
            <td width=30% class="text-center">{{detail.no}}</td>
            <th width=20% class="danger text-center">작성일</th>
            <td width=30% class="text-center">{{detail.dbday}}</td>
          </tr>
          <tr>
            <th width=20% class="danger text-center">이름</th>
            <td width=30% class="text-center">{{detail.name}}</td>
            <th width=20% class="danger text-center">조회수</th>
            <td width=30% class="text-center">{{detail.hit}}</td>
          </tr>
          <tr>
            <th width=20% class="danger text-center">제목</th>
            <td colspan="3">{{detail.subject}}</td>
          </tr>
          <tr>
            <td colspan="4" class="text-left" valign="top" height="200">
              <pre style="white-space: pre-wrap;background: white;border: none">{{detail.content}}</pre>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="text-right">
             <a :href="'../board/update.do?no='+no" class="btn btn-xs btn-warning">수정</a>
             <a class="btn btn-xs btn-warning a-link"
              @click="btnClick()">{{isOn?'삭제':'취소'}}</a>
             <a href="../board/list.do" class="btn btn-xs btn-warning">목록</a>
            </td>
          </tr>
          <tr v-show="bShow">
            <td colspan="4" class="text-right">
             비밀번호:<input type="password" size=15 class="input-sm" 
                     ref="pwdRef" v-model="pwd">
                     <%-- v-model : data()안에 있는 변수 연결 
                          입력시에 바로 pwd변수에 값을 채운다 => 양방향
                          let pwd=$('#pwd').val() => 처리 => 단반향
                          
                      --%>
                    <button class="btn-sm btn-primary" @click="del()">삭제</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
   </div>
   <script>
    let detailApp=Vue.createApp({
    	// 변수 설정 
    	data(){
    		return {
    			bShow:false,
    			msg:'삭제',
    			isOn:true,
    			pwd:'',
    			detail:{}, //VO
    			no:${param.no}
    		}
    	},
    	// 자동 호출 => 생명주기 함수 
    	/*
    	    ***created() : Vue객체가 생성 
    	    ***mounted() : 브라우저에 화면 출력이 된 경우 
    	       window.onload=function(){} = 바닐라JS 
    	       $(function(){})
    	       componentDidMount() : React 
    	        => useEffect()
    	       main()
    	    updated() : data()안에 있는 데이터가 수정되는 경우 
    	    unmounted() : 화면 이동 / 브라우저 종료 / 새로 고침 
    	*/
    	mounted(){
    		// board/detail_vue.do?no=1
    		axios.get('../board/detail_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(response=>{
    			this.detail=response.data
    			console.log(response.data)
    			// response => 실행된 결과를 자동으로 첨부한다 
    		})
    	},
    	methods:{
    		btnClick(){
    			this.isOn=!this.isOn
    			this.bShow=!this.bShow
    		},
    		del(){
    			if(this.pwd.trim()==="")
    			{
    				this.$refs.pwdRef.focus()
    				return
    			}
    			
    			// 데이터 전송 
    			axios.get('../board/delete_vue.do',{
    				params:{
    					no:this.no,
    					pwd:this.pwd
    				}
    			}).then(response=>{
    				if(response.data==='yes')
    				{
    					window.location.href="../board/list.do"
    				}
    				else
    				{
    					alert("비밀번호가 틀립니다!!")
    					this.pwd=''
    					this.$refs.pwdRef.focus()
    				}
    			})
    		}
    	}
    }).mount(".container")
   </script>
</body>
</html>




