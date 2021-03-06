<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	
	<title>Admin Login</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	
</head>
<body>
	<div align="center">
		<h1 >Book Store Administration</h1>
		<h2 >Admin Login</h2>
		
			<c:if test="${message != null}">
				<div align="center"><h4 class="message">${message}</h4></div>
			</c:if>
	</div>
		<div  align="center">
		<form action="login" id="formLogin" method="post">
			<table>
				<tr>
					<td align="right">Email: </td>
	 				<td align="left"><input type="text" name="email" id="email" size="25" value = "${user.email}"/></td>
				</tr>
				<tr>
					<td align="right">Password: </td>
					<td align="left"><input type="password" id="password" name="password" size="25" value = "${user.password}"/></td>
				</tr>
				<tr>
		 			<td colspan="2" align="center">
		 				<button type="submit">Login</button>&nbsp;&nbsp;&nbsp;&nbsp;
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
			$("#formLogin").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
					password: "required",
				},
				messages: {
					email: {
						required: "Mời bạn nhập email!!",
						email: "Vui lòng nhập email hợp lệ!"
					},
					password: "Mời bạn nhập mật khẩu!!"
				}
			});
			$("#buttonCancel").click(function(){
				history.go(0);
			});
		});
</script>
</html>