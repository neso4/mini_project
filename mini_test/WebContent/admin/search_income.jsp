<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매출 검색 결과</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, java.text.* ,mini_project.Income" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    String date = request.getParameter("date");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    final int DATE_MAX = 34500000;
    final int MONTH_MAX = 1035000000;
    final long YEAR_MAX = 13969500000l;
    InitialContext ic = new InitialContext();
    DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
    Connection co = ds.getConnection();
    String sql = null;
    int sum = 0;
    int index = 0;
    double per = 0;
    String str = null;
    ArrayList <Income> il = new ArrayList<Income>();
    ResultSet rs = null;
    PreparedStatement ps = null;
    
    %>
</head>
<body>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-11">
   		<!-- 페이지 내용 -->
   		<%if ((year == null)&&(month == null)) { 
   			sql = 	"SELECT SUM(price) " +
   					"FROM reservation " +
   					"WHERE TO_CHAR(checkindate, 'YYYY-MM-DD') LIKE ? " +
   					"GROUP BY TO_CHAR(checkindate, 'YYYY-MM-DD')";
   			ps = co.prepareStatement(sql);
   			ps.setString(1, date);
   			rs = ps.executeQuery();
   			while(rs.next()) {
   				il.add(new Income(date, rs.getInt(1)));
   			}
   			
   			rs.close();
   			co.close();
   			ps.close();
   		%>
      		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4"><%=date %>의 매출 현황</h1>
      		</div>
      		
		<%} else if((date == null)&&(month == null)) { 
		
		
		
		
		%>
		<div class="jumbotron" style="background-color:aliceblue;">
      			<h1 class="display-4"><%=year %>년의 매출 현황</h1>
      		</div>
		
		
		
		<% }%>
		<div>
				<table class="table table-hover" style="text-align:center;">
					
					<tr>
						<th>
							날짜
						</th>
						<th>
							매출
						</th>
						<th>
							백분율
						</th>
						<th>
							최대 매출액 대비 매출 비율 그래프
						</th>
					</tr>
					<c:set var="list" value="<%=il %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.date}</td>
							<td>${record.sum}</td>
							<td>
							<%
							for(int i = 0; i < il.size(); i++)
								sum += il.get(i).getSum();
							per = (double) il.get(index).getSum() / 34500000 * 100;
							str = String.format("%.2f%%", per);
							out.println(str);
							%>
							</td>
							<td>
								<progress id="file" max="34500000" value="${record.sum}" style="width:100%;"></progress>
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="2">
								<b>누적 매출</b>
							</td>
							<td colspan="2">
								<b><%=sum %>원</b>
							</td>
						</tr>
				</table>
			</div>
  		</div>
	</div>
</body>
</html>