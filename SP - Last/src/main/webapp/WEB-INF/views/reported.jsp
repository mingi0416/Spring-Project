<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with Rubic landing page.">
<meta name="author" content="Devcrud">
<title>이거어때 신고관리 페이지</title>
<!-- Bootstrap + Steller  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">
</head>
<body>

	<!-- Page Header -->
	<header class="header header-mini">
		<div class="header-title">이거어때</div>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/ex/list">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Components</li>
			</ol>
		</nav>
	</header>
	<!-- End Of Page Header -->

	<!-- main content -->
	<div class="container">
		<br>
		<h3>신고게시글목록</h3>
		<hr>

		<div class="row mt-5">
			<table width=100% border="1">
				<tr>
					<th style="width: 10px">BNO</th>
					<th>reason</th>
					<th style="width: 100px">reporter</th>
				</tr>

				<c:forEach items="${board_list}" var="board">

					<tr>
						<td style="width: 10px"><a href="/ex/read?bno=${board.bno}">${board.bno }</a></td>
						<td>${board.reason }</td>
						<td style="width: 100px">${board.reporter }</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>



	</div>
	<!-- end of inputs -->
	<div class="container">
		<br>
		<h3>신고댓글목록</h3>
		<hr>
		<div class="row mt-5">
			<table width=100% border="1">
				<tr>
					<th style="width: 10px">BNO</th>
					<th style="width: 10px">RNO</th>
					<th>reason</th>
					<th style="width: 100px">reporter</th>
				</tr>

				<c:forEach items="${reply_list}" var="reply">

					<tr>
						<td style="width: 10px"><a href="/ex/read?bno=${reply.bno}#${reply.rno}">${reply.bno }</a></td>
						<td style="width: 10px">${reply.rno }</td>
						<td>${reply.reason }</td>
						<td style="width: 100px">${reply.reporter }</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	<div>
		<form action="/ex/list" method="get">
			<button type="submit" class="btn btn-secondary">LIST ALL</button>
		</form>
	</div>

	</div>

	<!-- devider -->
	<div class="py-5"></div>


	<!-- Page Footer -->
	<footer class="footer py-4 bg-light">
		<div class="container text-center">
			<p class="mb-4 small">
				Copyright
				<script>
					document.write(new Date().getFullYear())
				</script>
				&copy; <a href="http://www.devcrud.com">여기어때</a>
			</p>

		</div>
	</footer>
	<!-- End of page footer -->

	<!-- core  -->

	<!-- steller js -->
	<script src="${pageContext.request.contextPath}/resources/js/rubic.js"></script>

</body>
</html>






