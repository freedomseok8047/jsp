<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%--556 페이지 내용 추가 --%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%-- <%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %> : 556 페이지로 내용 삭제--%>

<% request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\upload"; //웹 애플리케이션상의 절대 경로
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5MB
	String encType = "utf-8"; //인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	/* String productId = request.getParameter("productId"); //이전 내용
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");*/
	
	String productId = multi.getParameter("productId"); //245 페이지 내용으로 변경
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
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
	
	String sql = "insert into product value(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("products.jsp");
	
%>
<%--61행~81행까지 556 페이지 내용으로 추가한 부분 --%>
		
	<%-- ProductRepository dao = ProductRepository.getInstance();
		
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	newProduct.setFilename(fileName); //246 페이지 내용 추가
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
%> : 556 페이지로 내용 삭제--%>    
