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
	ArrayList <Rooms> rl1 = new ArrayList <Rooms> ();
	ArrayList <Rooms> rl2 = new ArrayList <Rooms> ();
	ArrayList <Rooms> rl3 = new ArrayList <Rooms> ();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = new java.util.Date();
	String today = sdf.format(d);
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	String sql = "SELECT roomnumber " + 
			"FROM rooms " +
			"WHERE roomnumber NOT IN (SELECT  roomnumber " + 
			                      	"FROM reservation " + 
			                        "WHERE checkindate = TO_DATE(?, 'YYYY-MM-DD'))" +
			"AND roomtype = 1 " +
			"ORDER BY roomnumber ASC";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, today);
	ResultSet rs = ps.executeQuery();
	
	while (rs.next()) {
		rl1.add(new Rooms(rs.getInt(1)));
		
	}
	sql = "SELECT roomnumber " + 
			"FROM rooms " +
			"WHERE roomnumber NOT IN (SELECT  roomnumber " + 
			                      	"FROM reservation " + 
			                        "WHERE checkindate = TO_DATE(?, 'YYYY-MM-DD'))" +
			"AND roomtype = 2 " +
			"ORDER BY roomnumber ASC";
	ps = co.prepareStatement(sql);
	ps.setString(1, today);
	rs = ps.executeQuery();
	
	while (rs.next()) {
		rl2.add(new Rooms(rs.getInt(1)));
		
	}
	sql = "SELECT roomnumber " + 
			"FROM rooms " +
			"WHERE roomnumber NOT IN (SELECT  roomnumber " + 
			                      	"FROM reservation " + 
			                        "WHERE checkindate = TO_DATE(?, 'YYYY-MM-DD'))" +
			"AND roomtype = 3 " +
			"ORDER BY roomnumber ASC";
	ps = co.prepareStatement(sql);
	ps.setString(1, today);
	rs = ps.executeQuery();
	
	while (rs.next()) {
		rl3.add(new Rooms(rs.getInt(1)));
		
	}
	rs.close();
	ps.close();
	co.close();
	%>
</head>
<body>
	<jsp:useBean id="rooms" class="mini_project.Rooms" scope="request"/>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-11">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
				<h1 class="display-4">현재 빈 객실 현황</h1>
      		</div>
      		<div style="text-align:center; background-color:#EEEEEE;">
      			<form action="search_rooom.jsp" method="GET">
      				
      				<input type="date" name="date">
      				
      				<input type="submit" value="검색" class="btn btn-info">
      			</form>
      		</div>
      		<div class="col-3" style="text-align: center; display:inline-block;">
      			<div class="alert alert-info"><h3 class="display-4">퍼시픽 스위트</h3></div>
				<table class="table table-bordered">
					<c:set var="list" value="<%=rl1 %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td><h3>${record.roomNumber}</h3></td>
						</tr>
					</c:forEach>
				</table>
      		</div>
      		<div class="col-3" style="text-align: center; display:inline-block;">
      			<div class="alert alert-info"><h3 class="display-4">프레지덴셜 <br>스위트</h3></div>
				<table class="table table-bordered">
					<c:set var="list" value="<%=rl2 %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td><h3>${record.roomNumber}</h3></td>
						</tr>
					</c:forEach>
				</table>
      		</div>
      		<div class="col-3" style="text-align: center; display:inline-block;">
      			<div class="alert alert-info"><h3 class="display-4">펜트하우스 <br>스위트</h3></div>
				<table class="table table-bordered">
					<c:set var="list" value="<%=rl3 %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td><h3>${record.roomNumber}</h3></td>
						</tr>
					</c:forEach>
				</table>
      		</div>
  		</div>
	</div>
</body>
</html>