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
	<%
	String adminLogin = (String)session.getAttribute("userID");
	boolean isLogin = false;
	if(adminLogin != null) {
		isLogin = true;
	}
	if(isLogin == true) {
		%>
	
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-11">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4">제목</h1>
      		</div>

  		</div>
	</div>
	<%
	} else { %>
	<div class="jumbotron" style="background-color:#f8d7da;">
		<div class="container" style="text-align:center;" >
			<h1 class="display-1" style="color: #a91c61;'">로그인이 필요한<br> 페이지 입니다.</h1>
			<img src="../img/warning.png">
			<a href="admin_login.jsp" class="btn btn-danger btn-lg btn-block">로그인 페이지로</a>
		</div>
	</div>
	<%
		
	}
	%>
	
</body>
</html>