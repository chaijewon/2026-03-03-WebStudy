<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>대한민국 관광 포털</title>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">

        <a class="navbar-brand font-weight-bold" href="#">
            TOUR KOREA
        </a>

        <button class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class="collapse navbar-collapse" id="navbarMenu">

            <ul class="navbar-nav ml-auto">

                <li class="nav-item">
                    <a class="nav-link" href="#">관광명소</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">맛집</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">쇼핑</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">축제</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">여행코스</a>
                </li>

            </ul>

        </div>

    </div>
</nav>


<!-- Hero -->
<section class="hero">

    <div class="container text-center">

        <h1 class="display-4">
            대한민국의 아름다운 여행지
        </h1>

        <p>
            새로운 경험과 추억을 만들어 보세요
        </p>


        <div class="search-box">

            <input type="text"
                   class="form-control"
                   placeholder="어디로 여행을 떠나시나요?">

            <button class="btn btn-primary">
                검색
            </button>

        </div>

    </div>

</section>



<!-- Category -->
<section class="container mt-5">

<h3 class="mb-4">
    인기 카테고리
</h3>


<div class="row text-center">

    <div class="col-md-2 col-4">
        <div class="category">
            🏯<br>
            역사
        </div>
    </div>


    <div class="col-md-2 col-4">
        <div class="category">
            🌲<br>
            자연
        </div>
    </div>


    <div class="col-md-2 col-4">
        <div class="category">
            🎡<br>
            체험
        </div>
    </div>


    <div class="col-md-2 col-4">
        <div class="category">
            🍜<br>
            맛집
        </div>
    </div>


    <div class="col-md-2 col-4">
        <div class="category">
            🛍<br>
            쇼핑
        </div>
    </div>


    <div class="col-md-2 col-4">
        <div class="category">
            🎉<br>
            축제
        </div>
    </div>

</div>

</section>




<!-- Attraction List -->
<section class="container mt-5">


<div class="d-flex justify-content-between mb-3">

<h3>
관광명소
</h3>


<select class="form-control w-auto">
<option>추천순</option>
<option>인기순</option>
<option>최신순</option>
</select>


</div>



<div class="row">


<!-- Card -->

<div class="col-md-4 mb-4">

<div class="card shadow-sm">

<img src="http://tong.visitkorea.or.kr/cms/resource/77/3031277_image2_1.JPG"
     class="card-img-top">


<div class="card-body">

<h5 class="card-title">
경복궁
</h5>


<p class="card-text">
조선 왕조의 대표적인 궁궐로
서울의 대표 관광 명소입니다.
</p>


<span class="badge badge-primary">
종로
</span>

<span class="badge badge-success">
역사
</span>


<a href="#"
   class="btn btn-outline-primary btn-sm float-right">
상세보기
</a>


</div>

</div>

</div>



<div class="col-md-4 mb-4">

<div class="card shadow-sm">

<img src="http://tong.visitkorea.or.kr/cms/resource/44/3575744_image2_1.jpg"
     class="card-img-top">


<div class="card-body">

<h5 class="card-title">
남산서울타워
</h5>


<p class="card-text">
서울의 아름다운 야경을
감상할 수 있는 랜드마크입니다.
</p>


<span class="badge badge-info">
용산
</span>


<a href="#"
class="btn btn-outline-primary btn-sm float-right">
상세보기
</a>

</div>

</div>

</div>




<div class="col-md-4 mb-4">

<div class="card shadow-sm">

<img src="http://tong.visitkorea.or.kr/cms/resource/77/3027077_image2_1.JPG"
     class="card-img-top">


<div class="card-body">

<h5 class="card-title">
한강공원
</h5>


<p class="card-text">
도심 속 휴식 공간과
다양한 문화행사가 열립니다.
</p>


<span class="badge badge-warning">
자연
</span>


<a href="#"
class="btn btn-outline-primary btn-sm float-right">
상세보기
</a>

</div>

</div>

</div>


</div>

</section>





<!-- Footer -->

<footer class="bg-dark text-white mt-5">

<div class="container py-4 text-center">

<p>
© 2026 TOUR KOREA
</p>

<p>
관광정보 · 여행코스 · 지역정보
</p>

</div>

</footer>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>