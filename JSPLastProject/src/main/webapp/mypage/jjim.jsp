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
    <div class="info-card">
    <table>
     <tr>
       <th width=10%></th>
       <th width=20%>맛집명</th>
       <th width=40%>주소</th>
       <th width=15%>등록일</th>
       <th width=15%></th>
     </tr>
     <c:forEach var="vo" items="${list }">
     <tr>
       <td width=10%><img src="${vo.fvo.poster }" style="width: 30px;height: 30px"></td>
       <td width=20%>${vo.fvo.name }</td>
       <td width=40%>${vo.fvo.address }</td>
       <td width=15%>${vo.dbday }</td>
       <td width=15%>
        <a href="../jjim/jjim_cancel.do?jno=${vo.jno}" class="btn btn-sm btn-primary">취소</a>
       </td>
     </tr>
     </c:forEach>
    </table>
    </div>
  </main>
</body>
</html>