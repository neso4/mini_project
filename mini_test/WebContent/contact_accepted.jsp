<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의 사항 접수 완료</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="alert alert-info" style="text-align:center;">
			<h1 class="display-3"><i>문의 사항이 접수 되었습니다.</i></h1>
			<h3>감사합니다.</h3>
			<hr>
			<a href="index.jsp" class="btn btn-info">홈으로 돌아가기</a>
		</div>		
	</div>
	<hr>
	<div class="container">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>