<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
 java.util.Date date = new java.util.Date();
 String date1 = new java.util.Date().toLocaleString();
 out.print("Today : " + date);
 out.print("<br> Today : " + date1);
 %>
</body>
</html>