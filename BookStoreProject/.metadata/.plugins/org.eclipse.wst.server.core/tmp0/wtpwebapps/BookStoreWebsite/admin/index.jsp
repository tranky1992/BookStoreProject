<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>STB Book Store Administration</title>
	<link rel="stylesheet" href ="../css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	<div align="center">
		<h2 class="pageheading">
			Administration Dashboard
		</h2>
	</div>
	
	<div align="center">
	<hr width = "70%"/>
		<h2 class="pageheading">Quick Action:</h2>
		<b>
		<a href="create_book">New Book</a> &nbsp;
		<a href="create_user">New User</a> &nbsp;
		<a href="create_category">New Category</a> &nbsp;
		<a href="create_customer">New Customer</a> 
		</b>
	</div>
	<div align="center">
	<hr width = "70%"/>
		<h2 class="pageheading">Recent Sales:</h2>
	</div>
	<div align="center">
	<hr width = "70%"/>
		<h2 class="pageheading">Recent Reviews:</h2>
	</div>
	<div align="center">
	 <hr width = "70%"/>
		<h2 class="pageheading">Statistics:</h2>
		<hr width = "70%"/>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>