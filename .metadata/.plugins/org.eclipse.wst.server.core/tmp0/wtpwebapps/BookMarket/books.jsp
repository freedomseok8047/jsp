<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.text.NumberFormat"%>
<%@ page import="dto.Book"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">도서 목록</h1>
		</div>
	</div>
	<%
	ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	NumberFormat format = java.text.NumberFormat.getNumberInstance(java.util.Locale.US);
	format.setGroupingUsed(true);
	%>

	<div class="container">
		<div class="col" align="left">
			<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
			%>
			<div class="row-xl-4">
				<div class="row">
					<div class="col col-lg-2">
						<img src="resources/images/<%=book.getFilename()%>"
							alt=<%=book.getName()%> width="143" height="183">
					</div>
					<div class="col-md-auto"></div>
					<div class="col">
						<h4>
							[<%=book.getCategory()%>]<%=book.getName()%>
						</h4>
						<p><%=book.getDescription()%>
						<div class="container">
							<div class="row">
								<p class="col font-weight-bold text-secondary"><%=book.getAuthor()%>
									|
									<%=book.getPublisher()%>
									|
									<%=format.format(book.getUnitPrice())%>원
								<p>
									<a href="./book.jsp?id=<%=book.getBookId()%>"
										class="btn btn-secondary" role="button">도서 정보 &raquo;</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />


</body>
</html>