<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
var test1 = opener.document.getElementById("pollTitle").value
document.getElementById("cpollTitle").value = test1
var test2 = opener.document.getElementById("endtime").value
document.getElementById("cendtime").value = test2
var test3 = opener.document.getElementsByName("item")
console.log(test1)
console.log(test2)
test(test3)

function test(temp){
	var str = '';
	for(var i=0; i< (temp.length-2);i++){
		add_textbox()
	}
	for(var i=0; i < temp.length; i++){
		document.getElementsByName('item')[i].value = temp[i].value
	}
	//document.getElementById('pollList').innerHTML= str
};
};

//




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
    const box = document.getElementById("pollList");
    const newP = document.createElement('tr');
    newP.innerHTML = "<td><input type='text' name='item' placeholder='보기'></td><input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
}
const remove = (obj) => {
    document.getElementById('pollList').removeChild(obj.parentNode);
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


<p>투표만들기</p>




<input type="text" id="cpollTitle" name="pollTitle" placeholder="투표 제목">
<label for="endtime">종료시간</label><input type="datetime-local" id="cendtime" name="endtime"><br>





<input type="text" name="item" placeholder="보기"><br>
<input type="text" name="item" placeholder="보기">
<div id="pollList">

</div>


<button type="button" onclick="add_textbox()">보기추가</button>

<button type="button" onclick= "setParentText()">등록</button>

</form>

    <script>
        function setParentText(){
        	opener.document.getElementById("pollTitle").value = document.getElementById("cpollTitle").value
        	opener.document.getElementById("endtime").value = document.getElementById("cendtime").value
        	
        	opener.test(document.getElementsByName("item"))
        	console.log(document.getElementsByName("item"))
        	window.close();
        }
    </script>
</body>
</html>