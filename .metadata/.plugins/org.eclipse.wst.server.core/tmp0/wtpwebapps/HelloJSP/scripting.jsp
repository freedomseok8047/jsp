<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting tag</title>
</head>
<body>
	<h2>Scripting tag</h2>
	<%! int count = 3;
		String makeItLower(String data){
			return data.toLowerCase();
		}
	%>
	<%
		for(int i = 1; i <= count; i++){
			out.println("Java Server pages" + i +".<br>");
		}
	out.write("\r\n");
	out.write("\r\n");
	out.print(makeItLower("Hello World"));
	%>
</body>
</html>













