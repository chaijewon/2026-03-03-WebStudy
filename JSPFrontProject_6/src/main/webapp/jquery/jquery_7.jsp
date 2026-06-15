<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>jQuery 라이트박스 슬라이더</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body { font-family: sans-serif; text-align: center; padding: 20px; }
        
        /* 1. 썸네일 리스트 스타일 */
        .gallery { display: flex; justify-content: center; gap: 15px; }
        .gallery img { 
            width: 150px; height: 100px; object-fit: cover; 
            cursor: pointer; border-radius: 5px; transition: 0.2s;
        }
        .gallery img:hover { transform: scale(1.05); box-shadow: 0 5px 15px rgba(0,0,0,0.3); }

        /* 2. 라이트박스 팝업 전체 배경 (처음엔 숨김) */
        .lightbox-overlay {
            display: none; position: fixed; top: 0; left: 0;
            width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.85);
            z-index: 1000; justify-content: center; align-items: center;
        }

        /* 3. 라이트박스 컨텐츠 박스 */
        .lightbox-content { position: relative; max-width: 80%; max-height: 80%; }
        .lightbox-content img { max-width: 100%; max-height: 80vh; border-radius: 5px; display: block; }

        /* 4. 컨트롤 버튼들 (닫기, 이전, 다음) */
        .close-btn {
            position: absolute; top: -40px; right: 0;
            color: #fff; font-size: 30px; cursor: pointer;
        }
        .nav-btn {
            position: absolute; top: 50%; transform: translateY(-50%);
            background: rgba(255,255,255,0.2); color: white; border: none;
            padding: 15px 20px; font-size: 24px; cursor: pointer; border-radius: 5px;
            transition: 0.3s;
        }
        .nav-btn:hover { background: rgba(255,255,255,0.5); }
        .prev-btn { left: -80px; }
        .next-btn { right: -80px; }
    </style>
</head>
<body>

    <h2>jQuery 라이트박스 슬라이더 갤러리</h2>
    <p>썸네일을 클릭하면 라이트박스 슬라이더가 열립니다.</p>
    <br>

    <div class="gallery">
        <img src="https://picsum.photos/id/10/800/600" alt="이미지1">
        <img src="https://picsum.photos/id/20/800/600" alt="이미지2">
        <img src="https://picsum.photos/id/30/800/600" alt="이미지3">
        <img src="https://picsum.photos/id/40/800/600" alt="이미지4">
    </div>

    <div class="lightbox-overlay" id="lightbox">
        <div class="lightbox-content">
            <span class="close-btn" id="close">&times;</span>
            <button class="nav-btn prev-btn" id="prev">&#10094;</button>
            
            <img src="" id="lightbox-img" alt="큰 이미지">
            
            <button class="nav-btn next-btn" id="next">&#10095;</button>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var $galleryImages = $(".gallery img"); // 모든 썸네일 배열
            var currentIndex = 0;                  // 현재 보고 있는 이미지 인덱스

            // 1. 이미지 변경 함수 (부드러운 페이드 효과 추가)
            function changeImage(index) {
                currentIndex = index;
                var newSrc = $galleryImages.eq(currentIndex).attr("src");
                
                // 기존 이미지를 살짝 숨겼다가 새 이미지로 교체하며 나타내기
                $("#lightbox-img").fadeOut(150, function() {
                    $(this).attr("src", newSrc).fadeIn(200);
                });
            }

            // 2. 썸네일 클릭 시 라이트박스 열기
            $galleryImages.click(function() {
                var index = $galleryImages.index(this); // 클릭한 이미지의 인덱스 구하기
                changeImage(index);
                $("#lightbox").css("display", "flex").hide().fadeIn(300); // flex 구조 유지하며 페이드인
            });

            // 3. 닫기 버튼 클릭 시 닫기
            $("#close").click(function() {
                $("#lightbox").fadeOut(300);
            });

            // 4. 검은 배경 클릭 시 닫기 (컨텐츠 박스 클릭시는 제외)
            $("#lightbox").click(function(e) {
                if (e.target === this) {
                    $(this).fadeOut(300);
                }
            });

            // 5. 이전 버튼 클릭
            $("#prev").click(function() {
                var nextIndex = currentIndex - 1;
                if (nextIndex < 0) {
                    nextIndex = $galleryImages.length - 1; // 첫 장이면 마지막 장으로 이동
                }
                changeImage(nextIndex);
            });

            // 6. 다음 버튼 클릭
            $("#next").click(function() {
                var nextIndex = currentIndex + 1;
                if (nextIndex >= $galleryImages.length) {
                    nextIndex = 0; // 마지막 장이면 첫 장으로 이동
                }
                changeImage(nextIndex);
            });
        });
    </script>
</body>
</html>
