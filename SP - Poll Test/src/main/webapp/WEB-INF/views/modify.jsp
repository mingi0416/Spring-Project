<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<script>
	var bno="${boardDTO.bno}";
	var page=1;
	$(document).ready(function() {
		//리플작업시작
		//read페이지는 특정글을 읽을때 들어와서 bno정보를 가지고 있다.
		//처음 read페이지에 들어 왔을때 page는 1이 된다.
		//bno page
	
		getPageList(page);
		$("#replyModBtn").on("click",function(){
			  var rno = $(".modal-title").html();
			  var replytext = $("#replytext").val();
			  $.ajax({
					type:'put',
					url:'/ex/replies/'+rno,
					headers: { 
					      "Content-Type": "application/json"},
					data:JSON.stringify({replytext:replytext}), 
					dataType:'text', 
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("수정 되었습니다.");
							 $("#modDiv").hide("slow");
							//getAllList();
							 getPageList(page);
						}
				}});
		});
		$("#closeBtn").on("click", function() {
			$("#modDiv").hide("slow");
		});
		
		$("#replyDelBtn").on("click", function() {
			var rno = $(".modal-title").html();
			//var replytext = $("#replytext").val();
			$.ajax({
				type : 'delete',
				url : '/ex/replies/' + rno,
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						//getAllList();
						getPageList(page);
					}
				}
			});
		});
		
		$("#replies").on("click",".replyLi button",function(){
			var reply=$(this).parent();
			var rno=reply.attr("data-rno");
			var replytext=reply.text();
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
		})
		
		$(".pagination").on("click","a",function(event){
			event.preventDefault();
			page=$(this).attr("href");
			getPageList(page);
		})
		$("#replyAddBtn").on("click", function() {
			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();
			$.ajax({
				type : 'post',
				url : '/ex/replies',
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						//getAllList();
						getPageList(page);
					}
				}
			});
		});

		//리플작업종료
		var fObject = $(".form");

		$(".btnList").on("click", function() {

			fObject.attr("method", "get");
			fObject.attr("action", "/ex/sboard/list");
			fObject.submit();

		})
		$(".btnRemove").on("click", function() {
			fObject.attr("action", "/ex/sboard/remove");
			fObject.submit();
		})
		$(".btnModify").on("click", function() {
			fObject.attr("method", "get");
			fObject.attr("action", "/ex/sboard/modify");
			fObject.submit();
		})
		
		 uploadListAll();
		
	});
	/* private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;

	private Date regdate;
	private Date updatedate; */
	function getPageList(page){
		$.getJSON("/ex/replies/"+bno+"/"+page,function(data){
			console.log(data.list.length);
			var str="";
			$(data.list).each(function(){
				str+="<li data-rno='"+this.rno+"' class='replyLi'>"
				+this.rno+":"+this.replytext+" <button>Mod</button></li>"
			})
			$("#replies").html(str);
			printPaging(data.pageMaker)
		})
	}
function printPaging(pageMaker){
	
	var str = "";
	
	if(pageMaker.prev){
		str += "<a href='"+(pageMaker.startPage-1)+"'> << </a>";
	}
	
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){				
			var strClass= pageMaker.page == i?'class=active':'';
		  str += "<a  "+strClass+" href='"+i+"'>"+i+"</a>";
	}
	
	if(pageMaker.next){
		str += "<a href='"+(pageMaker.endPage + 1)+"'> >> </a>";
	}
	$('.pagination').html(str);	
	
}


let openWin;

function openChild() {
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/ex/toMakePoll", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
	// openWin.focus();
}

function fn_makePoll() {
	window.name = "parentForm";
	openWin = window.open("/ex/toMakePoll", "childForm", 'width=600, height=400, fullscreen=no scrollbars=no, status=yes');
	//window.open("/ex/toMakePoll", "_blank", 'width=600, height=400, fullscreen=no scrollbars=no, status=yes');
	}
	
function setChildText(){
   openWin.document.getElementById("cPolltitle").value = document.getElementById("pPolltitle").value;
   openWin.document.getElementById("cItem").value = document.getElementById("pItem").value;
   openWin.document.getElementById("cEndtime").value = document.getElementById("pEndtime").value;
}

function test(temp){
	var str = '';
	for(var i=0; i < temp.length; i++){
		str+='<input type="text" name="item" value="'+temp[i].value+'"/>'
		console.log(temp[i].value);
	}
	document.getElementById('pollitem').innerHTML= str
};


function deleteimg(num) {

	  const div = document.getElementById(num);
	   success:div.remove();
	  const box = document.getElementById("deleteList");
	    const newP = document.createElement('p');
	    newP.innerHTML = "<input type='hidden' name='deleteattno' value='"+num+"'/>";
	    box.appendChild(newP);
}

</script>
<style>
div{
float:left;
}
</style>
	<form action="/ex/modify" method="post" enctype="multipart/form-data" target="zeroFrame">

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<input type='hidden' name='bno' value="${boardDTO.bno}"> <input
			type='hidden' name='page' value="${pageMaker.page}"> <input
			type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
		<input type='hidden' name='searchType' value="${pageMaker.searchType}">
		<input type='hidden' name='keyword' value="${pageMaker.keyword}">




	<h1>This is a Modify page.</h1>
	<h2>
		Title
		<input type="text" name='title' style="width: 100%"
			value="${boardDTO.title}" >
	</h2>
		<h2>Image</h2>
		<input type='file' multiple="multiple" name='file'>
	<div id="deleteList">

	</div>
		<c:forEach var="imageList" items="${imageList }">
			<input type="hidden" name="attno" value="${imageList.attno }">
				<div id='${imageList.attno }'>
				<img src='/ex/displayFile?fileName=/${imageList.filename }' style="width:200px; height:200px;" />
				<br><input type="button" onclick="deleteimg(${imageList.attno })" value="X">

				</div>
		</c:forEach>
