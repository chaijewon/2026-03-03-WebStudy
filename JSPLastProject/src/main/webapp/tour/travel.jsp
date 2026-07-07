<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
  <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>${title }</h2>
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
        <div class="container" style="width: 1024px">
            <div class="row">

                <c:forEach var="vo" items="${list }"> 
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="1.2s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="${vo.firstimage }" alt="" 
                            onerror="this.src='../tour/no.png'"
                            style="width: 510px;height: 300px"
                            >
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-date">
                                        <a href="#">${vo.addr1}</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> ${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> ${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <h4 class="post-headline">${vo.title }</h4>
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                <li class="page-item">
                                    <a class="page-link" href="../tour/travel.do?page=${stratPage-1 }&contenttypeid=${cti}&areaCode=${ac}"><i class="fa fa-angle-double-left" aria-hidden="true"></i>이전</a>
                                </li>
                               </c:if>
                                
                               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../tour/travel.do?page=${i }&contenttypeid=${cti}&areaCode=${ac}">${i }</a></li>
                               </c:forEach> 
                                
                               <c:if test="${endPage<totalpage }">
                                <li class="page-item">
                                    <a class="page-link" href="../tour/travel.do?page=${endPage+1 }&contenttypeid=${cti}&areaCode=${ac}">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                               </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</body>
</html>