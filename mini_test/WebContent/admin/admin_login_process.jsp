<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인(출력X)</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.io.*" %>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	String sql = "SELECT * FROM admin WHERE id LIKE ? AND pwd LIKE ?";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, pwd);
	ResultSet rs = ps.executeQuery();
	if(!rs.next()){
		response.sendRedirect("admin_invalid_login.jsp");
	}
	else {
		response.sendRedirect("admin_index.jsp");
	}
	%>
</head>
<body>
	<%
	
	%>
</body>
</html>