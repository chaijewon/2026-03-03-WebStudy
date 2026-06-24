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
  width: 960px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
</style>
</head>
<body>
  <div class="container">
    
    <div class="row">
        <c:forEach var="vo" items="${list }">
	      <div class="col-sm-3">
	        <a href="#">
	         <div class="thumbnail">
	           <img src="${vo.poster }" style="width: 250px;height: 150px;object-fit:cover">
	           <p>${vo.name}</p>
	         </div>
	        </a>
	      </div>
	    </c:forEach>
	</div>
	
	
    <div class="text-center" style="margin-top: 20px">
	    <ul class="pagination">
	      <c:if test="${startPage>1 }">
	        <li><a href="../goods/list.do?page=${startPage-1 }">&laquo;</a></li>
	      </c:if>
	      <c:forEach var="i" begin="${startPage }" end="${endPage }">
	        <li ${i==curpage?"class=active":"" }>
	           <a href="../goods/list.do?page=${i }">${i }</a></li>
	      </c:forEach>
	      <c:if test="${endPage<totalpage }">
	        <li><a href="../goods/list.do?page=${endPage+1 }">&raquo;</a></li>
	      </c:if>
	    </ul>
    </div>
  </div>
</body>
</html>