<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - 객실 현황</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.io.*, java.text.* ,mini_project.Rooms" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	Vector <Rooms> v = new Vector <Rooms> ();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	java.util.Date d = new java.util.Date();
	String today = sdf.format(d);
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	String sql = "SELECT rooms.roomnumber FROM rooms, reservation " +
			"WHERE rooms.roomnumber = reservation.roomnumber " +
			"AND checkindate = TO_DATE('?','YYYY-MM-DD')";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, today);
	ResultSet rs = ps.executeQuery();
	
	while (rs.next()) {
		v.add(new Rooms(rs.getInt(1), rs.getInt(2), rs.getInt(3), false));
		
	}
	rs.close();
	ps.close();
	co.close();
	%>
</head>
<body>
	<jsp:useBean 	id="rooms" class="mini_project.Rooms" 
					scope="request"/>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-10">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
				<h1 class="display-4">현재 객실 현황</h1>
      		</div>
      		<div id="content">
      			
				<table class="table table-bordered">
					<tr>
						<th>
							
						</th>
						<th>
							
						</th>
						<th>
							방 번호
						</th>
						<th>
							체크인
						</th>
						<th>
							체크아웃
						</th>
						<th>
							요구사항
						</th>
						<th>
							어른
						</th>
						<th>
							어린이
						</th>
						<th>
							가격
						</th>
						<th>
							방 변경
						</th>
						<th>
							취소
						</th>
					</tr>
					<c:set var="list" value="<%=rl %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.name}</td>
							<td>${record.email}</td>
							<td>${record.roomNumber}</td>
							<td>${record.checkin}</td>
							<td>${record.checkout}</td>
							<td>${record.requirement}</td>
							<td>${record.adults}</td>
							<td>${record.kids}</td>
							<td>${record.price}</td>
							<td><a href="#" class="btn btn-outline-success">변경하기</a></td>
							<td><a href="#" class="btn btn-outline-danger">취소하기</a></td>
						</tr>
					</c:forEach>
				</table>
      		</div>
  		</div>
	</div>
</body>
</html>