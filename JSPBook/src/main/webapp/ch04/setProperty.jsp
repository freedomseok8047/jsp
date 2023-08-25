<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class = "ch04.com.dao.Person" scope="request"/>
	<%-- <% ch04.com.dao.Person person1 = new ch04.com.dao.Person(); %> --%> 
	<jsp:setProperty name="person" property="id"  value ="20182005"/>
	<!-- Person 클래스에서 person이라는 인트턴스에 id라는 변수에 20182005 값을 set한다.  -->
	<jsp:setProperty name="person" property="name"  value ="홍길동"/>
	<p> 아이디 : <% out.print(person.getId()); %>
	<p> 이 름 : <% out.print(person.getName()); %>
</body>
</html>