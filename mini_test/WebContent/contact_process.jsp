<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의 사항 처리</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.io.*" %>
	<%
	request.setCharacterEncoding("UTF-8");
	int type = Integer.parseInt(request.getParameter("type"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	%>
</head>
<body>
	<%
	try {
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
		Connection co = ds.getConnection();
		// 1. 예약 테이블에 데이터 삽입
		String sql = "INSERT INTO contact VALUES (?, ?, ?, ?, ?, SYSDATE)";
		PreparedStatement ps = co.prepareStatement(sql);
		ps.setInt(1, type);
		ps.setString(2, title);
		ps.setString(3, content);
		ps.setString(4, name);
		ps.setString(5, phone);
		ps.executeUpdate();
		response.sendRedirect("contact_accepted.jsp");
	%>
	
	<%
	} catch (SQLException e) {
		out.println("DB 연결 에러" + e.getMessage());
	}
	%>
</body>
</html>