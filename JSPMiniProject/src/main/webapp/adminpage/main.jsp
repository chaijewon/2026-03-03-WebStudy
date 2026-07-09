<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>My Portfolio</title>
<link rel="stylesheet" href="main.css">
</head>

<body>

<div id="wrap">

    <!-- HEADER -->
    <header>
        <div class="logo">
            MY PORTFOLIO
            <span>Design & Web Studio</span>
        </div>

        <nav>
            <a href="#">HOME</a>
            <a href="#">ABOUT</a>
            <a href="#">WORK</a>
            <a href="#">PROFILE</a>
            <a href="#">CONTACT</a>
        </nav>
    </header>


    <!-- MAIN VISUAL -->
    <section class="visual">
        <h1>Creative Web Designer</h1>
        <p>
            Website Design / Publishing / Graphic Design Portfolio
        </p>
    </section>


    <!-- CONTENT -->
    <section class="content">

        <div class="left">

            <h2>ABOUT ME</h2>

            <img src="images/profile.jpg" class="profile">

            <p>
            안녕하세요.<br>
            웹 디자인과 퍼블리싱을 작업하는
            디자이너입니다.
            </p>

            <ul>
                <li>Name : 홍길동</li>
                <li>Skill : HTML / CSS / Photoshop</li>
                <li>Email : hello@email.com</li>
            </ul>

        </div>


        <div class="right">

            <h2>PORTFOLIO</h2>

            <div class="gallery">

                <div class="item">
                    <img src="images/work1.jpg">
                    <h3>Project One</h3>
                    <p>Corporate Website</p>
                </div>


                <div class="item">
                    <img src="images/work2.jpg">
                    <h3>Project Two</h3>
                    <p>Shopping Mall Design</p>
                </div>


                <div class="item">
                    <img src="images/work3.jpg">
                    <h3>Project Three</h3>
                    <p>Brand Homepage</p>
                </div>


            </div>

        </div>


    </section>


    <!-- FOOTER -->
    <footer>
        Copyright © 2008 My Portfolio. All rights reserved.
    </footer>


</div>

</body>
</html>