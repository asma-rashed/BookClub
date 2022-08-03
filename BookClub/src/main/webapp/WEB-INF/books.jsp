<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<meta charset="windows-1256">
<title>Books</title>
</head>
<body>
	<body class="container">
	<div class="row">
		<div class="col justify-content-right">
			<h1>Welcome, ${user.name}</h1>
			<p>Books from everyone's shelves</p>
		</div>
		<div class="col ">
			<p><a href="/logout">Logout</a></p> <p><a href="/books/new">+ Add a book to
				my shelf!</a></p>
		</div>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="row">Id</th>
				<th scope="row">Title</th>
				<th scope="row">Author Name</th>
				<th scope="row">Posted By:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books }">
			<tr>
				<th scope="row"><c:out value="${book.id}"></c:out></th>
				<th><a href="/books/${book.id}"><c:out value="${book.title}"/></a></th>
				<th><c:out value="${book.author}"></c:out></th>
				<th><c:out value="${book.postedBy.name}"></c:out></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>