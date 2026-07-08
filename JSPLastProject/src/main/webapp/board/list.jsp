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
  font-size: 14px
}
.rounded-head th:first-child{
    border-top-left-radius:12px;
}

.rounded-head th:last-child{
    border-top-right-radius:12px;
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
        <div class="container" style="width: 960px">
            <div class="row">
              <table class="table">
                <tr>
                  <td>
                    <a href="../board/insert.do" class="btn btn-sm btn-primary shadow-sm">
                     <i class="fa fa-pencil"></i>새글
                    </a>
                  </td>
                </tr>
              </table>
              
              <table class="table mb-0">
               <thead class="bg-success text-white rounded-head">
                <tr>
                  <th width=10% class="text-center">번호</th>
                  <th width=45% class="text-center">제목</th>
                  <th width=15% class="text-center">이름</th>
                  <th width=20% class="text-center">작성일</th>
                  <th width=10% class="text-center">조회수</th>
                </tr>
               </thead>
                <c:set var="count" value="${count }"/>
                <c:forEach var="vo" items="${list }">
	                <tr class="dataTr">
	                  <td width=10% class="text-center">${count }</td>
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
	                <c:set var="count" value="${count-1 }"/>
                </c:forEach>
                <tr>
                  <td colspan="5" class="text-center">
                    <a href="../board/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger"><i class="fa fa-chevron-left"></i> 이전</a>
                     ${curpage } page / ${totalpage } pages
                    <a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-danger">다음 <i class="fa fa-chevron-right"></i></a>
                  </td>
                </tr>
              </table>
              
            </div>
        </div>
    </section>
</body>
</html>