<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - 매출 현황</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.text.* ,mini_project.Income" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = new java.util.Date();
	String thisMonth = sdf.format(d);
	String today = sdf2.format(d);
	%>
</head>
<body>
	<jsp:useBean id="income" class="mini_project.Income" scope="request"/>
	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT TO_CHAR(checkindate,'YYYY-MM'), SUM(price) " +
			"FROM reservation " +
			"WHERE TO_CHAR(checkindate, 'YYYY-MM') = ? " +
			"GROUP BY TO_CHAR(checkindate,'YYYY-MM')";
	PreparedStatement ps = co.prepareStatement(sql);
	ps.setString(1, thisMonth);
	ResultSet rs = ps.executeQuery();
	ArrayList <Income>il = new ArrayList<Income>();
	while (rs.next()) {
		il.add(new Income(rs.getString(1), rs.getInt(2)));
	}
	rs.close();
	ps.close();
	co.close();
	%>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-11">
   		<!-- 페이지 내용 -->
      	<!-- 뭘 출력해야할까... -->
			<div class="jumbotron" style="background-color:aliceblue;">
				<h1 class="display-4">이번 달 매출 현황</h1>
			</div>
			<div class="form" style="text-align:center;">
				<form action="search_income.jsp" method="GET" style="display:inline-block; padding-right:100px;">
					<input type="date" name="date">
					<input type="submit" value="날짜로 검색하기" class="btn btn-primary">
				</form>
				<form action="search_income.jsp" method="GET" style="display:inline-block; padding-right:100px;">
					<select name="year">
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
					</select>
					<input type="submit" value="연도로 검색하기" class="btn btn-info" >
				</form>
				<form action="search_income.jsp" method="GET" style="display:inline-block; ">
					<select name="year">
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
					</select>
					<select name="month">
						<option>01</option>
						<option>02</option>
						<option>03</option>
						<option>04</option>
						<option>05</option>
						<option>06</option>
						<option>07</option>
						<option>08</option>
						<option>09</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
					<input type="submit" value="연-월 검색하기" class="btn btn-secondary" >
				</form>
			</div>
			<div>
				<table class="table table-hover" style="text-align:center;">
					
					<tr>
						<th>
							연-월
						</th>
						<th>
							매출
						</th>
						<th>
							ㅁㅁ 대비 매출 비율
						</th>
					</tr>
					<c:set var="list" value="<%=il %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.date}</td>
							<td>${record.sum}</td>
							<td>
								<progress id="file" max="1035000000" value="${record.sum}" style="width:100%;"> 70% </progress>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
  		</div>
	</div>
</body>
</html>