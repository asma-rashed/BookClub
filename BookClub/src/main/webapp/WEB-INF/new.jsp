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
<title>Add New Book</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Add a Book To Your Shelf!</h1>
			</div>
			<div class="col">
				<a href="books">back to the shelves</a>
			</div>
		</div>
		<form:form action="/books/new" method="post" modelAttribute="book">
			<form:hidden path="postedBy" value="${user_id}"/>
			<div>
				<form:label path="title" class="form-label">Title</form:label>
				<form:input path="title" class="form-control"/>
				<form:errors path="title"/>
			</div>
			<div>
				<form:label path="author" class="form-label">Author</form:label>
				<form:input path="author" class="form-control"/>
				<form:errors path="author"/>
			</div>
			<div>
				<form:label path="thought" class="form-label">My Thoughts:</form:label>
				<form:input path="thought" type="textbox" class="form-control"></form:input>
				<form:errors path="thought"/>
			</div>
			<button class="btn btn-primary mt-2">Submit</button>
		</form:form>
	</div>
</body>
</html>