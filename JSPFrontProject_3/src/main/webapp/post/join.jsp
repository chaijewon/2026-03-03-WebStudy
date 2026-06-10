<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      표준 객체 
        = String 
        = Math
        = Number
        = Array 
        = JSON
        = Date
      BOM 객체 (브라우저 내장 객체)
           window (브라우저 외부관리) => 메뉴바 , 상태바 => open/close
             | ==> shadowbox / whitebox / modal => 라이브러리 
               ==> 알림창 (사용자)
      ------------------------------
      |         |       |          |     
   document   location history  screen 
                                 => 레이아웃 => width/height
                       back() / forward
    | 화면 출력   href (화면 이동)
      write() / querySelector 
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
  width: 600px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript">

function postfind()
{
	window.open('postfind.do','postfind','width=530,height=450,scrollbars=yes')
}
</script>
</head>
<body>
  <div class="container">
    <div class="row">
     <h1>회원 가입</h1>
     <form name="frm">
     <table class="table">
       <tr>
        <th width=20% class="text-center">우편번호</th>
        <td width=80%>
         <input type=text name=post1 size=7 class="input-sm" readonly>
         - <input type=text name=post2 size=7 class="input-sm" readonly>
         <button class="btn-sm btn-danger" onclick="postfind()">우편번호 검색</button>
        </td>
       </tr>
       <tr>
        <th width=20% class="text-center">주소</th>
        <td width=80%>
         <input type=text name=addr size=43 class="input-sm" readonly>
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>