<h2>poll</h2>
	    <input type="button" value="자식창 열기" onclick="openChild()">
			<div id="poll">
			<input type="text" id="pollTitle" name="pollTitle" value="${pollTitle }"/>
			
			<input type="datetime-local" id="endtime" name="endtime" value="${endtime }"/><br>
			<div id="pollitem">
				<c:forEach var="pollList" items="${pollList }">
							<input type="hidden" name="pno" value="${pollList.pno }">
							<input type="text" name="item" value="${pollList.item }">
							<input type="text" name="vote_cnt" value="${pollList.vote_cnt }" readonly><br>
										</c:forEach>
<div id="footer">
	<h2>
		Content
		<textarea style="width: 100%" name="content" rows="3"
			>${boardDTO.content}</textarea>
	</h2>

	<h2>
		Writer <input type="text" name="writer" style="width: 100%"
			value="${boardDTO.writer}" readonly>
		<h2>
		
	<button type="submit" >Modify</button>
	</form>
				<form action="/ex/list" method="get">
				<button type="submit">LIST ALL</button>
				</form>
				

			</div> 
			</div> 
			<!-- /.box-body 
			<div class="box-footer">
				<button type="submit" class="btnModify">Modify</button>
				<button type="submit" class="btnRemove">REMOVE</button>
				<button type="submit" class="btnList">LIST ALL</button>
			</div>

			<div id='modDiv' style="display: none;">
				<div class='modal-title'></div>
				<div>
					<input type='text' id='replytext'>
				</div>
				<div>
					<button type="button" id="replyModBtn">Modify</button>
					<button type="button" id="replyDelBtn">DELETE</button>
					<button type="button" id='closeBtn'>Close</button>
				</div>
			</div> -->
			
<!-- upload start
<style>
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted blue;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>

	<div class='uploadedList'></div>-->
	<script>
	function uploadListAll(){
		var formData = new FormData();
		formData.append("bno","${boardDTO.bno}")
	
		/* $(".uploadedList").on("click", "small", function(event){
			
			 var that = $(this);
		 */
		   $.ajax({
			   url:"/ex/allFile",
			   type:"post",
			   data: {"bno":"${boardDTO.bno}"},
			   dataType:"text",
			   success:function(result){
				   //alert(typeof result)
				   result=eval(result);
				   for(var i=0;i<result.length;i++){
					   var data=result[i];
					   var str ="";
						  
						  if(checkImageType(data)){
							  str ="<div><a href='/ex/displayFile?fileName="+getImageLink(data)+"''>"
									  +"<img src='/ex/displayFile?fileName="+data+"'/>"
									  +"</a><small data-src='"+data+"'>X</small></div>";
						  }else{
							  str = "<div><a href='/ex/displayFile?fileName="+data+"'>" 
									  + getOriginalName(data)+"</a>"
									  +"<small data-src='"+data+"'>X</small></div></div>";
						  }
						  
						  $(".uploadedList").append(str);
				  } 
			   }
		   });
		/* }); */
	}	
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			console.log(files);
			var file = files[0];

			console.log(file);
			var formData = new FormData();
			
			formData.append("file", file);
			formData.append("bno","${boardDTO.bno}")
			
			$.ajax({
				  url: '/ex/uploadAjax',
				  data: formData,
				  dataType:'text',
				  processData: false,
				  contentType: false,
				  type: 'POST',
				  success: function(data){
					  
					  var str ="";
					  
					  if(checkImageType(data)){
						  str ="<div><a href='/ex/displayFile?fileName="+getImageLink(data)+"''>"
								  +"<img src='/ex/displayFile?fileName="+data+"'/>"
								  +"</a><small data-src='"+data+"'>X</small></div>";
					  }else{
						  str = "<div><a href='/ex/displayFile?fileName="+data+"'>" 
								  + getOriginalName(data)+"</a>"
								  +"<small data-src='"+data+"'>X</small></div></div>";
					  }
					  
					  $(".uploadedList").append(str);
				  }
				});	
		});


		$(".uploadedList").on("click", "small", function(event){
			
				 var that = $(this);
			
			   $.ajax({
				   url:"/ex/deleteFile",
				   type:"post",
				   data: {fileName:$(this).attr("data-src")},
				   dataType:"text",
				   success:function(result){
					   if(result == 'deleted'){
						   that.parent("div").remove();
					   }
				   }
			   });
		});
		

		function getOriginalName(fileName){	

			if(checkImageType(fileName)){
				return;
			}
			
			var idx = fileName.indexOf("_") + 1 ;
			return fileName.substr(idx);
			
		}


		function getImageLink(fileName){
			
			if(!checkImageType(fileName)){
				return;
			}

			
			return fileName.replace("s_","");
			
		}
		function checkImageType(fileName){
			
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);
			
		}
			
			
		</script>

		
<!-- upload end 
			<h2>Ajax Test Page</h2>
			<div>
				<div>
					REPLYER <input type='text' name='replyer' id='newReplyWriter'>
				</div>
				<div>
					REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
				</div>
				<button id="replyAddBtn">ADD REPLY</button>
			</div>



			<ul id="replies">
			</ul>

			<div class='pagination'></div>
</div>-->



