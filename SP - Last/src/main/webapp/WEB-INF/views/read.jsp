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
<title>이거어때 읽기 페이지</title>
<!-- Bootstrap + Steller  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">
<script>
 let openWin;

 function openChild() {
     // window.name = "부모창 이름"; 
     window.name = "parentForm";
     
     // window.open("open할 window", "자식창 이름", "팝업창 옵션");
     openWin = window.open("/ex/toMakePoll", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
 	// openWin.focus();opener.document.getElementById("pollTitle").value = document.getElementById("cpollTitle").value
 
 }


function test(temp){
	var str = '';
	for(var i=0; i < temp.length; i++){
		str+='<input type="text" name="item" value="'+temp[i].value+'"readonly/>'
		console.log(temp[i].value);
	}
	document.getElementById('pollitem').innerHTML= str
};

function addFilePath(msg) {
	alert(msg); 
	
	document.getElementById("form1").reset();
	
}

function deleteimg(num) {

	  const div = document.getElementById(num);
	   success:div.remove();
	  const box = document.getElementById("deleteList");
	    const newP = document.createElement('p');
	    newP.innerHTML = "<input type='hidden' name='deleteattno' value='"+num+"'/>";
	    box.appendChild(newP);
}

function fn_toReply_re(num){ 	
	console.log(num);
    var con = document.getElementById("testdiv"+num); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'table-row'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    } 
} 

function fn_update_re(num){ 	
	console.log(num);
	document.getElementById("before_update"+num).style.display="none";
	document.getElementById("after_update"+num).style.display="block";
	document.getElementById("savebutton"+num).style.display="block";
	document.getElementById("cancelbutton"+num).style.display="block";
} 
function fn_return(num){ 	
	console.log(num);
	document.getElementById("before_update"+num).style.display="block";
	document.getElementById("after_update"+num).style.display="none";
	document.getElementById("savebutton"+num).style.display="none";
	document.getElementById("cancelbutton"+num).style.display="none";
} 

</script>
</head>
<body>
<%-- 	<sec:authorize access="isAnonymous()">
		<p>
			<%
			response.sendRedirect("signIn");
			%>
		</p>
	</sec:authorize> --%>

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
		<h3>글읽기</h3>
		<hr>

		<div class="row mt-5">
			<div class="col-md-6">

				<h6 class="section-secondary-title">Title</h6>
				<div class="form-group">
					<input type="text" class="form-control" name='title'
						style="width: 100%" value="${boardDTO.title}" required>
				</div>
				<h6 class="section-secondary-title">Writer</h6>
				<div class="form-group">
					<input type="text" name="writer" class="form-control"
						style="width: 100%" value="${writer }" readonly>
				</div>
				<c:if test='${not empty pollList }'>
					<h6 class="section-secondary-title">Poll</h6>
					<div class="form-group" id="poll">
						<form action="/ex/vote" method="get">
							<input type="text" id="pollTitle" name="pollTitle"
								value="${pollTitle }" readonly /> <input type="datetime-local"
								id="endtime" name="endtime" value="${endtime }" readonly />
							<div class="form-group" id="pollitem">
								<c:forEach var="pollList" items="${pollList }">
									<input type="hidden" name="pno" value="${pollList.pno }">
									<label><input type="radio" name="item"
										value="${pollList.item }">&nbsp;${pollList.item }</label>
								&nbsp;<input type="text" name="vote_cnt"
										value="${pollList.vote_cnt }" readonly>
									<input type='hidden' name='bno' value="${boardDTO.bno}">

									<br>
								</c:forEach>
								<button type="submit" class="btn btn-secondary">vote</button>
							</div>
						</form>
					</div>
				</c:if>
				<h6 class="section-secondary-title">Content</h6>
				<div class="form-group">
					<textarea class="form-control" name="content"
						id="exampleFormControlTextarea1" rows="10"
						placeholder="Example textarea" required>${boardDTO.content}</textarea>
				</div>
			</div>
			<div class="col-md-6">
			<c:if test='${not empty imageList }'>
				<h6 class="section-secondary-title">Images</h6>
				<div class="form-group" style="overflow-y: scroll; height:700px;">
					<c:forEach var="imageList" items="${imageList }">
						<img src='/ex/displayFile?fileName=/${imageList.filename }'
							style="width: 500px; height: 350px;" />
						<br><br>
					</c:forEach>
				</div>
			</c:if>
			</div>
		</div>

		<div>
		<form action="/ex/toModify" method="get">
			<c:if test='${boardDTO.writer eq writer }'>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<input type='hidden' name='bno' value="${boardDTO.bno}">
				<input type='hidden' name='page' value="${pageMaker.page}">
				<input type='hidden' name='perPageNum'
					value="${pageMaker.perPageNum}">
				<input type='hidden' name='searchType'
					value="${pageMaker.searchType}">
				<input type='hidden' name='keyword' value="${pageMaker.keyword}">
				<input type="hidden" class="form-control" name='title'
					placeholder="제목을 입력해 주세요" style="width: 100%"
					value="${boardDTO.title}" required>
				<input type="hidden" name="writer" class="form-control"
					value="${writer }" readonly>
				<input type="hidden" id="pollTitle" name="pollTitle"
					value="${pollTitle }" readonly />
				<input type="hidden" id="endtime" name="endtime" value="${endtime }"
					readonly />
				<c:forEach var="pollList" items="${pollList }">
					<input type="hidden" name="pno" value="${pollList.pno }">
					<input type="hidden" name="item" value="${pollList.item }">
								<input type="hidden" name="vote_cnt"
						value="${pollList.vote_cnt }" readonly>
				</c:forEach>
				<input type="hidden" class="form-control" name='content'
					value="${boardDTO.content}" required>
				<button type="submit" class="btn btn-secondary" style="float:left">ToModify</button>

			</c:if>
		</form>
				<form action="/ex/remove" method="get">
			<c:if test='${boardDTO.writer eq writer || authority eq "ADMIN" }'>

				<input type='hidden' name='bno' value="${boardDTO.bno}">
				<button type="submit" class="btn btn-secondary" style="float:left">REMOVE</button>

			</c:if>
		</form>

		<form action="/ex/toRewrite" method="get">
			<input type='hidden' name='grpno' value="${boardDTO.grpno}">
			<input type='hidden' name='depth' value="${boardDTO.depth}">
			<input type="hidden" name='grpord' value="${boardDTO.grpord }">
			<button type="submit" class="btn btn-secondary" style="float:left">답글</button>
		</form>
