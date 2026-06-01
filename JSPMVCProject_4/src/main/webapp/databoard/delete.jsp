<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:choose>
  <c:when test="${msg=='yes' }">
    <c:redirect url="list.do"/>
  </c:when>
  <c:when test="${msg=='no' }">
    <script>
     alert("비밀번호가 틀립니다");
     history.back()
    </script>
  </c:when>
</c:choose>