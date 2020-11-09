<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>Create New Category</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div align="center">
	
		<h1 class="pageheading">
		<c:if test="${category != null}">
			Edit Category
		</c:if>
		<c:if test="${category == null}">
					 Create New Category
		</c:if>

		</h1>
	</div>
	<br>
	<div align="center">
		<c:if test="${category != null}">
			<form action="update_category" method="post" id="categoryForm">
			<input type = "hidden" name = "categoryId" value = "${category.categoryId}"> 
		</c:if>
		<c:if test="${category == null}">
			<form action="create_category" method="post" id="categoryForm">
	 	</c:if>
	 <table class="form">
 		<tr>
	 		<td align="right">Name: </td>
	 		<td align="left"><input type="text" id="name" name="name" size="25" value = "${category.name}"/></td>
	 	</tr>
	 	
	 	<div id="error-nul"></div>
	 	<tr><td>&nbsp;</td></tr>
	 	<tr>
	 		<td colspan="2" align="center">
	 			<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
	 			<button id="buttonCancel">Cancel</button>
	 		</td>
	 	</tr>
	 </table>
	</form>	
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
			
			
			$(document).ready(function(){
				$("#categoryForm").validate({
					rules: {
						name: "required",
					
					},
					messages: {
						name: "Mời bạn nhập tên thể loại!",
					}
				});
				
				$("#buttonCancel").click(function(){
					history.go(-1);
				});
			});

</script>
</html>