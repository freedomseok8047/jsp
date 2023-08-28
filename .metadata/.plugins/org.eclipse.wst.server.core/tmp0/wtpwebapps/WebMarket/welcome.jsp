<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Welcome</title>

</head>
<body>
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to Web Market!";	
	%>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			
			<%
			response.setIntHeader("Refresh", 5);
			Date day = new java.util.Date();
			String am_pm;
			int hr = day.getHours();
			int min = day.getMinutes();
			int sec = day.getSeconds();
			if (hr/12 == 0 ){
				am_pm = "AM";
			}else{
				am_pm = "PM";
				hr = hr - 12; 
			}
			String CT = hr + ":" + min + ":" + sec + " " + am_pm;
			out.print("현재 접속 시각: " + CT + "\n");
			%>
		</div>
		<hr>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>