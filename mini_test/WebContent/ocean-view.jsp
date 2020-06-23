<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>퍼시픽 스위트룸</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
		<div class="jumbotron" style="background-color:aliceblue;">
			<div class="container">
				<h1 class="display-4">퍼시픽 스위트룸</h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  						<div class="carousel-inner">
    						<div class="carousel-item active">
      							<img src="img/pacific.jpg" class="d-block w-100" alt="...">
    						</div>
    						<div class="carousel-item">
      							<img src="img/pacific2.jpg" class="d-block w-100" alt="...">
    						</div>
    						<div class="carousel-item">
      							<img src="img/pacific3.jpg" class="d-block w-100" alt="...">
    						</div>
    						<div class="carousel-item">
      							<img src="img/pacific4.jpg" class="d-block w-100" alt="...">
    						</div>
  						</div>
  						<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    						<span class="sr-only">Previous</span>
  						</a>
  						<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    						<span class="carousel-control-next-icon" aria-hidden="true"></span>
    						<span class="sr-only">Next</span>
  						</a>
					</div>
				</div>
				<div class="col-md-6">
					<form action="reservation.jsp" method="POST">
						<table class="table">
							<tr>
								<th>체크인</th>
								<td>
									<input type="date" name="checkin">
								</td>
							</tr>
							<tr>
								<th>체크아웃</th>
								<td>
									<input type="date" name="checkout">
								</td>
							</tr>
							<tr>
								<th>성인</th>
								<td>
									<input type="number" min=0 max=4 name="adults" size="1">
								</td>
							</tr>
							<tr>
								<th>어린이</th>
								<td>
									<input type="number" min=0 max=4 name="kids" size="1">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" >
									<input type="submit" value="예약" class="btn btn-secondary">
								</td>	
							</tr>
						</table>
					</form>
				</div>
			</div>
			<br>
			<div class="container">	
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<tr>
								<th>베드</th>
								<td>
									킹베드 1개, 간이 침대 1개, 유아용 침대 1개 또는 소파베드 1개
								</td>
								<th>정원</th>
								<td>
									성인 3명 또는 성인 2명과 유아 2명
								</td>
							</tr>
							<tr>
								<th>욕실</th>
								<td>
									욕조가 완비된 욕실 2개
								</td>
								<th>정원</th>
								<td>
									바다전망, 2인용 아웃도어 다이닝 테이블 및 안락의자 변경가능
								</td>
							</tr>
						</table>
						<hr>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>