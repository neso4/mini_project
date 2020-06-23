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
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	int room = Integer.parseInt(request.getParameter("room"));
	String custName = request.getParameter("name");
	String email = request.getParameter("email");
	String requirement = request.getParameter("requirement");
	%>
</head>
<body>
	<%
	try {
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
		Connection co = ds.getConnection();
		// 1. 예약 테이블에 데이터 삽입
		String sql = "INSERT INTO reservation VALUES (?, TO-DATE(YYYY-MM-DD,?), ?, ?)";
		PreparedStatement ps = co.prepareStatement(sql);
		ps.setInt(1, 0);
		ps.setString(2, checkin);
		ps.setString(3, checkout);
		ps.setString(4, requirement);
		ps.executeQuery();
		// 2. 숙박객 목록에 삽입. 기본키는 이메일 같음
		// 시간 여유 되면 누적 횟수도 만들고 싶음
		sql = "INSERT INTO guests  VALUES (?, ?, ?, ?)";
		ps = co.prepareStatement(sql);
		// 
	} catch (SQLException e) {
		out.println("DB 연동 오류");
	}
	%>
</body>
</html>