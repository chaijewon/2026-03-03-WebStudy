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
.container {
   margin-top: 50px;
}
.row {
   margin: 0px auto;
   width: 900px;
}
h3 {
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0; // number (int , double)
/*
     변수 설정 
     var / let / const => 자동 데이터형 대입 
                 ------ 상수 
          ---- ES6
     --- ES5
     => var은 지역변수인데 {}을 벗어나도 사용이 가능 => 사용영역이 명확하지 않는다 
     => let은 {}을 벗어나면 자동 메모리 해제 
     
     let i=10; int
     let i=10.5; double 
     let i="" : string 
     let i=[] : array
     let i={} : object 
     
     let i=10;
     i="Hello";
     i=[];
     i={}
     -------------- 데이터형 고정 (TypeScript)
     let i:string=""
     
 */
$(function(){
	// $('#delSpan') => 바닐라JS  => document.querySelector("#delSpan")
	$('#delSpan').on('click',function(){
		if(i===0) // 10===10  10==10 10=="10" 10==="10"
		{
			$(this).text("취소")
			$('#delTr').show()
			i=1;
		}
		else
		{
			$(this).text("수정")
			$('#delTr').hide()
			i=0;
			
		}
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3>상세 보기</h3>
      <table class="table">
       <tr>
         <th width=20% class="success text-center">번호</th> 
         <td width=30% class="text-center">${vo.no }</td> 
         <th width=20% class="success text-center">작성일</th> 
         <td width=30% class="text-center">${vo.dbday }</td> 
       </tr>
       <tr>
         <th width=20% class="success text-center">이름</th> 
         <td width=30% class="text-center">${vo.name }</td> 
         <th width=20% class="success text-center">조회수</th> 
         <td width=30% class="text-center">${vo.hit }</td> 
       </tr>
       <tr>
         <th width=20% class="success text-center">제목</th> 
         <td colspan="3">${vo.subject }</td> 
       </tr>
       <c:if test="${vo.filesize!=0 }">
         <tr>
          <th width=20% class="success text-center">첨부파일</th> 
          <td colspan="3">
            <a href="download.jsp?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)
          </td> 
         </tr>
       </c:if>
       <tr>
         <td colspan="4" class="text-left" valign="top" height="200">
           <pre style="white-space: pre-wrap;background: white;border:none">${vo.content }</pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
           <a href="#" class="btn btn-xs btn-warning">수정</a>
           <span class="btn btn-xs btn-warning" id="delSpan">삭제</span>
           <a href="list.do" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
       <tr style="display:none" id="delTr">
         <form method="post" action="delete.do">
          <td colspan="4" class="text-right">
          비밀번호:<input type=password size=10 class="input-sm"
                 name=pwd>
                 <input type="hidden" name=no value="${vo.no}">
          <button class="btn-sm btn-danger" type="submit">삭제</button>
          </td>
         </form>
       </tr>
      </table>
    </div>
  </div>
</body>
</html>