<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
	<title>Manager Book - STB Book Store Administration</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>		
	
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h1 class="pageheading">Book Management </h1>
		<a href="new_book">Create New Book</a>
	</div>
	<br>
	<c:if test="${message != null}">
		<div align="center"><h4 class="message">${message} </h4>
		</div>
	</c:if>
	<div align="center">
	<table border = "1" cellpadding="7">
			  <tr >
			    <th >Index</th>
			    <th >ID</th> 
			    <th >Image</th>
			    <th >Title</th>
			    <th >Author</th>
			    <th >Category</th>
			    <th >Price</th>
			    <th >Last Updated</th>
			    <th >Action</th>	
			  </tr>
			  <c:forEach var="book" items= "${listBooks}" varStatus = "status">
			  	<tr>
			  		<td>${status.index + 1}</td>
			  		<td>${book.bookId}</td>
			  		<td>
			  			<img src="data:img/jpg;base64, ${book.base64Image}" width="90" height="100"	/>
			  		
			  		</td>
			  		<td>${book.title}</td>
			  		<td>${book.author}</td>
			  		<td>${book.category.name}</td>
			  		<td>${book.price} đ</td>
			  		<td><fmt:formatDate pattern = 'yyyy/MM/dd' value='${book.publishDate}'/></td>

			  		<td>
			  			<a href="edit_book?id=${book.bookId}">Edit</a> &nbsp;
			  			<a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
			  			
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
					bookId = $(this).attr("id");
					if(confirm('Bạn chắc chắn muốn xoá sách với Id là: ' + bookId +'?')){
						window.location='delete_book?id=' + bookId;
					}	
				});
			});
		});
		
	</script>
</body>
</html>