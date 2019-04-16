<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Edit page</title>
</head>
<body>

	<table class="table table-bordered">
		<th>Id</th>
		<th>name</th>
		<th>city</th>
		<th>email</th>
		<th>password</th>
		<th>confirm password</th>
		<c:forEach var="lis" items="${listEmployee }">
			<c:if test="${lis.id!=employee.id }">
				<tr>
					<td>${lis.id}</td>
					<td>${lis.name}</td>
					<td>${lis.city}</td>
					<td>${lis.email}</td>
					<td>${lis.password}</td>
					<td>${lis.confirmPassword}</td>
					<td><a class="btn btn-success" href="delete?id=${lis.id}">Delete</a>
					<td><a class="btn btn-success" href="edit?id=${lis.id}">Edit</a>
				</tr>
			</c:if>
			<c:if test="${lis.id==employee.id }">
				<form:form modelAttribute="employee" action="update">
					<tr>
						<td><form:input path="id" value="${lis.id}"/> </td>
						<td><form:input path="name" value="${lis.name}"/> </td>
						<td><form:input path="city" value="${lis.city}"/> </td>
						<td><form:input path="email" value="${lis.email}"/> </td>
						<td><form:input path="password" value="${lis.password}"/> </td>
						<td><form:input path="confirmPassword" value="${lis.confirmPassword}"/> </td>
						<td><a class="btn btn-success" href="delete?id=${lis.id}">Delete</a>
						<td><input class="btn btn-success" type="submit" value="update">
					</tr>
				</form:form>

			</c:if>
		</c:forEach>

	</table>

</body>
</html>