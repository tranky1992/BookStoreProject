<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
	<title>Manager Categories - STB Book Store Administration</title>
	<link rel="stylesheet" href ="../css/style.css">	
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>	
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">Category Management </h1>
		<a href="category_form.jsp">Create New Category</a>
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
			    <th >Name</th>
			    <th >Actions</th>
			  </tr>
			  <c:forEach var="category" items= "${listCategory}" varStatus = "status">
			  	<tr>
			  		<td>${status.index + 1}</td>
			  		<td>${category.categoryId}</td>

			  		<td>${category.name}</td>
			  		<td>
			  			<a href="edit_category?id=${category.categoryId}">Edit</a> &nbsp;
			  			<a href="javascript:void(0);" class="deleteLink" id="${category.categoryId}">Delete</a>
			  			
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
						categoryId = $(this).attr("id");
						if(confirm('Bạn chắc chắn muốn xoá thể loại với Id là: ' + categoryId +'?')){
							window.location='delete_category?id=' + categoryId;
						}	
					});
				});
			});
	
	</script>
</body>
</html>