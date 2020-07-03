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
	ArrayList <Reservations> rl = new ArrayList<Reservations>();
	String sql = "SELECT email, roomnumber, TO_CHAR(checkindate, 'YYYY-MM-DD'), TO_CHAR(checkoutdate, 'YYYY-MM-DD'), requirement, adults, kids, price "+
			"FROM reservation "+
			"WHERE TO_CHAR(checkindate, 'YYYY-MM-DD')=? " +
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
		rl.add(new Reservations(rs.getString(1), rs.getInt(2), rs.getString(3),
					rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
	}
		
	sql = "INSERT INTO cancelled_reservation VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, SYSDATE)";
	ps = co.prepareStatement(sql);
	for(int i = 0; i < rl.size(); i++ ){
		ps.setString(1, rl.get(i).getEmail());
		ps.setInt(2, rl.get(i).getRoomNumber());
		ps.setString(3, rl.get(i).getCheckin());
		ps.setString(4, rl.get(i).getCheckout());
		ps.setString(5, rl.get(i).getRequirement());
		ps.setInt(6, rl.get(i).getAdults());
		ps.setInt(7, rl.get(i).getKids());
		ps.setInt(8, rl.get(i).getPrice());
		ps.executeUpdate();
	}
	sql = "DELETE FROM reservation WHERE checkindate = TO_DATE(?, 'YYYY-MM-DD') AND email LIKE ? AND price = ?";
	ps = co.prepareStatement(sql);
	ps.setString(1, checkin);
	ps.setString(2, email);
	ps.setInt(3, price);
	ps.executeQuery();
	sql = "DELETE FROM guests WHERE email LIKE ? AND TO_CHAR(usedate, 'YYYY-MM-DD') LIKE ?";
	ps = co.prepareStatement(sql);
	ps.setString(1, email);
	ps.setString(2, checkin);
	ps.executeQuery();
	rs.close();
	co.close();
	ic.close();
	response.sendRedirect("admin_reservation.jsp");
	%>
</body>
</html>