<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<meta charset="windows-1256">
<title>${book.title}</title>
</head>
<body>
	<div class="container">
	<div class="row">
		<div class="col">
			<h1>${book.title}</h1>
		</div>
		<div class="col">
			<a href="books">back to the shelves</a>
		</div>
	</div>
	<c:choose>
		<c:when test="${user_id == book.postedBy.id }">
			<h4>You read ${book.title} by ${book.author }</h4>
			<p>Here are your thoughts</p>
		</c:when>
		<c:otherwise>
			<h4>${book.postedBy.name} read ${book.title} by ${book.author}</h4>
			<p>Here are ${book.postedBy.name } thoughts</p>
		</c:otherwise>
	</c:choose>
	<hr style="height:2px; width:2px;">
	<div>${book.thought}</div>
	<hr >
	<c:if test="${user_id == book.postedBy.id }"><a href="/books/edit/${book.id }" class="btn btn-dark" >Edit</a></c:if>
	</div>
</body>
</html>