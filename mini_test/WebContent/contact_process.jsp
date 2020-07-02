<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--부트스트랩 import-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>문의 사항 처리</title>
<%@page
	import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<jsp:useBean id="reservations" class="mini_project.Contact"
		scope="request" />
	<%
	try {
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
		Connection co = ds.getConnection();
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