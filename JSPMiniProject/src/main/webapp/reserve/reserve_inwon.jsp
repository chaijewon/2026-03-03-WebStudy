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
  <table class="table">
    <tbody>
      <tr>
        <td>
          <c:forEach var="i" begin="2" end="5">
            <span class="btn btn-xs btn-danger">${i }</span>
          </c:forEach>
            <span class="btn btn-xs btn-danger">단체</span>
        </td>
      </tr>
    </tbody>
  </table>
</body>
</html>