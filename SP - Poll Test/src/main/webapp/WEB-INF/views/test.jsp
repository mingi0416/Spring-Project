<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Home</title>
</head>
<script>
  var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
  $(document).ready(function(){
	  $('#searchBtn').on("click",function(event){
		  alert("list"+'${pageMaker.makePage(1)}'
				  +'&searchType='+$("select option:selected").val()
				  +"&keyword="+$('#keywordInput').val());
		  
		  self.location="list"+'${pageMaker.makePage(1)}'
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
<body>
<h1>
	This will be our MainPage.
	Anyway Sign In succeed.
${pageContext.request.contextPath}
</h1>
<h2>${id }님 반갑습니다.</h2>
	<sec:authorize access="isAnonymous()">
		<p>
			<%
			response.sendRedirect("signIn");
			%>
		</p>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	
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
	
	
	
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
	</sec:authorize>

	<button onclick="fn_delete()">회원탈퇴</button>
	
	<form action="/ex/toInfo_update" method="get">
	<button type="submit">회원정보수정</button>
	</form>
</body>
</html>
