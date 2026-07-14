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
          <th width="40%">제목</th>
          <th width="10%">이름</th>
          <th width="15%">작성일</th>
          <th width="10%">조회수</th>
          <th width="15%"></th>
        </tr>
        <c:forEach var="vo" items="${nList }">
          <tr>
              <td width="10%">${vo.no }</td>
	          <td width="40%">${vo.subject }</td>
	          <td width="10%">${vo.name }</td>
	          <td width="15%">${vo.dbday }</td>
	          <td width="10%">${vo.hit }</td>
	          <td width="15%">
	            <a href="../notice/update.do?no=${vo.no }" class="btn btn-sm btn-info">수정</a>
	            <a href="../notice/delete.do?no=${vo.no }" class="btn btn-sm btn-warning">삭제</a>
	          </td>
          </tr>
        </c:forEach>
      </table>
    </section>
  </main>
</body>
</html>