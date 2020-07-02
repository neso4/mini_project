<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자  문의사항 조회</title>
<!--부트스트랩 import-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%@page
	import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, mini_project.Contact"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
	int type = Integer.parseInt(request.getParameter("type"));
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
	
	String sql = "SELECT * FROM contact " + 
			"WHERE TO_CHAR(insert_date,'YYYY-MM-DD')=? " +
			"AND type=?";
	PreparedStatement ps = co.prepareStatement(sql);
	
	ps.setString(1, date);
	ps.setInt(2, type);
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
	
	
	<jsp:include page="admin_header.jsp" />
	<div class="row">
		<jsp:include page="admin_sidebar.jsp" />
		<div class="col-10">
			<!-- 페이지 내용 -->
			<!-- 뭘 출력해야할까... -->
			<div class="jumbotron" style="background-color: aliceblue;">
				<h1 class="display-4">문의 내용 현황</h1>
			</div>
			<div>
				<table class="table table-hover" style="text-align: center;">

					<tr>
						<th>문의 유형</th>
						<th>제목</th>
						<th>내용</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>입력 날짜</th>
					</tr>
					<c:set var="list" value="<%=rl %>" />
					<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.type}</td>
							<td>${record.title}</td>
							<td>${record.content}</td>
							<td>${record.name}</td>
							<td>${record.phone}</td>
							<td>${record.insertDate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>