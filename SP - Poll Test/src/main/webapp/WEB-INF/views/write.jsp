<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%-- <%@include file="../include/header.jsp"%> --%>
<!-- <script>
function fn_makePoll() {
	window.open("poll.jsp", "pop", 'width=000, height=000, fullscreen=no scrollbars=no, status=yes');
	}
</script> -->


  <div class="main">
 				<div class="box-header">
					<h1 class="box-title">새글쓰기</h3>
				</div>
				<!-- /.box-header -->
<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
<form role="form" action="/ex/write" method="post"
	enctype="multipart/form-data" target="zeroFrame">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<h3> 제목  <input type="text"
				name='title' placeholder="제목을 입력해 주세요" style="width:100%" required></h3> 
				<input type='file' multiple="multiple" name='file'>
		<h2> 내용 
	<!-- 	<button type="button" onclick="fn_makePoll()">투표</button>
			<div id="poll"></div> -->
			<textarea name="content" rows="8" style="width:100%"
				placeholder="내용을 50자 이상 입력해 주세요." required></textarea></h2>
				
	
		<h2> 작성자 
			<input type="text"
				name="writer"  placeholder="작성자"  style="width:100%" value="${writer }" readonly></h2> 
		<button type="submit" class="btn">새글등록</button>
</form>


	
	
		<script>
		function addFilePath(msg) {
			alert(msg); 
			
			document.getElementById("form1").reset();
			
		}
	</script>
	
				<form action="/ex/list" method="get">
				<button type="submit">LIST ALL</button>
				</form>
</div>