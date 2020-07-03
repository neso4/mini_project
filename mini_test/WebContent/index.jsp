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
    <style>
    @import url('css/index.css')
    </style>
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
        <li data-target="#demo" data-slide-to="3"></li>
        <li data-target="#demo" data-slide-to="4"></li>
        <li data-target="#demo" data-slide-to="5"></li>
        <li data-target="#demo" data-slide-to="6"></li>
        <li data-target="#demo" data-slide-to="7"></li>
        <li data-target="#demo" data-slide-to="8"></li>
    </ul>

    <!-- 슬라이드쇼 사진 -->

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/index1.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index2.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index3.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index4.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index5.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index6.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
            <img src="img/index7.jpg" alt="#" class="img-fluid">
        </div>
        <div class="carousel-item">
         	<img src="img/index8.jpg" alt="#" class="img-fluid">
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
                <img src="img/indexSub1.jpg" width="308">
                <p class="card-text">편안한 휴식</p>
                <p class="card-text">
                	모든 객실에는 세련된 안락 의자를 갖춘 전용 베란다가 포함되어 있습니다.  
                	모닝 커피와 함께 편안한 휴식을 취하거나 해가 질 무렵 칵테일잔을 기울이며 일몰을 감상하며, 
                	루아우 호텔의 침대에서 편안한 휴식을 즐겨보세요.
                </p>
                <a href="rooms.jsp" class="card-link">Another link</a>
            </div>
        </div>
        <!--두 번째 칸-->
        <div class="card ">
            <div class="card-body text-center">
                <img src="img/indexSub2.jpg" width="308">
                <p class="card-text">다양한 부대 시설</p>
                <p class="card-text">
                	루아우 호텔의 최신식 24시간 피트니스 센터에서 활기차게 운동하고 야외 
                	수영장의 선데크에서 느긋하게 누워 있거나 수영장 바에서 신선한 칵테일을 경험해보세요. 
                	또한 고객을 위한 대형 컨벤션 홀, 미팅 룸들도 자유롭게 이용해 보세요.
                </p>
                <a href="facilities.jsp" class="card-link">Another link</a>
            </div>
        </div>
        <!--세 번째 칸-->
        <div class="card">
            <div class="card-body text-center">
                <img src="img/indexSub3.jpg" width="308">
                <p class="card-text">스페셜 액티비티</p>
                <p class="card-text">
                	루아우 호텔의 최신식 24시간 피트니스 센터에서 활기차게 운동하고 야외 수영장의 선데크에서 느긋하게 누워 있거나 
                	수영장 바에서 신선한 칵테일을 경험해보세요. 
                	또한 고객을 위한 대형 컨벤션 홀, 미팅 룸들도 자유롭게 이용해 보세요. 
                </p>
                <a href="facilities.jsp#stop" class="card-link">Another link</a>
            </div>
        </div>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>