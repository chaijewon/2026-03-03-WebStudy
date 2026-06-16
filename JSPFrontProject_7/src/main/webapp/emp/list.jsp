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
  <form method="post" action="../emp/list_ok.do">
  <table border=1 bordercolor=black width="500">
    <tr>
      <td>
        <c:forEach var="vo" items="${list }">
          <input type="checkbox" name="data" value="${vo.empno }">
          ${vo.ename }
        </c:forEach>
      </td>
    </tr>
    <tr>
      <td>
        <button type="submit">전송</button>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>