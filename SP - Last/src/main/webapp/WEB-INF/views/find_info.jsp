<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Start your development with Rubic landing page.">
   <meta name="author" content="Devcrud">
   <title>이거어때 회원정보찾기 페이지</title>
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
</script>
</head>
<body>

   <!-- Page Header -->
   <header class="header header-mini"> 
      <div class="header-title">이거어때</div> 
      <nav aria-label="breadcrumb">
         <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Components</li>
         </ol>
      </nav>
   </header> <!-- End Of Page Header -->

   <!-- main content -->
   <div class="container">
      <br>
      <h3>회원정보찾기</h3>
      <hr>
      <div class="row mt-5">
         <div class="col-md-6">
   
            <form action="/ex/find_id" method="get">
	
		<h4>Forgot ID?</h4>   
		 <h6 class="section-secondary-title">Name</h6>    
            <div class="form-group">
            <input type="text" class="form-control"
				name='name' placeholder="김남길" style="width:100%" required>            
            </div>
             <h6 class="section-secondary-title">PhoneNumber</h6>    
            <div class="form-group">
            <input type="text" class="form-control"
				name='phone' placeholder="010-1234-5678" style="width:100%" required>            
            </div>
            <div class="form-group">
            	<button type="submit" class="btn btn-secondary">Find_id</button>
            	<span id="id_value"> ${id}</span>
            </div> 
            </form>
         </div>
         
         <div class="col-md-6">
         	<form action="/ex/find_pw" method="get">
         <h4>Forgot PW?</h4>
            <h6 class="section-secondary-title">ID</h6>    
            <div class="form-group">
            <input class="form-control" type="text" name="id" id="id" placeholder="abc123" required>        
            </div>
          	<h6 class="section-secondary-title">Name</h6>    
            <div class="form-group">
            <input class="form-control" type="text" name="name" id="name" placeholder="김남길" required>        
            </div>
            	<h6 class="section-secondary-title">PhoneNumber</h6>    
            <div class="form-group">
           <input type="text" class="form-control"
				name='phone' placeholder="010-1234-5678" style="width:100%" required>                   
            </div>
            
            <div class="form-group">
            <button type="submit" class="btn btn-secondary">Find_pw</button>
           <span id="pw_value"> ${pw}</span>
            </div>
         </form>
         </div>
         </div>
         
 
		<form action="/ex/signIn" method="get">
				<button type="submit"  class="btn btn-secondary">Main</button>
				</form>
      </div> <!-- end of inputs -->
     
      <!-- devider -->
      <div class="py-5"></div>             


   <!-- Page Footer -->
    <footer class="footer py-4 bg-light"> 
        <div class="container text-center">
            <p class="mb-4 small">Copyright <script>document.write(new Date().getFullYear())</script> &copy; <a href="http://www.devcrud.com">여기어때</a></p>
   
        </div>
    </footer>
    <!-- End of page footer -->
   
   <!-- core  -->
   <script src="assets/vendors/jquery/jquery-3.4.1.js"></script>
   <script src="assets/vendors/bootstrap/bootstrap.bundle.js"></script>

    <!-- steller js -->
	<script src="${pageContext.request.contextPath}/resources/js/rubic.js"></script>

</body>
</html>




