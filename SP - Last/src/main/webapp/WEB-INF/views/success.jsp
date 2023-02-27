<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>여기어때 MainPage</title>
<!-- font icons -->

<!-- Bootstrap + Rubic main styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script>
var result = '${msg}';

if (result == 'success') {
	alert("처리가 완료되었습니다.");
}
$(document).ready(function(){
  $('#searchBtn').on("click",function(event){
	  alert("success"+'${pageMaker.makePage(1)}'
			  +'&searchType='+$("select option:selected").val()
			  +"&keyword="+$('#keywordInput').val());
	  
	  self.location="success"+'${pageMaker.makePage(1)}'
	  +'&searchType='+$("select option:selected").val()
	  +"&keyword="+$('#keywordInput').val();
	  
  })
  
  $('.writeBtn').on("click",function(event){
	  location.href="/ex/sboard/write";
  });
	$('#newBtn').on("click",function(event){
	  self.location="write";
  });
  
});
	
  function fn_delete(){
  var result = confirm("정말 탈퇴하시겠습니까?")
  if(result){
	  window.location.href= "/ex/info_delete";
  }

}

    </script>
</head>

	<sec:authorize access="isAnonymous()">
		<p>
			<%
			response.sendRedirect("signIn");
			%>
		</p>
	</sec:authorize>

<sec:authorize access="isAuthenticated()">
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
						<h4 class="header-subtitle">선택장애를 위한 커뮤니티사이트입니다</h4>
						<p>당신의 고민을 대신 해결해줄 5000만의 국민이 있습니다!!</p>
						<form action="/ex/toWrite" method="get">
							<button type="submit" class="btn btn-outline-light btn-flat">글쓰기</button>
						</form>
					</div>
				</div>
				<div class="col-md-5 d-none d-md-block">
									
						
					
				<form:form class="header-form" action="${pageContext.request.contextPath}/logout" method="POST">
								<div class="head">
							${id }님 <span class="text-primary">로그인성공</span>했어요.
						</div>
		<div class="body">

							</div>
							<div class="footer">
						
			<button type="submit" class="btn btn-primary btn-block">
			로그아웃</button>
							</div>
							</form:form>
									
							<form class="header-form" action="/ex/toInfo_update" method="get">
	<button type="submit" class="btn btn-secondary">회원정보수정</button>
		<button type="button" onclick="fn_delete()" class="btn btn-secondary">회원탈퇴</button>
		<c:if test='${authority eq "ADMIN" }'>
		<button type="button" class="btn btn-secondary" onclick="location.href='/ex/toReported'">신고관리</button>
		</c:if>
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
	    	</select>
	    	<input type="text" name="keyword" 
	    	id="keywordInput" value="${pageMaker.keyword}">
	    	<button id="searchBtn"> 검색하기</button> 	
	    </div>
	      <table class='customers' width=100% border="1">
		<tr>
			<th style="width: 10px">BNO</th>
			<th>TITLE</th>
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
				
				<a  href="/ex/read${pageMaker.makeSearch()}&bno=${dto.bno} &grpno=${dto.grpno} &depth=${dto.depth} &grpord=${dto.grpord}"><strong><big>${dto.title }</big></strong></a></td>
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
	    <div class="pagination" style="left:45%; position:relative">
	    	<c:if test="${pageMaker.page !=1}">
	    		<a class="page-link" href='success${pageMaker.makeSearch(1)}'>&laquo;</a>
	    	</c:if>
	    	<c:if test="${pageMaker.prev }">
	    		<a class="page-link" href='success${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
	    	</c:if>
	    	
	    	<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
	    		<a class="page-link" href='success${pageMaker.makeSearch(idx)}' 
	    		 <c:out value="${pageMaker.page==idx?' class=active ':'' }"/> >
	    		 ${idx}</a>
	    	</c:forEach>
	    	
	    	<%--<a href='#'>1</a>
	    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
	    	<a href='#' class="active">3</a> --%>
	    	
	    	<c:if test="${pageMaker.next }">
	    		<a class="page-link" href='success${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
	    		
	    	</c:if>
	    	
	    	
	    	<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
	    		<a class="page-link" href='success${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
	    	</c:if>
	    	
	    </div>
		</div>
	</section>
	<section class="section" id="contact">
		<div class="container text-center">
			<h6 class="display-4 has-line">CONTACT US</h6>
			<p class="mb-5 pb-2">문제가 될 만한 글을 신고해주세요 관리자가 확인 후 삭제 조치하겠습니다.</p>

			<form action="/ex/report" method="get">
				<div class="row mb-4">
					<div class="col-md-6">
						<div class="form-group pb-1">
							<input type="text" class="form-control" required
								placeholder="ID" name="reporter" value="${id }" readonly>
						</div>
						<div class="form-group pb-1">
						
							<input type="number" placeholder="게시글번호" name="bno" value="${param.bno }" class="form-control" required
								 readonly>
						</div>
						<div class="form-group ">
							<input type="number" class="form-control" name="rno" placeholder="댓글번호" value="${param.rno }" readonly>
						</div>
					</div>
					<div class="col-md-6">
						<textarea name="reason" rows="7" class="form-control"
							required placeholder="Message" required></textarea>
					</div>
				</div>
			
				<button type="submit" class="btn btn-primary btn-block"> 신고접수하기
				</button>
			
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
	</sec:authorize>
</html>



















