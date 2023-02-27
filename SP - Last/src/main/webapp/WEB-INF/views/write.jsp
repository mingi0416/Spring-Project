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
<title>이거어때 글쓰기 페이지</title>
<!-- Bootstrap + Steller  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">
<script>

	function openChild() {
		// window.name = "부모창 이름"; 


		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("/ex/toMakePoll", "pop",
				"width=570, height=350, resizable = no, scrollbars = no");
		// openWin.focus();opener.document.getElementById("pollTitle").value = document.getElementById("cpollTitle").value

	}
	
	function closeChild() {


	
		openWin = window.open("/ex/toMakePoll", "pop",
				"width=570, height=350, resizable = no, scrollbars = no");
		// openWin.focus();opener.document.getElementById("pollTitle").value = document.getElementById("cpollTitle").value

	}

	function test(temp) {
		var str = '';
		for (var i = 0; i < temp.length; i++) {
			str += '<input type="text" name="item" value="'+temp[i].value+'"readonly/>'
			console.log(temp[i].value);
		}
		document.getElementById('pollitem').innerHTML = str
	};

	function addFilePath(msg) {
		alert(msg);

		document.getElementById("form1").reset();

	}
</script>
</head>
<body>

	<!-- Page Header -->
	<header class="header header-mini">
		<div class="header-title">이거어때</div>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Components</li>
			</ol>
		</nav>
	</header>
	<!-- End Of Page Header -->

	<!-- main content -->
	<div class="container">
		<br>
		<h3>글쓰기</h3>
		<hr>
		<div class="row mt-5">
			<div class="col-md-6">

				<form role="form" action="/ex/write" method="post"
					enctype="multipart/form-data" target="zeroFrame">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<h6 class="section-secondary-title">Title</h6>
					<div class="form-group">
						<input type="text" class="form-control" name='title'
							placeholder="제목을 입력해 주세요" style="width: 100%" required>
					</div>
					<h6 class="section-secondary-title">Writer</h6>
					<div class="form-group">
						<input type="text" name="writer" placeholder="작성자"
							style="width: 100%" value="${writer }" readonly>
					</div>
					<h6 class="section-secondary-title">Poll</h6>
					<button type="button" onclick="openChild()" class="btn btn-secondary">투표만들기</button>
					<div class="form-group" id="poll">

						<input type="text" id="pollTitle" name="pollTitle" readonly /> <input
							type="datetime-local" id="endtime" name="endtime" readonly />
						<div class="form-group" id="pollitem">
							<input type="text" name="item" readonly />
						</div>
					</div>
					<h6 class="section-secondary-title">Content</h6>
					<div class="form-group">
						<textarea class="form-control" name="content"
							id="exampleFormControlTextarea1" rows="10"
							placeholder="Example textarea" required></textarea>
					</div>
			</div>
			<div class="col-md-6">
				<h6 class="section-secondary-title">Images</h6>
				<div class="form-group">
					<input type='file' class="form-control" multiple="multiple"
						name='file' >
				</div>

			</div>
		</div>
				<button type="submit" class="btn btn-secondary" style="float:left">새글등록</button>
				</form>
		<form action="/ex/list" method="get">
			<button type="submit" class="btn btn-secondary">LIST ALL</button>
		</form>
	</div>
	<!-- end of inputs -->

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
	<script src="assets/vendors/jquery/jquery-3.4.1.js"></script>
	<script src="assets/vendors/bootstrap/bootstrap.bundle.js"></script>

	<!-- steller js -->
	<script src="${pageContext.request.contextPath}/resources/js/rubic.js"></script>

</body>
</html>

















