<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 처리 프로세스(html 페이지로 출력되지 않음)</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.io.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<% // 예약 페이지에서 파라미터 받아옴
	request.setCharacterEncoding("UTF-8");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	int room = Integer.parseInt(request.getParameter("room"));
	String custName = request.getParameter("name");
	String email = request.getParameter("email");
	String requirement = request.getParameter("requirement");
	String phone = request.getParameter("phone");
	int adults = Integer.parseInt(request.getParameter("adults"));
	int kids = Integer.parseInt(request.getParameter("kids"));
	int roomType = Integer.parseInt(request.getParameter("room"));
	int total = Integer.parseInt(request.getParameter("total"));
	String price = request.getParameter("price");
	String vat = request.getParameter("total");
	
	%>
</head>
<body>
	<%
	try {
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
		Connection co = ds.getConnection();
		// 1. 예약 테이블에 데이터 삽입
		String sql = "INSERT INTO reservation VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?)";
		PreparedStatement ps = co.prepareStatement(sql);
		ps.setString(1, email);
		ps.setInt(2, 0);
		ps.setString(3, checkin);
		ps.setString(4, checkout);
		ps.setString(5, requirement);
		ps.setInt(6, adults);
		ps.setInt(7, kids);
		ps.setInt(8, total);
		ps.executeUpdate();
		// 2. 숙박객 목록에 삽입. 기본키는 이메일 같음
		// 시간 여유 되면 누적 횟수도 만들고 싶음
		sql = "INSERT INTO guests  VALUES (?, ?, ?, SYSDATE)";
		ps = co.prepareStatement(sql);
		ps.setString(1, custName);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.executeUpdate();
		
		response.sendRedirect("reservation_completed.jsp");
	} catch (SQLException e) {
		out.println("DB 연동 오류 : " + e.getMessage());
	}
	%>
</body>
</html>