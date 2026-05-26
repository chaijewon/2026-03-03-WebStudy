<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
    BoardModel model=new BoardModel();
    model.boardDetailData(request);
%>
<%--
       JSP 
        page => import/contentType
        taglib => prefix="사용자 지정" uri=""
                  <prefix: ~~ > => c/fmt/fn/
        => 자바를 대체하는 태그로 되어 있다 <% %>
           <c:forEach> <c:set> <c:if> <c:redirect> 
              for       변수선언  조건문    sendRedirect
           <fmt:formatDate> <fmt:formatNumber> 
             SimpleDateFormat   DecimalFormat
           fn:substring / fn:trim / fn:replace
        => EL  <%=%> 
           ${request.getAttribute()} 
           ${session.setAttribute()}
           -------------------------
           
           + / += (문자열 결합)
           -----------------
           == , != ,  < , > , <= , >=
           ------- 문자 , 숫자 , 날짜 
           삼항연산자 
           --------------------------
           
       MV구조 
         => HTML + JAVA 
         => HTML / JAVA ==> 분리 
             |      |
             --------
                 |
               Controller => Servlet => 최대한 자바를 분리한다 
       MVC ==> MVVM ==> MVP
               ----- VueJS
        | Spring은 MVC구조이다 
 --%>
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
   width:800px;
}
h3 {
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

let i=0;
//window.onload=function(){ let btn=document.querySelector(".delbtn")}
$(function(){
	$('.delbtn').click(function(){
		if(i===0)
		{
			i=1;
			$(this).text("취소")
			$('#del').show()
		}
		else
		{
			i=0;
			$(this).text("삭제")
			$('#del').hide()
		}
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3>내용 보기</h3>
      <table class="table">
        <tr>
          <th class="text-center success" width=20%>번호</th>
          <td class="text-center" width=30%>${vo.no }</td>
          <th class="text-center success" width=20%>작성일</th>
          <td class="text-center" width=30%>${vo.dbday }</td>
        </tr>
        <tr>
          <th class="text-center success" width=20%>이름</th>
          <td class="text-center" width=30%>${vo.name }</td>
          <th class="text-center success" width=20%>조회수</th>
          <td class="text-center" width=30%>${vo.hit }</td>
        </tr>
        <tr>
          <th class="text-center success" width=20%>제목</th>
          <td colspan="3">${vo.subject }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" 
            height="200">
          <pre style="white-space: pre-wrap;background: white;border: none">${vo.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a href="#" class="btn btn-xs btn-warning">수정</a>
            <span class="btn btn-xs btn-info delbtn">삭제</span>
            <a href="list.jsp" class="btn btn-xs btn-success">목록</a>
          </td>
        </tr>
        <tr style="display:none" id="del">
          <td colspan="4" class="text-right">
            비밀번호:<input type="password" class="input-sm" size=15>
            <input type=submit value="삭제" class="btn-sm btn-primary">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>