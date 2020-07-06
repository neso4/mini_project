<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 매출 현황</title>
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
</head>
<body>

	<jsp:useBean id="reservations" class="mini_project.Contact"
		scope="request" />

	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT * FROM contact order by insert_date DESC";
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
	<jsp:include page="admin_header.jsp" />
	<div class="row">
		<jsp:include page="admin_sidebar.jsp" />
		<div class="col-11">
			<!-- 페이지 내용 -->
			<div class="jumbotron" style="background-color: aliceblue;">
				<h1 class="display-4">문의 내용 현황</h1>
			</div>
			<form action="contactUs_process.jsp" class="form-horizontal" method="POST" name="contactUs">
			<div class="selectbox">
				<select name="type">
					<option selected>문의유형</option>
					<option value="1">예약 및 취소 문의</option>
					<option value="2">객실 문의</option>
					<option value="3">시설 문의</option>
					<option value="4">기타 문의</option>
				</select> 
			
		
				<input type="date" name="date">
				<input type="submit" class="btn btn-primary"
							value="찾기">
			</div>
			</form>
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