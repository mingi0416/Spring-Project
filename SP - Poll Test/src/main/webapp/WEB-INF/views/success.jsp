<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <link rel="stylesheet" href="resources/CSS/sp.css"> -->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Home</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<script>
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

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

<body>
<header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white"> ${id } </h4>
          
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>${id }님 반갑습니다</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>

<main>
<%-- <form action="/ex/toWrite" method="get">
	<button type="submit">글쓰기</button>
	</form> --%>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">선택 장애를 위한 사이트</h1><hr>
        <p class="lead text-muted">선택하기 힘들 때 사이트에 고민을 업로드하고 투표를 받아서 결정해보세요</p>
        <p>
        <form action="/ex/toWrite" method="get">
          <button type="submit" class="btn btn-primary my-2">글쓰기</button>
          </form>
          <!-- <a href="#" class="btn btn-secondary my-2">Secondary action</a> -->
        </p>
      </div>
    </div>
  </section>

  
   <%--  </c:if> <a
	href="/ex/read${pageMaker.makeSearch()}&bno=${dto.bno} &grpno=${dto.grpno} &depth=${dto.depth} &grpord=${dto.grpord}">${dto.title }</a></td>
	<td style="width: 100px">${dto.writer }</td>
	<td style="width: 200px"><fmt:formatDate
	pattern="yyyy-MM-dd HH:mm" value="${dto.regdate }" /></td>
	<td style="width: 40px">${dto.viewcnt }</td>
	</tr>
	</c:forEach>
	 --%>
	 
	 
</main>



	<sec:authorize access="isAuthenticated()">

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
				<%-- 	<form action="/ex/toWrite" method="get">
						<button type="submit">글쓰기</button>
					</form> --%>
					<div class="pagination">
						<c:if test="${pageMaker.page !=1}">
							<a href='success${pageMaker.makeSearch(1)}'>&laquo;</a>
						</c:if>
						<c:if test="${pageMaker.prev }">
							<a href='success${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${ pageMaker.endPage}" var="idx">
							<a href='success${pageMaker.makeSearch(idx)}'
								<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
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

	

				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<input type="submit" value="로그아웃" />
				</form:form>
	</sec:authorize>

	<button onclick="fn_delete()">회원탈퇴</button>

	<form action="/ex/toInfo_update" method="get">
		<button type="submit">회원정보수정</button>
	</form>

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
</body>
</html>
