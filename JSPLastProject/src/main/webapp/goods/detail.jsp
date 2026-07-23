<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/goods_detail.css">
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>상품 상세보기</h2>
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
		<div class="product-container">
		
		    <!-- 상품 이미지 -->
		    <div class="product-image">
		        <img src="${vo.goods_poster}" 
		             alt="${vo.goods_name}">
		    </div>
		
		
		    <!-- 상품 정보 -->
		    <div class="product-info">
		
		        <h2>${vo.goods_name}</h2>
		
		        <div class="price">
		            <span style="text-decoration:line-through; color:#999;">
				        ${vo.goods_price}
				    </span>
				    <br>
				
				    <span style="color:#e60023; font-size:28px;">
				        <fmt:formatNumber value="${vo.price}" pattern="##,###"/>원
				    </span>
				
				    <span style="color:green; font-size:18px;">
				        (${vo.goods_discount}% 할인 / 첫구매)
				    </span>
		        </div>
		        
		
		        <div class="delivery">
		            🚚 배송정보 :
		            ${vo.goods_delivery}
		        </div>
		
		
		        <hr>
		
		
		        <div class="description">
		          
		            <p>
		                ${vo.goods_sub}
		            </p>
		        </div>
		
		
		        <!-- 수량 -->
		        <div class="quantity">
		            수량 :
		            <button>-</button>
		            <input type="text" value="1" data-account="${vo.stock }">
		            <button>+</button>
		        </div>
		
		
		        <div class="button-area">
		
		            <!-- 장바구니 -->
		            <button class="cart-btn"
		                    onclick="addCart()">
		                장바구니
		            </button>
		
		
		            <!-- 바로 구매 -->
		            <button class="buy-btn"
		                    onclick="buyNow()">
		                바로 구매
		            </button>
		
		        </div>
		
		    </div>
		
		</div>
		<div class="review-container">

		    <h3>상품 리뷰</h3>
		
		    <!-- 댓글 작성 -->
		    <div class="review-write">
		        <textarea id="reviewContent" 
		                  placeholder="상품에 대한 리뷰를 작성해주세요."
		                  rows="4"></textarea>
		
		        <button class="review-btn" onclick="insertReview()">
		            리뷰 등록
		        </button>
		    </div>
		
		
		    <!-- 댓글 목록 -->
		    <div class="review-list">
		
		        <div class="review-item">
		            <div class="review-user">
		                ⭐ 홍길동
		            </div>
		
		            <div class="review-content">
		                상품이 정말 좋아요. 배송도 빠릅니다.
		            </div>
		
		            <div class="review-date">
		                2026-07-20
		            </div>
		        </div>
		
		
		        <div class="review-item">
		            <div class="review-user">
		                ⭐ 김철수
		            </div>
		
		            <div class="review-content">
		                재구매 의사 있습니다.
		            </div>
		
		            <div class="review-date">
		                2026-07-19
		            </div>
		        </div>
		
		    </div>
		
		</div>
	  </div>
	</div>
  </section>
</body>
</html>