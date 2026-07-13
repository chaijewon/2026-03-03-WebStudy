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
  <main class="admin-main">
    <h2>📅 공지사항</h2>
    <section class="recent-section">
      <table>
        <tr>
         <td>
           <a href="../adminpage/insert.do" class="btn btn-sm btn-primary">등록</a>
         </td>
        </tr>
      </table>
      <table>
        <tr>
          <th width="10%">번호</th>
          <th width="45%">제목</th>
          <th width="15%">이름</th>
          <th width="20%">작성일</th>
          <th width="10%">조회수</th>
        </tr>
        <c:forEach var="vo" items="${nList }">
          <tr>
              <td width="10%">${vo.no }</td>
	          <td width="45%">${vo.subject }</td>
	          <td width="15%">${vo.name }</td>
	          <td width="20%">${vo.dbday }</td>
	          <td width="10%">${vo.hit }</td>
          </tr>
        </c:forEach>
      </table>
    </section>
  </main>
</body>
</html>