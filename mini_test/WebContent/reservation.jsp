<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%
    String checkin = request.getParameter("checkin");
    String checkout = request.getParameter("checkout");
	int adults = Integer.parseInt(request.getParameter("adults"));
	int kids = Integer.parseInt(request.getParameter("kids"));
	int roomType = Integer.parseInt(request.getParameter("room"));
	String total = request.getParameter("total");
	String price = request.getParameter("price");
	String vat = request.getParameter("total");
    %>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="jumbotron" style="background-color:aliceblue;">
		<div class="container">
			<h3 class="display-3">예약하기</h3>
			<hr>
		</div>
	</div>
	<div class="container">
		<form action="reservation_process.jsp" class="form-horizontal" method="POST" name="reservation">
			<div class="form-group row">
				<label class="col-sm-2">체크인</label>
				<div class="col-sm-3">
					<input 	type="date" class="form-control" name="checkin" value="<%=checkin %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">체크아웃</label>
				<div class="col-sm-3">
					<input 	type="date" class="form-control" name="checkout" value="<%=checkout %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">어른</label>
				<div class="col-sm-3">
					<input 	type="number" class="form-control" name="adults" value="<%=adults %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">어린이</label>
				<div class="col-sm-3">
					<input 	type="number" class="form-control" name="kids" value="<%=kids %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input 	type="text" class="form-control" name="total" value="<%=total %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="room">객실</label>
				<div class="col-sm-3">
				<%
				if(roomType == 1) {
					%>
					<select class="form-control" name="room" >
        				<option>객실</option>
        					<option value="1" selected>퍼시픽 스위트</option>
     				</select>
					<%
				} else if (roomType == 2) {%>
				
      				<select class="form-control" name="room">
        				<option>객실</option>
        					<option value="2" selected>프레지덴셜 스위트</option>
     				</select>
     				<%
				} else if(roomType == 3) {%>
				    <select class="form-control" name="room">
        				<option>객실</option>
        					<option value="3" selected>펜트하우스 스위트</option>
     				</select>
				
				<%} %>
     			</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input 	type="text" class="form-control" name="name">
				</div>
			</div>
						<div class="form-group row">
				<label class="col-sm-2">이메일</label>
			<div class="col-sm-3">
					<input 	type="text" class="form-control"
							name="email">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">예약 비밀 번호</label>
				<div class="col-sm-3">
					<input 	type="password" class="form-control" name="pwd">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">예약 비밀번호 확인</label>
				<div class="col-sm-3">
					<input 	type="password" class="form-control" name="pwdcheck">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화 번호</label>
				<div class="col-sm-3">
					<input 	type="text" class="form-control" name="phone">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">요구 사항</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="requirement"></textarea>
				</div>
			</div>
			<div class="form-group row" align="center">
				<div class="col-sm-offset-2 col-sm-12">
					<input type="submit" class="btn btn-primary"
							value="등록">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>