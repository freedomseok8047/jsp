<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<% 
		request.setCharacterEncoding("UTF-8");

		String filename = "";
		String realFolder = "C:\\upload";
		int maxSize = 5*1024*1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder,maxSize,encType, new DefaultFileRenamePolicy());
	
		String bookId = multi.getParameter("bookId"); //245 페이지 내용으로 변경
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String author = multi.getParameter("author");
		String publisher = multi.getParameter("publisher");
		String description = multi.getParameter("description");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String totalPages = multi.getContentType("totalPages");
		String releaseDate = multi.getContentType("releaseDate");
		String condition = multi.getParameter("condition");
		
		Integer price;
		
		if (unitPrice.isEmpty()) {
			price = 0;}
		else {
			price = Integer.valueOf(unitPrice); //int값 -> string 값으로 변환
		}
		
			
		long stock;
			
		if (unitsInStock == null && unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock); //long값 -> string 값으로 변환
			
		Enumeration files = multi.getFileNames(); //246 페이지 내용 추가
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into book value(?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, author);
		pstmt.setString(5, publisher);
		pstmt.setString(6, description);
		pstmt.setString(7, category );
		pstmt.setLong(8, stock);
		pstmt.setString(9, totalPages);
		pstmt.setString(10, releaseDate);
		pstmt.setString(11, condition);
		pstmt.setString(12, fileName);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		
		
		response.sendRedirect("books.jsp");
		
	%>

<%-- 	<% 
		request.setCharacterEncoding("UTF-8");

		String filename = "";
		String realFolder = "C:\\upload";
		int maxSize = 5*1024*1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder,maxSize,encType, new DefaultFileRenamePolicy());
	
		Book newBook = new Book();
		newBook.setBookId(multi.getParameter("bookId"));
		newBook.setName(multi.getParameter("name"));
		
		
		String unitPrice = multi.getParameter("unitPrice");
		Integer price;
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			price = Integer.valueOf(unitPrice);
		}
		newBook.setUnitPrice(price);
		newBook.setAuthor(multi.getParameter("author"));
		newBook.setDescription(multi.getParameter("description"));
		newBook.setPublisher(multi.getParameter("publisher"));
		newBook.setCategory(multi.getParameter("category"));
		
		
		String unitInStock = multi.getParameter("unitsInStock");
		long stock;
		if(unitInStock == null && unitInStock.isEmpty() ){
			stock = 0;
		}else{
			stock = Long.valueOf(unitInStock);
		}
		newBook.setUnitsInStock(stock);
		
		String totalPages = multi.getParameter("totalPages");
		long pages;
		if(totalPages == null && totalPages.isEmpty() ){
			pages = 0;
		}else{
			pages = Long.valueOf(totalPages);
		}
		newBook.setTotalPages(pages);
		
		
		newBook.setReleaseDate(multi.getParameter("releaseDate"));
		
		newBook.setCondition(multi.getParameter("condition"));
		
		Enumeration files = multi.getFileNames();
		String fName = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fName);
		
		newBook.setFilename(fileName);
		
		BookRepository dao = BookRepository.getInstance();
		dao.addBook(newBook);
		
		response.sendRedirect("books.jsp");
		
	%> --%>