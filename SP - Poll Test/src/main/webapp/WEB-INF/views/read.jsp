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
	
    var bDisplay = true; 
    
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

<form action="/ex/toModify" method="get">
			
		<input type='hidden' name='bno' value="${boardDTO.bno}"> <input
			type='hidden' name='page' value="${pageMaker.page}"> <input
			type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
		<input type='hidden' name='searchType' value="${pageMaker.searchType}">
		<input type='hidden' name='keyword' value="${pageMaker.keyword}">



	
	<h1>This is a Read page</h1>
	<h2>
		Title
		<input type="text" name='title' style="width: 100%"
			value="${boardDTO.title}" readonly="readonly">
	</h2>

	<h2>
		Image
			<c:forEach var="imageList" items="${imageList }">
			<div>
			<img src='/ex/displayFile?fileName=/${imageList.filename }'/></div>
			</c:forEach>
	</h2>
	
	<h2>
		Content
		<textarea style="width: 100%" name="content" rows="3"
			readonly="readonly">${boardDTO.content}</textarea>
	</h2>

	<h2>
		Writer <input type="text" name="writer" style="width: 100%"
			value="${boardDTO.writer}" readonly="readonly">
		<h2>
	
		<c:if test= '${boardDTO.writer eq writer }'>
		
		<button type="submit">ToModify</button>
				
				</c:if>
				</form>
				
				<form action="/ex/toRewrite" method="get">	
		<input type='hidden' name='grpno' value="${boardDTO.grpno}">
				<input type='hidden' name='depth' value="${boardDTO.depth}"> 	
				<input type="hidden" name='grpord' value="${boardDTO.grpord }">
				<button type="submit">답글</button>
 				</form>
 				
 				
				<form action="/ex/remove" method="get">
			<c:if test= '${boardDTO.writer eq writer || authority eq "ADMIN" }'>
				
				<input type='hidden' name='bno' value="${boardDTO.bno}"> 
				<button type="submit" >REMOVE</button>
				
				</c:if>
				</form>
				
				
				<form action="/ex/list" method="get">				
				<button type="submit">LIST ALL</button>
 				</form>
 				
 				
 				<br>
 				<table border=1>
				<thead colspan="4">댓글목록</thead>
				<tbody>

				<tr>
				<form action="/ex/insert_reply">
				<td>
				<input type="text" name="replyer" value="${writer }" readonly>
				</td>
				<td colspan="2">
				<input type="text" name="replytext" placeholder="댓글내용" required>
				</td>
				<td>
				<input type='hidden' name='bno' value="${boardDTO.bno}"> 
					<button type="submit">댓글등록</button>
				</form>
				</td>
				</tr>


				<c:forEach var="replyList" items="${replyList }">
				<tr>
				
				
				<form action="/ex/update_reply" method="get">
				<td><input type="text" name="replyer" value="${replyList.replyer }" readonly></td>
				<c:choose>
				<c:when test='${replyList.replyer eq writer }'>
				<td width="200px">

				<input type='hidden' name='rno' value="${replyList.rno}" >
				<input type='hidden' name='bno' value="${boardDTO.bno}">
				
				<textarea id="after_update${replyList.rno }" name="replytext" style="display:none">${replyList.replytext }</textarea>
				<button id="savebutton${replyList.rno }" type="submit" style="display:none">저장</button>				
				</form>
				<button onclick="fn_return(${replyList.rno })" id="cancelbutton${replyList.rno }" type="button" style="display:none">취소</button>
				<p id="before_update${replyList.rno }" ><c:if test="${replyList.depth > 0}">
                        <c:forEach begin="1" end="${replyList.depth}">
                           &nbsp; 
                        </c:forEach>
                        └RE:
                    </c:if>  ${replyList.replytext }</p>
				
				</td>
				</c:when>
				<c:otherwise>
				<td> <p>${replyList.replytext }</p></td>
				</c:otherwise>
				</c:choose>
				
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${replyList.regdate }"/></td>
				<td>
		
		<c:if test= '${replyList.replyer eq writer }'>
		 	<%--  --%>
			<button type="button" onclick="fn_update_re(${replyList.rno })">수정</button>	
		</c:if>
		</form>

		<button type="button" onclick="fn_toReply_re(${replyList.rno })" id="testbtn">답글</button>

		<form action="/ex/delete_reply" method="get">
		<c:if test= '${replyList.replyer eq writer || authority eq "ADMIN" }'>
				<input type='hidden' name='rno' value="${replyList.rno}"> 
		<input type='hidden' name='bno' value="${boardDTO.bno}">  
		<button type="submit">삭제</button>
		</c:if></form>

		</td>
		</tr>
		
		
		<tr id="testdiv${replyList.rno }" style="display:none">
				<form action="/ex/insert_reply_re">
				<input type="hidden" name='grpno' value="${replyList.grpno }">
				<input type="hidden" name='depth' value="${replyList.depth }">
				<input type="hidden" name='grpord' value="${replyList.grpord }">
				<td>
				<input type="text" name="replyer" value="${writer }" readonly>
				</td>
				
				<td colspan = '2'>
				<textarea name="replytext" placeholder="댓글내용" required></textarea>
				</td>
				
				<td>
				<input type='hidden' name='bno' value="${boardDTO.bno}"> 
					<button type="submit">댓글등록</button>
				</form>
				</td>

				</tr>



				</c:forEach>
				</tbody>
				<tfoot>
			
				</tfoot>
				</table>

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



