<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>호텔 가격 계산하기(출력 X)</title>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    String checkin = request.getParameter("checkin");
    String checkout = request.getParameter("checkout");
	int adults = Integer.parseInt(request.getParameter("adults"));
	int kids = Integer.parseInt(request.getParameter("kids"));
	int roomType = Integer.parseInt(request.getParameter("room"));
    %>
</head>
<body>
	<%
	int day = 1;	// 1박
	int price = 0;
	int total = 0;
	double vat = 0;
	
	// 가격 계산하기
	switch (roomType) {
	case 1:	// 퍼시픽 스위트
		price = day * 450000;
		break;
	case 2:	// 프레지덴셜 스위트
		price = day * 750000;
		break;
	case 3:	// 펜트하우스 스위트
		price = day * 1000000;
		break;
	}

	// 부가가치세 계산하기
	vat =(double) price * 0.1; 
	
	// 총 가격
	total =(int)vat + price;
	%>
	<!-- 예약 페이지로 파라미터 가져가야함 -->
	<jsp:forward page="reservation.jsp">
		<jsp:param name="kids" value="<%=kids %>"/>
		<jsp:param name="adults" value="<%=adults %>"/>
		<jsp:param name="checkout" value="<%=checkout %>"/>
		<jsp:param name="checkin" value="<%=checkin %>"/>
		<jsp:param name="total" value="<%=total %>"/>
		<jsp:param name="price" value="<%=price %>"/>
		<jsp:param name="vat" value="<%=vat %>"/>
	</jsp:forward>
	<jsp:forward page="reservation.jsp"/>
</body>
</html>