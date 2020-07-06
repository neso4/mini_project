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
					java.util.*, mini_project.Guests"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
	String custname = request.getParameter("custname");
	custname += "%";
	%>

</head>

<body>


<jsp:useBean id="reservations" class="mini_project.Guests"
		scope="request" />
	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT DISTINCT custname, email, phonenumber,counts FROM guests " +
			"LEFT OUTER JOIN (SELECT custname,COUNT(custname) as counts " +
			"from guests group by custname) " +
			"using (custname) " +
            "WHERE custname LIKE ?";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, custname);
	ResultSet rs = ps.executeQuery();
	
	
	
	
	ArrayList <Guests> rl = new ArrayList<Guests>();
	while (rs.next()) {
		rl.add(new Guests(rs.getString(1), rs.getString(2), rs.getString(3),
				rs.getInt(4)));
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
				<h1 class="display-4">회원 등급 정보</h1>
			</div>
			<div>
				<table class="table table-hover" style="text-align: center;">

					<tr>
						<th>회원 이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>누적 횟수</th>
					</tr>
					<c:set var="list" value="<%=rl %>" />
					<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.custname}</td>
							<td>${record.email}</td>
							<td>${record.phonenumber}</td>
							<td>${record.counts}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>