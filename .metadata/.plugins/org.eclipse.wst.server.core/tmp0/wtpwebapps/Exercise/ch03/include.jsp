<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Calendar calendar = Calendar.getInstance();  %>
	<%@ include file="header.jsp"%>
	<p>현재시간 : <%=calendar.getTime().toString()%></p>

</body>
</html>