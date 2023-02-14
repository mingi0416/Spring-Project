<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../views/include/header1.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<html>
<head>
	<title>Home</title>
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
