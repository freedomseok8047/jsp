<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품도서 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<body>
<fmt:bundle basename="bundle.message">
<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품도서 수정</h1>
		</div>
	</div>
<%@ include file="dbconn.jsp"%>	
	<%
	String bookId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from book where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
		</div>
		<div class="row">
		
		 <div class="col-md-5">
				<img src="/upload/<%=rs.getString("b_fileName")%>"
					style="width: 100%;" />
			</div>
		
		<div class="col-md-7">
		
		<form name="newBook" action="./processUpdateBook.jsp" 
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId" /></label>
				<div class="col-sm-3">
					<input type="text" name="bookId" id="bookId" class="form-control"
					value ='<%=rs.getString("b_id")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" name="name" id="name" class="form-control"
					value ='<%=rs.getString("b_name")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control"
					value ='<%=rs.getString("b_unitPrice")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="author" /></label>
				<div class="col-sm-3">
					<input type="text" name="author" id="author" class="form-control"
					value ='<%=rs.getString("b_author")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2" class="form-control"
					value ='<%=rs.getString("b_description")%>'></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher" /></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" id="publisher" class="form-control"
					value ='<%=rs.getString("b_publisher")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" id="category" class="form-control"
					value ='<%=rs.getString("b_category")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control"
					value ='<%=rs.getString("b_unitsInStock")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="totalPages" /></label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" id="totalPages" class="form-control"
					value ='<%=rs.getString("b_totalPages")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" id="releaseDate" class="form-control"
					value ='<%=rs.getString("b_releaseDate")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"><fmt:message key="condition_New" />
					<input type="radio" name="condition" value="Old"><fmt:message key="condition_Old" />
					<input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="bookImg" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="수정" onclick="checkAddBook();">
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	<%}
	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	if (conn != null)
	conn.close();
	%>
	<%@ include file = "footer.jsp" %>
	</fmt:bundle>
</body>
</html>















