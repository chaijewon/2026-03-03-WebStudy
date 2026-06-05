<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
   margin: 0px auto;
   width:960px;
}
p {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
    <c:forEach var="vo" items="${list }">
     <div class="col-md-3">
	    <div class="thumbnail">
	      <%-- 핵심 : 서버와 연결 = 필요한 데이터 전송 --%>
	      <a href="../food/detail.do?no=${vo.no }">
	        <img src="${vo.poster }" alt="${vo.address }" 
	           style="width:240px;height: 120px;object-fit:cover">
	        <div class="caption">
	          <p>${vo.name }</p>
	        </div>
	      </a>
	    </div>
	  </div>
	</c:forEach>
    </div>
    <div class="row text-center" style="margin-top: 20px">
      <ul class="pagination">
       <c:if test="${startPage>1 }">
        <li><a href="../main/main.do?page=${startPage-1 }">&laquo;</a></li>
       </c:if>
       
       <c:forEach var="i" begin="${startPage }" end="${endPage }">
         <li ${i==curpage?"class=active":"" }><a href="../main/main.do?page=${i }">${i }</a></li>
       </c:forEach>
       
       <c:if test="${endPage<totalpage }">
        <li><a href="../main/main.do?page=${endPage+1 }">&raquo;</a></li>
       </c:if>
      </ul>
    </div>
  </div>
</body>
</html>