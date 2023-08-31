<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String realFolder = "C:\\upload";
		int maxSize = 5*1024*1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request,
				realFolder,maxSize,encType
				, new DefaultFileRenamePolicy());
	
		Product newProduct = new Product();
		newProduct.setProductId(multi.getParameter("productId"));
		newProduct.setPname(multi.getParameter("name"));
		
		String unitPrice = multi.getParameter("unitPrice");
		Integer price;
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			price = Integer.valueOf(unitPrice);
		}
		newProduct.setUnitPrice(price);
		
		newProduct.setDescription(multi.getParameter("description"));
		newProduct.setMenufacturer(multi.getParameter("manufacturer"));
		newProduct.setCategory(multi.getParameter("category"));
		
		String unitInStock = multi.getParameter("unitsInStock");
		long stock;
		if(unitInStock == null && unitInStock.isEmpty() ){
			stock = 0;
		}else{
			stock = Long.valueOf(unitInStock);
		}
		newProduct.setUnitsInStock(stock);
		
		newProduct.setCondition(multi.getParameter("condition"));
		
		Enumeration files = multi.getFileNames();
		String fName = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fName);
		newProduct.setFilename(fileName);
		
		ProductRepository dao = ProductRepository.getInstance();
		dao.addProduct(newProduct);
		
		response.sendRedirect("products.jsp");
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	