<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.myForm.target = "parentPage"; // 타켓을 부모창으로 설정
    document.myForm.action = "/ex/makePoll";
    document.myForm.submit();
    self.close();
}
var max=1;
function closeTabClick() {
	// 변수를 close해 새창을 닫음
	window.close();
}

function moveandclose(){
	window.opener.document.location.href="/ex/makePoll"+$('form[name="abc"]').attr('action')

	alert($('form[name="abc"]').attr('action'));
	console.log(document.myform.item)
}


const add_textbox = () => {
    const box = document.getElementById("box");
    const newP = document.createElement('tr');
    newP.innerHTML = "<td><input type='text' name='item' placeholder='보기'></td><input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
}
 
function additem() {
max= max+1;
console.log(max)
}
</script>
</head>
<body>
<!-- <form name = "myForm" method="get"> -->
<form action="/ex/writepoll" method="get">
<table>
<thead>
<tr>
<td colspan=2>투표만들기</td>
</tr>

<tr>
<tbody id="pollList">
<td><input type="text" id="cpollTitle" name="pollTitle" placeholder="투표 제목"></td>
<td><label for="endtime">종료시간</label><input type="datetime-local" id="cendtime" name="endtime"></td>
</tr>
</thead>


<tr>
<td>
<input type="text" name="item" placeholder="보기">
</td>
</tr>
<tr>
<td>
<input type="text" name="item" placeholder="보기">
</td>
</tr>



</tbody>
<tfoot>
<tr>
<td>
<button type="button" onclick="add_textbox()">보기추가</button></td>
<td><button type="submit">등록123</button></td>
<td><button type="button" onclick= "setParentText()">등록</button></td>
<td><button type="button" onclick="closeTabClick()">닫기</button></td>
</tr>
</tfoot>
</table>
</form>

 <script>
        function setParentText(){
        	opener.document.getElementById("pollTitle").value = document.getElementById("cpollTitle").value
        	opener.document.getElementById("endtime").value = document.getElementById("cendtime").value
      		console.log('누름');
        }
 </script>
</body>
</html>