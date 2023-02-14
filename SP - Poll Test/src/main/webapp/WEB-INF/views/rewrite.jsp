<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%-- <%@include file="../include/header.jsp"%> --%>
  <div class="main">
 				<div class="box-header">
					<h1 class="box-title">답글쓰기</h3>
				</div>
				<!-- /.box-header -->
<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->

<form role="form" action="/ex/rewrite" method="get">
		<input type="hidden" name='grpno' value="${grpno }">
		<input type="hidden" name='depth' value="${depth }">
		<input type="hidden" name='grpord' value="${grpord }">
		<h3> 제목  <input type="text"
				name='title' placeholder="제목을 입력해 주세요" style="width:100%"></h3> 
		<h2> 내용 
			<textarea name="content" rows="8" style="width:100%"
				placeholder="내용을 50자 이상 입력해 주세요."></textarea></h2>
		<h2> 작성자 
			<input type="text"
				name="writer"  placeholder="작성자"  style="width:100%" value="${writer }" readonly></h2> 
	<!-- /.box-body -->
		<button type="submit" class="btn">답글등록</button>
</form>

				<form action="/ex/list" method="get">
				<button type="submit">LIST ALL</button>
				</form>
</div>

<%-- <%@include file="/include/footer.jsp"%> --%>