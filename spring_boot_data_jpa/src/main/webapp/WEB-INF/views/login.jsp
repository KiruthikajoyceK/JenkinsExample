<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>registration</title>
<script>

function name()
{
	if(document.getElementById("name").value=="")
		{
		document.getElementById("n").innerHTML="name required";
		return false;
		}
	else
		{
		return true;
		}
	}
</script>

</head>
<body>
	<form:form action="/save" modelAttribute="employee">

		<table align="center" cellspacing="15" class="table table-bordered">
			<tr>
				<td>Id</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><form:input path="name" /><p id="n" ></p></td>
			</tr>

			<tr>
				<td>city</td>
				<td><form:input path="city" /></td>
			</tr>
			<tr>
				<td>email</td>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><form:input type="password" path="password" /></td>
			</tr>
			<tr>
				<td>confirmPassword</td>
				<td><form:input  type="password" path="confirmPassword" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="save" onclick="return name()"></td>
			</tr>
		</table>
	</form:form>

</body>
</html>