<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<style type="text/css">
.swiper{
  width: 800px;
  height: 400px;
}
.swiper-slide img{
  width: 100%;
  height: 100%;
  object-fit:cover;
}
</style>

</head>
<body>
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <img src="images/m1.jpg">
      </div>
      <div class="swiper-slide">
        <img src="images/m2.jpg">
      </div>
      <div class="swiper-slide">
        <img src="images/m3.jpg">
      </div>
      <div class="swiper-slide">
        <img src="images/m4.jpg">
      </div>
      <div class="swiper-slide">
        <img src="images/m5.jpg">
      </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
  </div>
  <script type="text/javascript">
	const swiper=new Swiper(".mySwiper",{
		loop:true,
		autoplay:{
			delay:2000
		},
		pagination:{
			el:'.swiper-pagination',
			checkable:true
		},
		navigation:{
			nextEl:'swiper-button-next',
			prevEl:'swiper-button-prev'
		}
	})
</script>
</body>
</html>