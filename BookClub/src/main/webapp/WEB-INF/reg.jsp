<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<meta charset="windows-1256">
<title>register</title>
</head>
<body>
<div class="container">
<h1 style="color:purble">Book Club</h1>
<h3>a place for friends to share thoughts on books</h3>
  <div class="row">
    <div class="col-sm">
    <h1>Register</h1>
		<form:form action ="/register" method="post" modelAttribute="newUser">
	  <div class="form-group">
	    <form:label for="exampleInputEmail1" path="name">Name:</form:label>
	    <form:input type="text" class="form-control" path="name" aria-describedby="emailHelp"/>
	    <form:errors path="name" class="error" />
	  </div>
	  <div class="form-group">
	    <form:label for="exampleInputEmail1" path="email">Email:</form:label>
	    <form:input type="email" class="form-control" path="email" aria-describedby="emailHelp"/>
	    <form:errors path="email" class="error" />
	  </div>
	  <div class="form-group">
	    <form:label for="exampleInputPassword1" path="password">Password:</form:label>
	    <form:input type="password" class="form-control" path="password"/>
	    <form:errors path="password" class="error" />
	  </div>
	  <div class="form-group">
	    <form:label for="exampleInputPassword1" path="confirmpassword">Confirm Password:</form:label>
	    <form:input type="password" class="form-control" path="confirmpassword"/>
	    <form:errors path="confirmpassword" class="error" />
	  </div>
	  
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
    </div>
    <div class="col-sm">
    <div>
    <h1>Log in</h1>
    <form:form action ="/login" method="post" modelAttribute="loginUser">
    <div>
      <form:label for="exampleInputEmail1" path="email">Email:</form:label>
	    <form:input type="email" class="form-control" path="email" aria-describedby="emailHelp"/>
	  </div>
	  <div class="form-group">
	    <form:label for="exampleInputPassword1" path="password">Password:</form:label>
	    <form:input type="password" class="form-control" path="password"/>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
    </div>
    </div>
  </div>
</div>
</body>
</html>