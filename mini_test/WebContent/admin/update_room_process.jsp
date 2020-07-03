<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방 변경하기 (출력X)</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<jsp:useBean 	id="r" class="mini_project.Reservations" 
					scope="application"/>
	<%
	int roomNumber = Integer.parseInt(request.getParameter("rn"));
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();

	String sql = "UPDATE reservation " +
			"SET roomnumber = ? " +
			"WHERE TO_CHAR(checkindate, 'YYYY-MM-DD')  LIKE ? " +
			"AND email LIKE ?";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setInt(1, roomNumber);
	ps.setString(2, r.getCheckin());
	ps.setString(3, r.getEmail());
	ps.executeUpdate();
	ps.close();
	co.close();
	
	response.sendRedirect("admin_reservation.jsp");
	%>
</body>
</html>