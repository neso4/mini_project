<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - 방 변경하기</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, mini_project.Rooms" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<jsp:useBean 	id="r" class="mini_project.Reservations" scope="application"/>
	<%
	String email = request.getParameter("e");
	String checkin = request.getParameter("d");
	int price = Integer.parseInt(request.getParameter("price"));
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	r.setEmail(email);
	r.setCheckin(checkin);
	r.setPrice(price);
	String sql = "SELECT roomnumber " +
			"FROM rooms " +
			"WHERE roomnumber NOT IN (SELECT  roomnumber " +
			                        "FROM reservation " +
			                        "WHERE TO_char(checkindate,'YYYY-MM-DD') LIKE ?) " +
			"AND PRICE = ? " +
			"ORDER BY roomnumber ASC";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, checkin);
	ps.setInt(2, price);
	ResultSet rs = ps.executeQuery();
	ArrayList <Rooms> rl = new ArrayList <Rooms>();
	while (rs.next()) {
		rl.add(new Rooms(rs.getInt(1)));
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
  		<div class="col-11">
   		<!-- 페이지 내용 -->
      		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4">방 변경하기</h1>
      		</div>
			<div class="col-3">
				<form action="update_room_process.jsp" method="GET">
					<div class="form-group">
    					<label for="exampleFormControlSelect2">변경할 방 번호를 선택해주세요.</label>
    					<select multiple class="form-control" id="exampleFormControlSelect2" name="rn">
      						<c:set var="list" value="<%=rl %>"/>
						<c:forEach var="record" items="${list}">
							<option>${record.roomNumber}</option>
						</c:forEach>
    					</select>
  					</div>
  					<input type="submit" value="변경하기" class="btn btn-primary">
				</form>
			</div>
  		</div>
	</div>
</body>
</html>