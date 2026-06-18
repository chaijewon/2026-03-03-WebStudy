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
                      <table class="table">
                                      <tr>
                                        <td width=30% class="text-center" rowspan="8">
                                          <img src="${vo.poster }"
                                            style="width: 340px;height: 350px"
                                            class="img-rounded">
                                        </td>
                                        <td colspan="2"><h3>${vo.name }</h3>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">주소</th>
                                        <td width=60%>${vo.address }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">전화</th>
                                        <td width=60%>${vo.phone }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">음식종류</th>
                                        <td width=60%>${vo.type }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">영업시간</th>
                                        <td width=60%>${vo.time }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">가격대</th>
                                        <td width=60%>${vo.price }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">주차</th>
                                        <td width=60%>${vo.parking }</td>
                                      </tr>
                                      <tr>
                                        <th width=10% style="color:gray">테마</th>
                                        <td width=60%>${vo.theme }</td>
                                      </tr>
                                      <tr>
                                       <td colspan="3">${vo.content }</td>
                                      </tr>
                                      <tr>
                                       <td colspan="3" class="text-right">
                                        <a href="#" class="btn btn-xs btn-danger">좋아요</a>
                                        <a href="#" class="btn btn-xs btn-info">찜하기</a>
                                        <a href="#" class="btn btn-xs btn-success">예약하기</a>
                                        <a href="../food/list.do" class="btn btn-xs btn-warning">목록</a>
                                       </td>
                                      </tr>
                                    </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>