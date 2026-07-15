<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>JSP 세미 프로젝트 (Model2-MVC)</title>

    <link rel="icon" href="../img/core-img/favicon.ico">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/responsive/responsive.css" rel="stylesheet">

</head>

<body>
    <div id="preloader">
        <div class="yummy-load"></div>
    </div>
    

    
    <jsp:include page="header.jsp"></jsp:include>

    <jsp:include page="${main_jsp }"></jsp:include>

    <jsp:include page="footer.jsp"></jsp:include>
    
    

    <!-- Jquery-2.2.4 js -->
    
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <!-- Popper js -->
    <script src="../js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="../js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="../js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="../js/active.js"></script>
</body>
