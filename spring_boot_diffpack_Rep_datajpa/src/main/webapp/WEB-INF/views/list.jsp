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
<title>Insert title here</title>
</head>
<body>
	<table border="3" align="center" class="table table-bordered">
		<th>Id</th>
		<th>name</th>
		<th>city</th>
		<c:forEach var="lis" items="${findlist}">
		
			<c:if test="${lis.id==ls.id }">
			<tr>
				<td>${lis.id }</td>
				<td>${lis.name }</td>
				<td>${lis.city }</td>
				
				<td><a class="btn btn-success" href="delete?id=${lis.id }">Delete</a>
				<td><a class="btn btn-success" href="edit?id=${lis.id }">Edit</a>
			</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="lis" items="${list}">
		
			<tr>
				<td>${lis.id }</td>
				<td>${lis.name }</td>
				<td>${lis.city }</td>
				
				<td><a class="btn btn-success" href="delete?id=${lis.id }">Delete</a>
				<td><a class="btn btn-success" href="edit?id=${lis.id }">Edit</a>
			</tr>
		
		</c:forEach>

	</table>
	<c:if test="${current>0}">
<a href="/listEmployee?page=${current-1}" >prev</a>
</c:if>
<c:forEach begin="0" end="${total-1 }" varStatus="loop">
<c:choose>
<c:when test="${loop.index==current}">${loop.index+1}</c:when>
<c:otherwise><a href="/listEmployee?page=${loop.index}">${loop.index+1}</a></c:otherwise>
</c:choose >

</c:forEach>
<c:if test="${current<total-1}">
<a href="/listEmployee?page=${current+1 }">Next</a>
</c:if>
</body>
</html>