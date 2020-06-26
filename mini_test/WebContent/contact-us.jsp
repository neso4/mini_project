<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div align="center" class="container">
		<h1 class="display-4">Contact us</h1>
	</div>
	<hr>
	<div class="container">
		<!-- 메일인지 게시판인지 아직 못 정함 -->
		<form action="contact_program.jsp" class="form-horizontal" method="POST" name="contact">
			<div class="form-group row">
				<label class="col-sm-2" for="type">문의 유형</label>
				<div class="col-sm-3">
      				<select class="form-control" name="type">
        				<option selected>예약하기</option>
        					<option value="1">예약 문의</option>
        					<option value="2">객실 문의</option>
        					<option value="3">기타 문의</option>
     				</select>
     			</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-6">
					<input 	type="text" class="form-control" name="title">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="detail"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input 	type="name" class="form-control" name="name">
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