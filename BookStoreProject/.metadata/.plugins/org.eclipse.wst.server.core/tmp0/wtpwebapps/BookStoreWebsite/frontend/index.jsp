<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<link rel="stylesheet" href ="css/style.css">
	<link rel="stylesheet" href ="css/jquery-ui.min.css">
	<link rel="stylesheet" href ="css/jquery-ui.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
<title>STB Books - Online Books Store	</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<div align="center" style="width: 80%; margin: 0 auto;">
		<h2>New Books</h2>
		<c:forEach items="${listNewBooks}" var="book">
			<div style="display: inline-block; margin: 20px">
				<div>
					<a href="view_book?id=${book.bookId}">
						<img src="data:img/jpg;base64, ${book.base64Image}" width="128" height="145"	/>
					</a>
				</div>
				<br>
				<div>
					<a href="view_book?id=${book.bookId}">
						${book.title}
					</a>
				</div>
				<div>Rating *****</div>
				<div><i><b>by ${book.author}</b></i></div>
				<div><b>${book.price}đồng</b></div>
			</div>
		</c:forEach>
	</div>
	<div align="center" style="clear: both">
		<h2>Best Selling Books</h2>
	</div>
	<div align="center" style="clear: both">
		<h2>Most-favored Books</h2>
	</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>