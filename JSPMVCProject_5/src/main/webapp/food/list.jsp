<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
   주로 사용 => 제어문 <c:forEach> <c:if> <c:choose>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 960px;
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
     <%-- for(FoodVO vo:list) --%>
     <c:forEach var="vo" items="${list }">
         <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="${vo.poster }" 
		           alt="${vo.address }" style="width:240px;120px;object-fit:cover">
		        <div class="caption">
		          <p>${vo.name }</p>
		        </div>
		      </a>
		    </div>
		  </div>
     </c:forEach>
    </div>
   </div>
</body>
</html>