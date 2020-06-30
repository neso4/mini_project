<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지 템플릿</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-10">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4">제목</h1>
      		</div>

  		</div>
	</div>
</body>
</html>