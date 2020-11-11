<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
	<title>Manager Customers - STB Book Store Administration</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>			
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">Customer Management </h1>
		<a href="customer_form.jsp">Create New Customer</a>
	</div>
	<br>
	<c:if test="${message !=null}">
		<div align="center"><h4 class="message">${message}</h4>
		</div>
	</c:if>
	<div align="center">
	<table border = "1" cellpadding="7">
			  <tr >
			    <th >Index</th>
			    <th >ID</th> 
			    <th >Email</th>
			    <th >Full Name</th>
			    <th >City</th>
			    <th >Country</th>
			    <th >Registered Date</th>
			    <th >Actions</th>
			  </tr>
			  <c:forEach var="customer" items= "${listCustomer}" varStatus = "status">
			  	<tr>
			  		<td>${status.index + 1}</td>
			  		<td>${customer.customerId}</td>
			  		<td>${customer.email}</td>
			  		<td>${customer.fullname}</td>
			  		<td>${customer.city}</td>
			  		<td>${customer.country}</td>
			  		<td>${customer.registerDate}</td>
			  		<td>
			  			<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp;
			  			<a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
			  			
			  		</td>
			  		
			  	</tr>
			  </c:forEach>
			</table>
		<br>
	</div>
	
	<jsp:directive.include file="footer.jsp" />
	<script>
	
		$(document).ready(function(){
			$(".deleteLink").each(function() {
				$(this).on("click", function(){
					userId = $(this).attr("id");
					if(confirm('Bạn chắc chắn muốn xoá người dùng với Id là: ' + userId +'?')){
						window.location='delete_user?id=' + userId;
					}	
				});
			});
		});
		
	</script>
</body>
</html>