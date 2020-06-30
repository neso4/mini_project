<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - 방 배정하기</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, mini_project.Rooms" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<jsp:useBean 	id="reservations" class="mini_project.Reservations" 
					scope="request"/>
	<%
	int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
	int type = Integer.parseInt(request.getParameter("type"));
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT * FROM rooms WHERE type = ?";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setInt(1, type);
	ResultSet rs = ps.executeQuery();
	ArrayList <Rooms> rl = new ArrayList <Rooms>();
	while (rs.next()) {
		rl.add(new Rooms(rs.getInt(1), rs.getInt(2), rs.getInt(3), false));
	}
	rs.close();
	ps.close();
	co.close();
	%>
</head>
<body>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-10">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4">방 배정하기</h1>
      		</div>
			<div>
				<table class="table table-bordered">
					<tr>
				
				</table>
			</div>
  		</div>
	</div>
</body>
</html>