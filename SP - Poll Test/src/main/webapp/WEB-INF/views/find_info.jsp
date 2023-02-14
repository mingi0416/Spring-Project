<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<title>Home</title>


</head>
<body>

	<h1>This is Find_info Page.</h1>
	<h2>Forgot ID?</h2>
	<form action="/ex/find_id" method="get">
		<label for="name">name</label> 
		<input type="text" name="name" id="name" placeholder="김남길"><br> 
		<label for="phone">Phone Number</label> 
		<input type="text" name="phone" placeholder="010-1234-5678"><br>
		<button type="submit">Find_id</button>
		<span id="id_value"> ${id}</span>
	</form>
	
	<h2>Forgot PW?</h2>
		<form action="/ex/find_pw" method="get">
		<label for="id">id</label> 
		<input type="text" name="id" id="id" placeholder="abc123"><br>
		<label for="name">name</label> 
		<input type="text" name="name" id="name" placeholder="김남길"><br> 
		<label for="phone">Phone Number</label> 
		<input type="text" name="phone" placeholder="010-1234-5678"><br>
		<button type="submit">Find_pw</button>
		<span id="pw_value"> ${pw}</span>
	</form>

	<a href="/ex/signIn">To SignIn Page</a>

</body>
</html>
