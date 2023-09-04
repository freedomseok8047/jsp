<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value='<%=request.getParameter("language")%>' />
<fmt:bundle basename="bundle.message">

	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class=" navbar-header">
				<a class="navbar-brand" href=" ./welcome.jsp">Home</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="./books.jsp">
					<fmt:message key="bookList" /></a></li>
					<li class="nav-item"><a class="nav-link" href="./addBook.jsp">
					<fmt:message key="bookRegistration"/></a></li>
					<li class="nav-item"><a class="nav-link" href="./editBook.jsp?edit=update">상품 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="./editBook.jsp?edit=delete">상품 삭제</a></li>
				</ul>
			</div>
			<div class="text-right">
					<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
					<a href="logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
				</div>
		</div>
	</nav>
</fmt:bundle>