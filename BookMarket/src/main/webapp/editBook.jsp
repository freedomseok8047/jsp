<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.text.NumberFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품도서 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 도서를 삭제합니다!!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품도서 편집</h1>
		</div>
	</div>

	<%
	/* BookRepository dao = BookRepository.getInstance();
	ArrayList<Book> listOfBooks = dao.getAllBooks(); */
	NumberFormat format = java.text.NumberFormat.getNumberInstance(java.util.Locale.US);
	format.setGroupingUsed(true);
	%>
	<%@ include file="dbconn.jsp"%>
	<div class="container">
		<div class="col" align="left">
			<%
			/* for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i); 
			*/
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="row-xl-4">
				<div class="row">
					<div class="col col-lg-2">
						<img src="/upload/<%=rs.getString("b_fileName")%>"
							alt=<%=rs.getString("b_id")%> width="143" height="183">
					</div>
					<div class="col-md-auto"></div>
					<div class="col">
						<h4>
							[<%=rs.getString("b_category")%>]<%=rs.getString("b_name")%>
						</h4>
						<p><%=rs.getString("b_description")%>
						<div class="container">
							<div class="row">
								<p class="col font-weight-bold text-secondary"><%=rs.getString("b_author")%>
									|
									<%=rs.getString("b_publisher")%>
									|
									<%=rs.getString("b_unitPrice")%>원
								<p>
									<%
									if (edit.equals("update")) {
									%>
									<a href="./updateBook.jsp?id=<%=rs.getString("b_id")%>"
										class="btn btn-secondary" role="button"> 수정 &raquo;</a>
									<%
									} else if (edit.equals("delete")) {
									%>
									<a href="#"
										onclick="deleteConfirm('<%=rs.getString("b_id")%>')"
										class="btn btn-danger" role="button"> 삭제 &raquo;</a>
									<%
									}
									%>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>


</body>
</html>
</body>
</html>