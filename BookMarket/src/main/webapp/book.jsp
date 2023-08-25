<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book, java.text.NumberFormat"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	Book book = bookDAO.getBookById(id);
	NumberFormat format = java.text.NumberFormat.getNumberInstance(java.util.Locale.US);
	format.setGroupingUsed(true);
	%>

	<div class="container">


		<div class="col" align="left">
			<div class="row-xl-4">
				<div class="row">
					<div class="col col-lg-3">
						<img src="resources/images/<%=book.getFilename()%>"
							alt=<%=book.getName()%> width="286" height="366">
					</div>
					<div class="col-md-auto"></div>
					<div class="col">
						<h3><%=book.getName()%></h3>
						<p><%=book.getDescription()%>
						<p>
							<b>상품 코드 : </b><span class="badge badge-danger"> <%=book.getBookId()%></span>
						<p>
							<b>제조사</b> :
							<%=book.getPublisher()%>
						<p>
							<b>저자</b> :
							<%=book.getAuthor()%>
						<p>
							<b>재고 수</b> :
							<%=book.getUnitsInStock()%>
						<p>
							<b>총 페이지 수</b> :
							<%=book.getTotalPages()%>
						<p>
							<b>출판일</b> :
							<%=book.getReleaseDate()%>
						<h4 class="font-weight-bold text-secondary"><%=format.format(book.getUnitPrice())%>원
						</h4>
						<p>
							<a href="#" class="btn btn-info"> 상품 주문 &raquo;</a> <a
								href="./books.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>
