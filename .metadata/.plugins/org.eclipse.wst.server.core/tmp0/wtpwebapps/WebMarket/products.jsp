<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">상품 목록</h1>
		</div>
	</div>
	<%
	ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>

	<div class="container">
		<div class="row" align="center">
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<h4>
					[<%=product.getCategory()%>]
				</h4>
				<img src="resources/images/<%=product.getFilename()%>" style=""
					alt="My Image">
				<p>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p>
					<b>상품 코드 : </b> <span class="badge badge=danger"> <%=product.getProductId()%>
					</span>
				<p class="font-weight-bold text-secondary"><%=product.getUnitPrice()%>원
				<p> <a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role ="button"> 상세정보
						&raquo;</a>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>







