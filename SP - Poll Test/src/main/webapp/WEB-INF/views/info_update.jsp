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

</head>
<body>

	<h1>This is Update Page.</h1>
	<form action="/ex/info_update" method="get">
		<label for="id">ID</label> 
		<input type="text" name="id" id="id" oninput = "check_id()" value=${id } readonly><br>
		<label for="pw">PW</label> 
		<input type="password" name="pw" value=${pw }><br>
		<label for="check_pw">Check PW</label> 
		<input type="password" name="check_pw" placeholder="checking password"><br>
		<label for="name">Name</label>
		<input type="text" name="name" value=${name }><br> 
		<label for="birth">birth</label> 
		<input type="datetime-local" name="birth" value=${birth }><br>
		<label for="address">address</label> 
      	<input type="text" id="addr1" name="postcode" value=${postcode }><br> 
      	<input type="button" onclick="daumPost()" value="우편주소찾기"><br>
      	<input type="text" id="addr2" name="address1" value="${address1 }"><br>
      	<input type="text" id="addr3" name="address2" value=${address2 }><br>
		<label for="phone">Phone Number</label> 
		<input type="text" name="phone" value=${phone }><br>
		<button type="submit">info_update</button>
	</form>



</body>
</html>
