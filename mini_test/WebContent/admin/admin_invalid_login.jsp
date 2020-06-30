<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 실패</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
    	@import url('css/admin_invalid_login.css')
    </style>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<div class="alert alert-danger">
				<img src="img/warning.png" id="warning" width="30%">
				<h1 class="display-1" id="title">로그인 실패</h1>
				<a href="admin_login.jsp" class="btn btn-secondary" id="back">
					돌아가기
				</a>
			</div>
		</div>
	</div>
</body>
</html>