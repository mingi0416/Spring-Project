<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>선택 장애를 위한 투표 커뮤니티 사이트</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/CSS/styles.css"
	rel="stylesheet" />
<script>
	if (
<%=request.getParameter("isSuccess")%>
	== true) {
		alert('가입이 완료되었습니다.');
	}

	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							alert("list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val());

							self.location = "list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						})

				$('.writeBtn').on("click", function(event) {
					location.href = "/ex/sboard/write";
				});
				$('#newBtn').on("click", function(event) {
					self.location = "write";
				});

			});

	function fn_delete() {
		var result = confirm("정말 탈퇴하시겠습니까?")
		if (result) {
			window.location.href = "/ex/info_delete";
		}

	}
</script>


</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/ex/success">사이트명</a>
		</div>
	</nav>
	<!-- Page header with logo and tagline-->
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Welcome to 선택 장애를 위한 사이트!</h1>
				<p class="lead mb-0">선택하기 힘들 때 사이트에 고민을 업로드하고 투표를 받아서 결정해보세요</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top"
						src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">당신의 고민은?</div>
						<h2 class="card-title">Featured Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a class="btn btn-primary" href="/ex/toWrite">글쓰기</a>
					</div>
				</div>
				<!-- Nested row for non-featured blog posts-->
				<div class="row">
					<div class="col-lg-6">
						<!-- Blog post-->
						<div class="card mb-4">



							<select name="searchType">
								<option value="n"
									<c:out value="${pageMaker.searchType==null?'selected':'' }"/>>----</option>
								<!-- <option value="n" selected>----</option>
    		<option value="n">----</option> -->
								<option value="t"
									<c:out value="${pageMaker.searchType eq 't'?'selected':'' }"/>>title</option>
								<option value="c"
									<c:out value="${pageMaker.searchType eq 'c'?'selected':'' }"/>>content</option>
								<option value="w"
									<c:out value="${pageMaker.searchType eq 'w'?'selected':'' }"/>>writer</option>
								<option value="tc"
									<c:out value="${pageMaker.searchType eq 'tc'?'selected':'' }"/>>title
									or content</option>
								<option value="cw"
									<c:out value="${pageMaker.searchType eq 'cw'?'selected':'' }"/>>c
									w</option>
								<option value="tcw"
									<c:out value="${pageMaker.searchType eq 'tcw'?'selected':'' }"/>>t
									c w</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${pageMaker.keyword}">
							<button id="searchBtn">검색하기</button>
							<button id="newBtn">새글</button>
						</div>
						<table class='customers' width=100% border="1">
							<tr>
								<th style="width: 10px">BNO</th>
								<th>TITLE1</th>
								<th style="width: 100px">WRITER</th>
								<th style="width: 200px">REGDATE</th>
								<th style="width: 40px">VIEWCNT</th>
							</tr>

							<c:forEach items="${list}" var="dto">

								<tr>
									<td style="width: 10px">${dto.bno }</td>
									<td><c:if test="${dto.depth > 0}">
											<c:forEach begin="1" end="${dto.depth}">
                           &nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
											</c:forEach>
                        └RE:
                    </c:if> <a
										href="/ex/read${pageMaker.makeSearch()}&bno=${dto.bno} &grpno=${dto.grpno} &depth=${dto.depth} &grpord=${dto.grpord}">${dto.title }</a></td>
									<td style="width: 100px">${dto.writer }</td>
									<td style="width: 200px"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${dto.regdate }" /></td>
									<td style="width: 40px">${dto.viewcnt }</td>
								</tr>

							</c:forEach>
						</table>

					</div>
				</div>
			</div>
		</div>
		<!-- Pagination-->
		<nav aria-label="Pagination">
			<hr class="my-0" />
			<ul class="pagination justify-content-center my-4">


				<c:if test="${pageMaker.page !=1}">
					<li class="page-item"><a
						href='success${pageMaker.makeSearch(1)}'>&laquo;</a></li>
				</c:if>
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a
						href='success${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${ pageMaker.endPage}" var="idx">
					<li class="page-item"><a
						href='success${pageMaker.makeSearch(idx)}'
						<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
							${idx}</a></li>
				</c:forEach>

				<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

				<c:if test="${pageMaker.next }">
					<li class="page-item"><a
						href='success${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a></li>

				</c:if>


				<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
					<li class="page-item"><a
						href='success${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a></li>
				</c:if>



			</ul>
		</nav>
	</div>
	<!-- Side widgets-->
	<div class="col-lg-4">
		<!-- Search widget-->
		<div class="card mb-4">
			<div class="card-header">SignIn</div>
			<c:url value="/login" var="loginUrl" />
			<form name="frmLogin" action="${loginUrl}" method="POST">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token }" />
				<div class="card-body">
					<div class="input-group">
						<input class="form-control" type="text" name="id"
							placeholder="Enter your id" aria-label="id"
							aria-describedby="button-search" />

					</div>
					<div class="input-group">
						<input class="form-control" type="text" name="password"
							placeholder="Enter your pw" aria-label="Enter your pw"
							aria-describedby="button-search" />

					</div>
					<div class="input-group">

						<button class="btn btn-primary" id="button-search" type="submit">SignIn!</button>
					</div>
				</div>
			</form>
			<a class="small text-muted" href="/ex/tosignUp">Not enrolled?
				Sign Up now</a><br> <a class="small text-muted" href="/ex/tosignUp">Forgot
				userID/PW?</a>
		</div>
		<!-- Categories widget-->
		<div class="card mb-4">
			<div class="card-header">Top5 인기글</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-6">
						<ul class="list-unstyled mb-0">
							<li><a href="#!">Web Design</a></li>
							<li><a href="#!">HTML</a></li>
							<li><a href="#!">Freebies</a></li>
						</ul>
					</div>
					<div class="col-sm-6">
						<ul class="list-unstyled mb-0">
							<li><a href="#!">JavaScript</a></li>
							<li><a href="#!">CSS</a></li>
							<li><a href="#!">Tutorials</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Side widget-->
		<div class="card mb-4">
			<div class="card-header">AD</div>
			<div class="card-body">You can put anything you want inside of
				these side widgets. They are easy to use, and feature the Bootstrap
				5 card component!</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 이거어때 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>

