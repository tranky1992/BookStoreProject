<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>Create New User</title>
	<link rel="stylesheet" href ="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div align="center">
	
		<h1 class="pageheading">
		<c:if test="${user != null}">
			Edit User
		</c:if>
		<c:if test="${user == null}">
					 Create New User
		</c:if>

		</h1>
	</div>
	<br>
	<div align="center">
		<c:if test="${user!=null}">
			<form action="update_user" method="post" id ="userForm">
			<input type = "hidden" name = "userId" value = "${user.userId}"> 
		</c:if>
		<c:if test="${user == null}">
			<form action="create_user" method="post" id="userForm" >
	 	</c:if>
	 <table class="form">
	 	
	 	<tr>
	 		<td align="right">Email: </td>
	 		<td align="left"><input type="text" name="email" id="email" size="25" value = "${user.email}"/></td>
	 	</tr>
	 	<tr>
	 		<td align="right">Full Name: </td>
	 		<td align="left"><input type="text" id="fullname" name="fullname" size="25" value = "${user.fullName}"/></td>
	 	</tr>
	 	<tr>
	 		<td align="right">Password: </td>
	 		<td align="left"><input type="password" id="password" name="password" size="25" value = "${user.password}"/></td>
	 	</tr>
	 	<tr>
	 		<td align="right">Confirm Password: </td>
	 		<td align="left"><input type="password" id="password1" name="password1" size="25"/></td>
	 	</tr>
	 	
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
		$("#userForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullname: "required",
				password: "required",
				password1: {
					required: true,
					equalTo: "#password"
				},
			},
			messages: {
				email: {
					required: "Mời bạn nhập email!!",
					email: "Vui lòng nhập email hợp lệ!"
				},
				fullname: "Mời bạn nhập họ tên!!",
				password: "Mời bạn nhập mật khẩu!!",
				password1: {
					required: "Mời bạn nhập lại mật khẩu!!",
					equalTo: "Mật khẩu không đúng"
				},
			}
		});
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
	});
</script>
</html>