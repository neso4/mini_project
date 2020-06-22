<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<!--슬라이드쇼-->
<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- 사진 순서 버튼? -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- 슬라이드쇼 사진 -->

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/placeholder.jpg" alt="#" class="img-fluid">

        </div>
        <div class="carousel-item">
            <img src="img/placeholder.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/placeholder.jpg" alt="#" class="img-fluid">
        </div>
    </div>

    <!-- 왼쪽, 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
<!--슬라이드 쇼 위에 예약 버튼을 만들고 싶은데 위치 조정을 못해서 못만드는 곳-->
<div id="book_button" style="width: 50%; height: 5%;">

</div>
<br>
<!--호텔 간략한 설명-->
<div class="container">
    <div class="card-deck">
        <div class="card">
            <!--첫 번째 칸-->
            <div class="card-body text-center">
                <img src="img/placeholder.jpg" width="308">
                <p class="card-text">Some text inside the first card</p>
                <p class="card-text">Some more text to increase the height</p>
                <p class="card-text">Some more text to increase the height</p>
                <p class="card-text">Some more text to increase the height</p>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
        <!--두 번째 칸-->
        <div class="card ">
            <div class="card-body text-center">
                <img src="img/placeholder.jpg" width="308">
                <p class="card-text">Some text inside the second card</p>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
        <!--세 번째 칸-->
        <div class="card">
            <div class="card-body text-center">
                <img src="img/placeholder.jpg" width="308">
                <p class="card-text">Some text inside the third card</p>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>