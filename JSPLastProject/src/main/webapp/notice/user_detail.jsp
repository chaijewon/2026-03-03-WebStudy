<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
/* 공지사항 카테고리 */
.notice-category {
    display: inline-block;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    color: #fff;
    line-height: 1.4;
    text-align: center;
}

/* 서비스/점검 안내 */
.notice-category.service {
    background-color: #2563eb; /* Blue */
}

/* 이벤트/프로모션 */
.notice-category.event {
    background-color: #ec4899; /* Pink */
}

/* 정책 변경 안내 */
.notice-category.policy {
    background-color: #f59e0b; /* Orange */
}

/* 영업/운영 공지 */
.notice-category.operation {
    background-color: #10b981; /* Green */
}

/* 행사/일정 안내 */
.notice-category.schedule {
    background-color: #8b5cf6; /* Purple */
}

</style>
</head>
<body>
   <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>상세보기</h2>
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
        <div class="container">
            <div class="row" style="width: 960px;margin: 0px auto">
              <table class="table">
               <tr>
                 <th width=20% class="text-center danger">공지종류</th>
                 <td width=30% class="text-center">
                     <c:choose>
	                    <c:when test="${vo.type==1 }">
	                     <span class="notice-category service">서비스/점검</span>
	                    </c:when>
	                    <c:when test="${vo.type==2 }">
	                     <span class="notice-category event">이벤트</span>
	                    </c:when>
	                    <c:when test="${vo.type==3 }">
	                     <span class="notice-category policy">정책변경</span>
	                    </c:when>
	                    <c:when test="${vo.type==4 }">
	                     <span class="notice-category operation">영업/운영</span>
	                    </c:when>
	                    <c:when test="${vo.type==5 }">
	                     <span class="notice-category schedule">행사/일정</span>
	                    </c:when>
	                  </c:choose>
                 </td>
                 <th width=20% class="text-center danger">작성일</th>
                 <td width=30% class="text-center">${vo.dbday }</td>
               </tr>
               <tr>
                 <th width=20% class="text-center danger">작성자</th>
                 <td width=30% class="text-center">${vo.name }</td>
                 <th width=20% class="text-center danger">조회수</th>
                 <td width=30% class="text-center">${vo.hit }</td>
               </tr>
               <tr>
                 <th width=20% class="text-center danger">제목</th>
                 <td colspan="3" class="text-center">${vo.subject }</td>
               </tr>
               <tr>
                 <td colspan="4" class="text-left" valign="top" height="200">
                   <pre style="white-space: pre-wrap;border:none;background: white;">${vo.content }</pre>
                 </td>
               </tr>
               <tr>
                 <td colspan="4" class="text-right">
                  <a href="../notice/user_list.do" class="btn btn-sm btn-danger">목록</a>
                 </td>
               </tr>
              </table>
            </div>
        </div>
    </section>

</body>
</html>