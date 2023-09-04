<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book, java.text.NumberFormat"%>
<%@page import="dao.BookRepository"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("이 도서를 장바구니에 추가하기겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
	String bookId = request.getParameter("id");
	/* BookRepository dao = BookRepository.getInstance();
	Book book = dao.getBookById(id); */
	NumberFormat format = java.text.NumberFormat.getNumberInstance(java.util.Locale.US);
	format.setGroupingUsed(true);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from book where b_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>

	<div class="container">


		<div class="col" align="left">
			<div class="row-xl-4">
				<div class="row">
					<div class="col col-lg-3">
						<img src="/upload/<%=rs.getString("b_fileName")%>" alt=<%=rs.getString("b_name")%>
							width="286" height="366">
					</div>
					<div class="col-md-auto"></div>
					<div class="col">
						<h3><%=rs.getString("b_name")%></h3>
						<p><%=rs.getString("b_description")%>
						<p>
							<b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("b_id")%></span>
						<p>
							<b>제조사</b> :
							<%=rs.getString("b_publisher")%>
						<p>
							<b>저자</b> :
							<%=rs.getString("b_author")%>
						<p>
							<b>재고 수</b> :
							<%=rs.getString("b_unitsInStock")%>
						<p>
							<b>총 페이지 수</b> :
							<%=rs.getString("b_totalPages")%>
						<p>
							<b>출판일</b> :
							<%=rs.getString("b_releaseDate")%>
						<h4 class="font-weight-bold text-secondary"><%=rs.getString("b_unitPrice")%>원
						</h4>
						<p>
						<form name="addForm"
							action="./addCart.jsp?id= <%=rs.getString("b_id")%>" method="post">
							<a href="#" class="btn btn-info" onclick="addToCart()"> 도서 주문
								&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
								&raquo;</a> <a href="./books.jsp" class="btn btn-secondary"> 도서
								목록 &raquo;</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<%
				}
				if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
				%>

<%@ include file="footer.jsp"%>
</body>
</html>


<%-- 
<div class="col" align="left">
			<div class="row-xl-4">
				<div class="row">
					<div class="col col-lg-3">
						<img src="/upload/<%=book.getFilename()%>" alt=<%=book.getName()%>
							width="286" height="366">
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
						<form name="addForm"
							action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
							<a href="#" class="btn btn-info" onclick="addToCart()"> 도서 주문
								&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
								&raquo;</a> <a href="./books.jsp" class="btn btn-secondary"> 도서
								목록 &raquo;</a>
						</form>
					</div>
				</div>
			</div>
		</div>
 --%>