<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
<title>Home</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/daumpost.js"></script>
<script type="text/javascript">
function reg() {
   var addr1 = $("#addr1").val()
   var addr2 = $("#addr2").val()
   var addr3 = $("#addr3").val()
   var address = addr1 +"/"+addr2+"/"+addr3
   $("addr1").val(address)
   fo.submit()
}

</script>
<script>
 function daumPost() {
      new daum.Postcode({
         oncomplete: function(data) {
            //도로명일 경우 R, 지번일 경우 J 의 값을 가지고 있다.
            console.log('data.userSelectedType : ' + data.userSelectedType)
            console.log('data.roadAddress : ' + data.roadAddress)
            console.log('data.jibunAddress : ' + data.jibunAddress)
            console.log('data.zonecode : ' + data.zonecode)
            var addr = ""
            if (data.userSelectedType == 'R') {//도로명일 경우 R
               addr = data.roadAddress
            } else {//지번일 경우 J
               addr = data.jibunAddress
            }
            document.getElementById("addr1").value = data.zonecode
            $("#addr2").val(addr)
            $("#addr3").focus()

         }
      }).open()

   }
 </script>
 <script>
function check_id(){
    var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'./check_id', //Controller에서 요청 받을 주소
        type:'get', //POST 방식으로 전달
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
            }
        }
    });
    };
    </script>
</head>
<body>

	<h1>This is SignUp Page.</h1>
	<form action="/ex/signUp" method="get">
		<label for="id">ID</label> 
		<input type="text" name="id" id="id" oninput = "check_id()" placeholder="abc123@sp.com">
		<span class="id_ok">사용 가능한 아이디입니다.</span>
      	<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span> <br> 
		<label for="pw">PW</label> 
		<input type="password" name="pw" placeholder="abc123"><br>
		<label for="check_pw">Check PW</label> 
		<input type="password" name="check_pw" placeholder="checking password"><br>
		<label for="name">Name</label>
		<input type="text" name="name" placeholder="김남길"><br> 
		<label for="birth">birth</label> 
		<input type="datetime-local" name="birth"><br>
		<label for="address">address</label> 
      	<input type="text" id="addr1" name="postcode" placeholder="우편번호"><br> 
      	<input type="button" onclick="daumPost()" value="우편주소찾기"><br>
      	<input type="text" id="addr2" name="address1" placeholder = "주소"><br>
      	<input type="text" id="addr3" name="address2" placeholder = "상세주소"><br>
		<label for="phone">Phone Number</label> 
		<input type="text" name="phone" placeholder="010-1234-5678"><br>
		<button type="submit">Sign Up</button>
	</form>



</body>
</html>
