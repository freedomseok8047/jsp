<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="ch04.com.dao.Calculator" />
	<%--  <%	ch04.com.dao.Calculator bean2 = new ch04.com.dao.Calculator();  %> 인스턴스 생성과 같은 기능 --%>
	<%

	 int m = bean.process(5);
	 out.print("5의 3제곱 : " + m);
	%>

</body>
</html>