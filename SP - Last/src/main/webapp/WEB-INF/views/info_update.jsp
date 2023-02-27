<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with Rubic landing page.">
<meta name="author" content="Devcrud">
<title>이거어때 회원정보수정 페이지</title>
<!-- Bootstrap + Steller  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rubic.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/daumpost.js"></script>
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

	<!-- Page Header -->
	<header class="header header-mini">
		<div class="header-title">이거어때</div>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/ex/">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Components</li>
			</ol>
		</nav>
	</header>
	<!-- End Of Page Header -->

	<!-- main content -->
	<div class="container">
		<br>
		<h3>회원정보수정</h3>
		<hr>
		<form action="/ex/signUp" method="get">
			<div class="row mt-5">
				<div class="col-md-6">

					<h6 class="section-secondary-title">ID</h6>
					<div class="form-group">
						<input type="text" class="form-control" name="id" id="id"
							oninput="check_id()" placeholder="abc123@sp.com" value=${id } readonly>
					</div>
					<h6 class="section-secondary-title">PW</h6>
					<div class="form-group">
						<input class="form-control" type="password" name="pw"
							placeholder="abc123" value=${pw } required>
					</div>
					<h6 class="section-secondary-title">Check PW</h6>
					<div class="form-group">
						<input class="form-control" type="password" name="check_pw"
							placeholder="checking password">
					</div>
					<h6 class="section-secondary-title">Name</h6>
					<div class="form-group">
						<input class="form-control" type="text" name="name"
							placeholder="김남길" value=${name } required>
					</div>
					<h6 class="section-secondary-title">Birthday</h6>
					<div class="form-group">
						<input class="form-control" type="datetime-local" name="birth"
							value=${birth } required>
					</div>
					<h6 class="section-secondary-title">Address</h6>
					<div class="form-group">
						<input class="form-control" type="text" id="addr1" name="postcode"
							placeholder="우편번호" value=${postcode } required> <input type="button"
							onclick="daumPost()" value="우편주소찾기" class="btn btn-secondary">
					</div>
					<div class="form-group">
						<input class="form-control" type="text" id="addr2" name="address1"
							placeholder="주소" value="${address1 }" required>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" id="addr3" name="address2"
							placeholder="상세주소" value="${address2 }" required>
					</div>
					<h6 class="section-secondary-title">Phone Number</h6>
					<div class="form-group">
						<input class="form-control" type="text" name="phone"
							placeholder="010-1234-5678" value="${phone }" required>
					</div>
				</div>
				<div class="col-md-6"></div>


			</div>
			
			<button type="submit" class="btn btn-secondary" style="float:left">회원정보수정</button>
			</form>
		<form action="/ex/list" method="get">
			<button type="submit" class="btn btn-secondary">Main</button>
			
		</form>
	</div>
	<!-- end of inputs -->

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


	<!-- steller js -->
	<script src="${pageContext.request.contextPath}/resources/js/rubic.js"></script>

</body>
</html>

