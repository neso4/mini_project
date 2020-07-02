<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 취소하기(출력X)</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*,
					mini_project.Reservations" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<%
	String checkin = request.getParameter("d");
	String email = request.getParameter("e");
	int price = Integer.parseInt(request.getParameter("price"));
	Reservations r = new Reservations();
	String sql = "SELECT * FROM reservation WHERE TO_CHAR(checkindate, 'YYYY-MM-DD')=? " +
				"AND email LIKE ? AND price = ?";
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, checkin);
	ps.setString(2, email);
	ps.setInt(3, price);
	ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		r.setName(rs.getString(1));
		r.setEmail(rs.getString(2));
		r.setRoomNumber(rs.getInt(3));
		r.setCheckin(rs.getString(4));
		r.setCheckout(rs.getString(5));
		
		//sl.add(new Reservations(rs.getString(1), rs.getInt(2), rs.getString(3),
		//			rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
	}
	sql = "INSERT INTO cancelled_reservation VALUES (?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
	ps = co.prepareStatement(sql);
	
	rs.close();
	co.close();
	ic.close();
	response.sendRedirect("admin_reservation.jsp");
	%>
</body>
</html>