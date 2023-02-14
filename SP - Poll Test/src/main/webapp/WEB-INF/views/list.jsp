  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@include file="include/header.jsp"%>
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
  	
  </script>
  <div class="main">
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
			<td><a href="/ex/sboard/read${pageMaker.makeSearch()}&bno=${dto.bno}">${dto.title }</a></td>
			<td style="width: 100px">${dto.writer }</td>
			<td style="width: 200px">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value= "${dto.regdate }"/></td>
			<td style="width: 40px">${dto.viewcnt }</td>
		</tr>
	</c:forEach>
    </table>
    <button class='writeBtn'>글쓰기</button>
    <div class="pagination">
    	<c:if test="${pageMaker.page !=1}">
    		<a href='list${pageMaker.makeSearch(1)}'>&laquo;</a>
    	</c:if>
    	<c:if test="${pageMaker.prev }">
    		<a href='list${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
    	</c:if>
    	
    	<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
    		<a href='list${pageMaker.makeSearch(idx)}' 
    		 <c:out value="${pageMaker.page==idx?' class=active ':'' }"/> >
    		 ${idx}</a>
    	</c:forEach>
    	
    	<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>
    	
    	<c:if test="${pageMaker.next }">
    		<a href='list${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
    		
    	</c:if>
    	
    	
    	<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
    		<a href='list${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
    	</c:if>
    	
    </div>
  </div>
  <%@include file="include/footer.jsp"%>
  
  
  
  
  
  
  
  
  
  
  
  
