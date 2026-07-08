<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dataTr td{
  font-size: 12px
}
</style>
</head>
<body>
   <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>자유 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="archive-area section_padding_80">
        <div class="container" style="width: 800px">
            <div class="row">
              <table class="table">
                <tr>
                  <td>
                    <a href="../board/insert.do" class="btn btn-sm btn-primary">새글</a>
                  </td>
                </tr>
              </table>
              <table class="table">
                <tr class="bg-success">
                  <th width=10% class="text-center">번호</th>
                  <th width=45% class="text-center">제목</th>
                  <th width=15% class="text-center">이름</th>
                  <th width=20% class="text-center">작성일</th>
                  <th width=10% class="text-center">조회수</th>
                </tr>
                <c:forEach var="vo" items="${list }">
	                <tr class="dataTr">
	                  <td width=10% class="text-center">${vo.no }</td>
	                  <td width=45%>
	                    <%--
	                       일반 => 상세보기 = Primary Key 전송 
	                                       결정자 
	                     --%>
	                    <a href="../board/detail.do?no=${vo.no }">${vo.subject }</a>
	                    <c:if test="${vo.dbday==today }">
	                      <sup><img src="../img/new.gif"></sup>
	                    </c:if>
	                  </td>
	                  <td width=15% class="text-center">${vo.name }</td>
	                  <td width=20% class="text-center">${vo.dbday }</td>
	                  <td width=10% class="text-center">${vo.hit }</td>
	                </tr>
                </c:forEach>
                <tr>
                  <td colspan="5" class="text-center">
                    <a href="#" class="btn btn-sm btn-danger">이전</a>
                     ${curpage } page / ${totalpage } pages
                    <a href="#" class="btn btn-sm btn-danger">다음</a>
                  </td>
                </tr>
              </table>
            </div>
        </div>
    </section>
</body>
</html>