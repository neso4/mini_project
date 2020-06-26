<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<meta charset="UTF-8">
   	<title>객실 안내</title>
   	<!--부트스트랩 import-->
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
   <jsp:include page="header.jsp"/>
   <div class="container">
    <section align="center">
        <h1>Rooms</h1>
        <hr>
        <div class="media">
            <div class="media-body">
             <br>
              
               루아우 호텔은  객실 모두가 전용 베란다를 갖추고 있으며, 스마트하고 직관적이며 유행을 타지 않는 스타일로 설계되었습니다.<br>
               각 객실의 구조는 자유로움을 느낌을 그대로 전달하는 동시에 넉넉한 공간과 산뜻한 흰색 침구 및 다목적 가구를 구비하고 있습니다. <br> 
               단체 고객을 위한 스위트, 리젠시 클럽 라운지 이용 혜택, 환상적인 바다 또는 산 전망 등 편안함을 누릴 수 있는 기회가 무궁무진합니다.<br>
                <br>
            
            
            </div>
            
        </div>
        <hr>
        <!--객실 안내-->
         <br> 
        <div class="card" width="100%" style="margin-bottom: 10px;">
            <div class="card-body">
                <img src="img/room1.jpg" width="30%" style="float: left; padding-right: 10px;">
                <h5 class="card-title">퍼시픽 스위트</h5>
                <p class="card-text">
                   더 넓은 공간과 편안함을 선사하는 퍼시픽 스위트는 분리된 거실 공간 및 침실과 함께,  <br>
                   스파 욕조와 정원이 포함된 전용의 야외 테라스를 갖추고 있습니다. <br>
                   문을 나서면 눈앞에 바다가 펼쳐지며, 실내 공간과 야외 공간이 최적의 조화를 이루도록 설계되었습니다.  <br>
                   싱그러운 바나나 잎 벽지와 바다의 향취가 담긴 인테리어로 휴양지에 있는듯한 생생한 느낌이 듭니다. <br>
                </p>
                <a href="pacific-suite.jsp" class="btn btn-primary" style="float: right;">예약</a>
            </div>
        </div>
        <div class="card" width="100%" style="margin-bottom: 10px;">
            <div class="card-body">
                <img src="img/room2.jpg" width="30%" style="float: left; padding-right: 10px;">
                <h5 class="card-title">프레지덴셜 스위트</h5>
                <p class="card-text">
                    5-7층에 자리한 투베드룸 스위트로, 세련된 분위기의 여유로운 공간을 선사합니다.<br>
                                               완벽한 태평양 전망이 펼쳐지는 각 침실은 독특한 인테리어를 선보이며,  <br>
                                               루프탑 스카이 테라스와 라운지가 전용 계단으로 연결됩니다.
                </p>
                <a href="presidential-suite.jsp" class="btn btn-primary" style="float: right;">예약</a>
            </div>
        </div>
        <div class="card" width="100%" style="margin-bottom: 10px;" style="float: right;">
            <div class="card-body">
                <img src="img/room3.jpg" width="30%" style="float: left; padding-right: 10px;">
                <h5 class="card-title">펜트하우스 스위트</h5>
                <p class="card-text">
                    포브스 지가 “하와이 모든 섬의 호텔 스위트룸 가운데 가장 드라마틱한 감동을 선사”한다고 <br>
                    극찬한 스위트입니다. 8-10층에 위치한 넓은 전용 베란다에 환상적인 태평양의 풍광이 하루종일 펼쳐지며,  <br>
                    투베드룸과 함께 여유로운 공간의 인테리어가 가족 또는 친구와의 여행에 넉넉한 만족을 선사합니다.
                </p>
                <a href="#" class="btn btn-primary" style="float: right;">예약</a>
            </div>
        </div>
        <hr>
          
        </section>
    </div>
   <jsp:include page="footer.jsp"/>
</body>
</html>