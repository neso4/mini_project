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
	String insertDate = request.getParameter("insertDate");
	String date = request.getParameter("date");
	%>
</head>
<body>
<jsp:useBean id="reservations" class="mini_project.Contact"
		scope="request" />
	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT * FROM contact WHERE ?";
	PreparedStatement ps = co.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	
	
	
	
	
	
	ArrayList <Contact> rl = new ArrayList<Contact>();
	while (rs.next()) {
		rl.add(new Contact(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
				rs.getString(5), rs.getString(6)));
	}
	rs.close();
	ps.close();
	co.close();
	%>
</body>
</html>