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
  <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>${vo.name} 상세보기</h2>
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
    <section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="row no-gutters">
                      <div class="col-12 col-sm-12">
                        <div class="related-post-area section_padding_50">
                                <h4 class="mb-30">인근 맛집</h4>
                               
                                <div class="related-post-slider owl-carousel">
                                    <!-- Single Related Post-->
                                    <c:forEach var="rvo" items="${list }">
                                    <div class="single-post">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <img src="${rvo.poster }" alt="">
                                        </div>
                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <div class="post-meta d-flex">
                                                <div class="post-author-date-area d-flex">
                                                    <%-- <!-- Post Author -->
                                                    <div class="post-author">
                                                        <a href="#">${rvo.type }</a>
                                                    </div>
                                                    <!-- Post Date -->
                                                    <div class="post-date">
                                                        <a href="#">${rvo.phone }</a>
                                                    </div> --%>
                                                </div>
                                            </div>
                                            <a href="#">
                                                <h6>${rvo.name}</h6>
                                            </a>
                                        </div>
                                    </div>
                                    </c:forEach>
                                   
                                </div>
                            </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>