<form action="/ex/toBnoReport" method="get">
<input type='hidden' name='bno' value="${boardDTO.bno}">
			<button type="submit" class="btn btn-secondary" style="float:left">신고하기</button>
		</form>


		<form action="/ex/list" method="get">
			<button type="submit" class="btn btn-secondary" >LIST ALL</button>
		</form>
</div>


	</div>
	<!-- end of inputs -->
	<div class="container">
		<br>
		<h3>댓글목록</h3>
		<hr>
		<div class="row mt-5">
			<table width=100% border=1>
				<thead colspan="4">
				</thead>
				<tbody>
					<tr>
					<td style="width: 5px">rno</td>
						<form action="/ex/insert_reply">
							<td style="width: 5px">writer : <input style="border:none" type="text" name="replyer" value="${writer }"
								readonly></td>
							<td colspan="2"><input style="width: 100%" type="text" name="replytext"
								placeholder="댓글내용" required style=" border: 1;"></td>
							<td style="width: 100px"><input type='hidden' name='bno' value="${boardDTO.bno}">
								<button type="submit">댓글등록</button>
						</form>
						</td>
					</tr>


					<c:forEach var="replyList" items="${replyList }">
						<tr>
							<form action="/ex/update_reply" method="get">
							<td><input style="border:none" type='text' name='rno' id='${replyList.rno }'
											value="${replyList.rno}" readonly></td>
								<td><input type="text" style="border:none" name="replyer"
									value="${replyList.replyer }" readonly></td>
								<c:choose>
									<c:when test='${replyList.replyer eq writer }'>
										<td style="width: 300px"> <input type='hidden'
											name='bno' value="${boardDTO.bno}"> <textarea
												id="after_update${replyList.rno }" name="replytext"
												style="display: none; width: 100%">${replyList.replytext }</textarea>
											<button id="savebutton${replyList.rno }" type="submit"
												style="display: none">저장</button>
							</form>
							<button onclick="fn_return(${replyList.rno })"
								id="cancelbutton${replyList.rno }" type="button"
								style="display: none">취소</button>
							<p id="before_update${replyList.rno }">
								<c:if test="${replyList.depth > 0}">
									<c:forEach begin="1" end="${replyList.depth}">
                           &nbsp; 
                        </c:forEach>
                        └RE:
                    </c:if>
								${replyList.replytext }
							</p>

							</td>
							</c:when>
							<c:otherwise>
								<td style="width: 350px">
									<p>${replyList.replytext }</p>
								</td>
							</c:otherwise>
							</c:choose>

							<td style="width: 100px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${replyList.regdate }" /></td>
							<td><c:if test='${replyList.replyer eq writer }'>
							
									<button type="button" onclick="fn_update_re(${replyList.rno })">수정</button>
								</c:if>
								</form>

								<button type="button" onclick="fn_toReply_re(${replyList.rno })"
									id="testbtn">답글</button>

								<form action="/ex/delete_reply" method="get">
									<c:if
										test='${replyList.replyer eq writer || authority eq "ADMIN" }'>
										<input type='hidden' name='rno' value="${replyList.rno}">
										<input type='hidden' name='bno' value="${boardDTO.bno}">
										<button type="submit">삭제</button>
									</c:if>
								</form>
								<form action="/ex/toRnoReport" method="get">
<input type='hidden' name='bno' value="${boardDTO.bno}">
<input type='hidden' name='rno' value="${replyList.rno}">
			<button type="submit">신고</button>
		</form>
								</td>
						</tr>


						<tr id="testdiv${replyList.rno }" style="display: none">
							<form action="/ex/insert_reply_re">
								<input type="hidden" name='grpno' value="${replyList.grpno }">
								<input type="hidden" name='depth' value="${replyList.depth }">
								<input type="hidden" name='grpord' value="${replyList.grpord }">
								<td><input type="text" name="replyer" value="${writer }"
									readonly></td>

								<td colspan='2'>
								<input type="text" name="replytext" placeholder="댓글내용" required style="width:100%; border: 1;">
								</td>

								<td><input type='hidden' name='bno' value="${boardDTO.bno}">
									<button type="submit">댓글등록</button>
									</td>
							</form>
							

						</tr>



					</c:forEach>
				</tbody>
				<tfoot>

				</tfoot>
			</table>
		</div>
		</form>
	</div>

	<!-- devider -->
	<div class="py-5"></div>


	<!-- Page Footer -->
	<footer class="footer py-4 bg-light">
		<div class="container text-center">
			<p class="mb-4 small">
				Copyright
				<script>document.write(new Date().getFullYear())</script>
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






