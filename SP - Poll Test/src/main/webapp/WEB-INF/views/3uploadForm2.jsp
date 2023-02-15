<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
iframe {
	width: 0px;
	height: 0px;
	border: 0px
}
</style>
</head>
<body>
	단일파트
	 <form id='form1' action="3uploadForm2" method="post"
		enctype="multipart/form-data">
		<input type='file' name='file1'>
		<input type='file' name='file2'> <input type='submit'>
	</form>
	<BR>
	멀티파트
	<BR>
	 <form id='form2' action="3uploadForm3" method="post"
		enctype="multipart/form-data" >
		<input multiple="multiple" type='file' name='file'> <input type='submit'>
	</form>
	<br><br>
  ajax
  <button onClick="fileSubmit()"> 단일 파일 </button>
  <button onClick="fileSubmit2()"> 다중 파일 </button>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script>
  function fileSubmit(){
	  var form=$("#form1")[0];
	  console.log(form);
	  var formData=new FormData(form);
		
		$.ajax({
			  url: '/ex/3uploadForm2',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  alert("파일 업로드 성공");
			  },
			  error:function(error){
				  alert("파일 업로드 실패");
			  }}
		)
  }
  function fileSubmit2(){
	  var form=$("#form2")[0];
	  console.log(form);
	  var formData=new FormData(form);
		
		$.ajax({
			  url: '/ex/3uploadForm3',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  alert("파일 업로드 성공");
			  },
			  error:function(error){
				  alert("파일 업로드 실패");
			  }}
		)
  }
  </script>
</body>
</html>

