<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>구구단 출력하기</h4>
<jsp:useBean id="gugudan" class="ch04.com.dao.GuGuDan" scope ="request" />

<% int num1 = 5;
	int result = 0;	
	for (int i = 1 ; i <=9 ; i++){
		result = gugudan.process(num1, i);
%>
		<%= num1 + " * " + i + " = " + result %><br>
<%		
	}
%>
</body>
</html>