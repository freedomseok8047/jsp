<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String str = URLDecoder.decode(request.getQueryString()); 
		/* URLDecoder.decode() 한글을 URL에 사용할때 커버 가능 */
		/* 영여만 쓸거면 String str = request.getQueryString() */
	%>
	
	<p> 전송 요청된 파라미터 : <%=str%>
</body>
</html>