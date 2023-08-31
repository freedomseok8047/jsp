<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src = "./resources/js/validation.js"></script>
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center"><fmt:message key="title" /></h1> <!--상품 등록-->
		</div>
	</div>

	<div class="container">
		<div class="text-right">
		<a href="?language = ko">Korean</a>|<a href="?language = en">English</a>
	
		</div>
	<form name ="newProduct" action =" ./processAddProduct.jsp" class ="form-horizontal" method="post" enctype="multipart/form-data">

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="productId" /></label> <!--상품 코드-->
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control" id="productId">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label> <!--상품명-->
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" id="name">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" /></label> <!--가격-->
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" id="unitPrice">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="description" /></label> <!-- 상세 정보 -->
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>

			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="manufacturer" /></label> <!-- 제조사 -->
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>   <!-- 분류 -->
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label> <!-- 재고 수 -->
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" id="unitsInStock">
				</div>
			</div>

			<div class="form_group row">
				<label class="col-sm-2"><fmt:message key="condition" /></label> <!-- 상태 -->
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New "><fmt:message key="condition_New" /> <!-- 신규 제품 -->
					 <input type="radio" name="condition" value="Old "><fmt:message key="condition_Old" /> <!-- 중고 제품 -->
					  <input type="radio" name="condition" value="Refurbished "><fmt:message key="condition_Refurbished" /> <!-- 재생 재품 -->
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage" /></label> <!-- 이미지 -->
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offseet-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />"
					onclick ="checkAddProduct()">
				</div>

			</div>


		</form>
	</div>
	</fmt:bundle>
</body>
</html>