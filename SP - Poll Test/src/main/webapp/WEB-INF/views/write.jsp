<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%-- <%@include file="../include/header.jsp"%> --%>
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
		str+='<input type="text" name="item" value="'+temp[i].value+'"/>'
		console.log(temp[i].value);
	}
	document.getElementById('pollitem').innerHTML= str
};
/*function test(num){
	var str = '';
	for(var i=0;i<num;i++){
		str+='<input type="text" name="pollTitle"/>'
	}
	document.getElementById('pollitem').innerHTML= str
	console.log(num)
}
*/
</script>


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
	<button type="button" onclick="openChild()">투표</button>
	    <input type="button" value="자식창 열기" onclick="openChild()">
	        <input type="button" value="전달" onclick="setChildText()">
			<div id="poll">
			<input type="text" id="pollTitle" name="pollTitle" readonly/>
			<input type="datetime-local" id="endtime" name="endtime" readonly/>
			<div id="pollitem">
			<input type="text" name="item" readonly/>
			</div> 
			</div> 
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