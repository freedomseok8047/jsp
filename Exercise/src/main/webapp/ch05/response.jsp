<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	response.setHeader("Refresh", "5");
	Calendar calendar = java.util.Calendar.getInstance(new Locale("ko"));
	String str = calendar.get(Calendar.HOUR) + ":" + 
			calendar.get(Calendar.MINUTE) + ":" + 
			calendar.get(Calendar.SECOND) + " " + 
			((calendar.get(Calendar.AM_PM) == Calendar.AM) ? "AM" : "PM");
	%>
	<p>
		현재 시간은 : <%=str%>
	<p>
		<a href="response_data.jsp">Google 홈페이지 이동하기</a>
</body>
</html>