<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <main class="mypage-main">
    <h2>찜 정보</h2>
    <table>
     <tr>
       <th></th>
       <th>맛집명</th>
       <th>주소</th>
       <th>등록일</th>
       <th></th>
     </tr>
     <c:forEach var="vo" items="${list }">
     <tr>
       <td><img src="${vo.fvo.poster }" style="width: 30px;height: 30px"></td>
       <td>${vo.fvo.name }</td>
       <td>${vo.fvo.address }</td>
       <td>${vo.dbday }</td>
       <td>
        <a href="#" class="btn btn-sm btn-primary">취소</a>
       </td>
     </tr>
     </c:forEach>
    </table>
  </main>
</body>
</html>