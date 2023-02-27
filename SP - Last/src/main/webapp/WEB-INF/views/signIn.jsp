<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with Rubic landing page.">
<meta name="author" content="Devcrud">
<title>여기어때 LoginPage</title>
<!-- font icons -->

<!-- Bootstrap + Rubic main styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">

<script>
    if(<%=request.getParameter("isSuccess")%>==true){
       alert('가입이 완료되었습니다.');
    }
    </script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<nav id="scrollspy"
		class="navbar page-navbar navbar-dark navbar-expand-md fixed-top"
		data-spy="affix" data-offset-top="20">
		<div class="container">
			<a class="navbar-brand" href="#"><strong class="text-primary">이거</strong><span
				class="text-light">어때</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#board">Board</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="header d-flex justify-content-center">
		<div class="container">
			<div class="row h-100 align-items-center">
				<div class="col-md-7">
					<div class="header-content">

						<h3 class="header-title">
							<strong class="text-primary">이거</strong><span
				class="text-light">어때</span>
						</h3>
						<h4 class="header-subtitle">선택장애를 위한 커뮤니티사이트입니당</h4>
						<p>당신의 고민을 대신 해결해줄 5000만의 국민이 있습니다!!</p>
						<form action="/ex/toWrite" method="get">
							<button type="submit" class="btn btn-outline-light btn-flat">글쓰기</button>
						</form>
					</div>
				</div>
				<div class="col-md-5 d-none d-md-block">
				<c:url value="/login" var="loginUrl" />
					<form class="header-form" name="frmLogin" action="${loginUrl}" method="POST">
						<div class="head">
							여기서 <span class="text-primary">로그인</span>하세요.
						</div>
							<div class="body">
								<div class="form-group">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token }" />
									<input type="text" id="id" name="id" class="form-control"
										placeholder="Enter your id">
								</div>
								<div class="form-group">
									<input type="password" id="pw" name="pw" class="form-control"
										placeholder="Password*">
								</div>
							</div>
							<div class="footer">
								<button type="submit" class="btn btn-primary btn-block">Get
									Started</button>
								&nbsp;&nbsp; <a href="/ex/tosignUp">Not enrolled? Sign Up
									now</a>&nbsp;&nbsp; <a href="/ex/forgot">Forgot userID/PW?</a>
							</div>
							</form>
						
				</div>
			</div>
		</div>
	</header>
	<section class="section" id="board">
		<div class="container">
		<h2>게시판 board</h2>
    <h5>목록화면</h5>
	    <div>
	    	<select name="searchType">
	    		<option value="n" <c:out value="${pageMaker.searchType==null?'selected':'' }"/>>----</option>
	    		<!-- <option value="n" selected>----</option>
	    		<option value="n">----</option> -->
	    		<option value="t" <c:out value="${pageMaker.searchType eq 't'?'selected':'' }"/>>title</option>
	    		<option value="c" <c:out value="${pageMaker.searchType eq 'c'?'selected':'' }"/>>content</option>
	    		<option value="w" <c:out value="${pageMaker.searchType eq 'w'?'selected':'' }"/>>writer</option>
	    		<option value="tc" <c:out value="${pageMaker.searchType eq 'tc'?'selected':'' }"/>>title or content</option>
	    		<option value="cw" <c:out value="${pageMaker.searchType eq 'cw'?'selected':'' }"/>>c w</option>
	    		<option value="tcw" <c:out value="${pageMaker.searchType eq 'tcw'?'selected':'' }"/>>t c w</option>
	    	</select>
	    	<input type="text" name="keyword" 
	    	id="keywordInput" value="${pageMaker.keyword}">
	    	<button id="searchBtn"> 검색하기</button>
	    	<button id="newBtn"> 새글</button>    	
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
				  <td>
				         <c:if test="${dto.depth > 0}">
	                        <c:forEach begin="1" end="${dto.depth}">
	                           &nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
	                        </c:forEach>
	                        └RE:
	                    </c:if>
				
				<a  href="/ex/read${pageMaker.makeSearch()}&bno=${dto.bno} &grpno=${dto.grpno} &depth=${dto.depth} &grpord=${dto.grpord}">${dto.title }</a></td>
				<td style="width: 100px">${dto.writer }</td>
				<td style="width: 200px">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value= "${dto.regdate }"/></td>
				<td style="width: 40px">${dto.viewcnt }</td>
			</tr>
	
		</c:forEach>
	    </table>
	    <form action="/ex/toWrite" method="get">
	    <button type="submit">글쓰기</button>
	    </form>
	    <div class="pagination">
	    	<c:if test="${pageMaker.page !=1}">
	    		<a href='success${pageMaker.makeSearch(1)}'>&laquo;</a>
	    	</c:if>
	    	<c:if test="${pageMaker.prev }">
	    		<a href='success${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
	    	</c:if>
	    	
	    	<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
	    		<a href='success${pageMaker.makeSearch(idx)}' 
	    		 <c:out value="${pageMaker.page==idx?' class=active ':'' }"/> >
	    		 ${idx}</a>
	    	</c:forEach>
	    	
	    	<%--<a href='#'>1</a>
	    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
	    	<a href='#' class="active">3</a> --%>
	    	
	    	<c:if test="${pageMaker.next }">
	    		<a href='success${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
	    		
	    	</c:if>
	    	
	    	
	    	<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
	    		<a href='success${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
	    	</c:if>
	    	
	    </div>
		</div>
	</section>
	<section class="section" id="contact">
		<div class="container text-center">
			<h6 class="display-4 has-line">CONTACT US</h6>
			<p class="mb-5 pb-2">Lorem ipsum dolor sit amet, consectetur
				adipiscing elit.</p>

			<form>
				<div class="row mb-4">
					<div class="col-md-6">
						<div class="form-group pb-1">
							<input type="text" class="form-control" required
								placeholder="Name">
						</div>
						<div class="form-group pb-1">
							<input type="email" class="form-control" required
								placeholder="Email">
						</div>
						<div class="form-group ">
							<input type="text" class="form-control" placeholder="Subject">
						</div>
					</div>
					<div class="col-md-6">
						<textarea name="" id="" cols="" rows="7" class="form-control"
							required placeholder="Message"></textarea>
					</div>
				</div>
				<input type="submit" class="btn btn-primary btn-block"
					value="Send Message">
			</form>
		</div>
	</section>
	<footer class="footer py-4 bg-dark text-light">
		<div class="container text-center">
			<p class="mb-4 small">
				Copyright
				<script>document.write(new Date().getFullYear())</script>
				&copy; <a href="http://www.devcrud.com">이거어때</a>
			</p>
		</div>
	</footer>

	<!-- core  -->

	<!-- Rubic js -->
	<script src="${pageContext.request.contextPath}/resources/js/rubic.js"></script>

</body>
</html>






