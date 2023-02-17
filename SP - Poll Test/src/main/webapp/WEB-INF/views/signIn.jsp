<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="../CSS/sp.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<title>Home</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<script>
    if(<%=request.getParameter("isSuccess")%>==true){
       alert('가입이 완료되었습니다.');
    }
    </script>
</head>
<body>
<h1>
	This is SignIn Page.  
</h1>
<c:url value="/login" var="loginUrl" />
<form name="frmLogin" action="${loginUrl}" method="POST">
<input type="hidden" name="${_csrf.parameterName}"
	 value = "${_csrf.token }"/>
    <p>
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" />
    </p>
    <p>
        <label for="pw">비밀번호</label>
        <input type="password" id="pw" name="pw"/>
    </p>
<button type = "submit">Sign In</button>
</form>

<br><br><br>

<a href="/ex/tosignUp">Not enrolled? Sign Up now</a>
<a href="/ex/forgot">Forgot userID/PW?</a>
</body>
</html>
