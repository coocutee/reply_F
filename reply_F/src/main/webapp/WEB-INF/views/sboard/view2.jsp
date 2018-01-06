<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<div> 

<form id="FormObj" method="post"> 

<input type="hidden" name="bno" id="bno" value="${boardVO.bno}"> 
<input type="hidden" name="page" value="${cri.page}"> 
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="searchType" value="${cri.searchType}"> 
<input type="hidden" name="keyword" value="${cri.keyword}"> 

<input type="hidden" name="uno"  id="uno" value="${sessionScope.LOGIN.uno}">
<input type="hidden" name="nickname" id="nickname" value="${sessionScope.LOGIN.nickname}">

제목 : ${boardVO.title}
<p>
글쓴이 : ${boardVO.nickname}
<p>
내용 : ${boardVO.content}

</form>

</div>

<div class="btn">

<c:if test="${sessionScope.LOGIN.nickname eq boardVO.nickname}">
<button type="submit" class ="btn_modify"> 수정  </button>
<button type="submit" class="btn_remove"> 삭제  </button>
</c:if>
<button type="submit" class="btn_list"> 목록  </button>




</div>

<div class="reply">
	댓글리스트


<c:forEach items='${replyVO}' var='replyVO' >
	<c:if test='${sessionScope.LOGIN.nickname eq replyVO.nickname}'> 
		<button type='submit' name='replyremove'> 삭제 </button> <button type='submit' name='replymodify'> 수정 </button> 
</c:if>
</c:forEach>



<ul class = "replies" id="replies">


</ul>

<c:if test="${!empty sessionScope.LOGIN.nickname}">
	<input type="text" id="reptxt" name="reptxt" value=""> 
	
	<button type="submit" id="replyBtn" name="replyBtn"> 확인 </button>
</c:if>

</div>

<script>

	$(document).ready(function(){
		
		var nickname = $("#nickname").val();
		console.log(nickname);
		
		//수정버튼 눌렀을때 이벤트 활성화
		$(".btn_modify").on("click",function(){
			$("#FormObj").attr("action","/sboard/modify");
			$("#FormObj").attr("method","get");
			$("#FormObj").submit();
			
		});
		
		//삭제버튼 이벤트
		$(".btn_remove").on("click",function(){
			
			if(confirm("정말 삭제하시겠습니까?") == true){
			$("#FormObj").attr("action","/sboard/remove");
			$("#FormObj").submit();
			} else {
				return;
			}
		});
		
		//목록버튼 이벤트
		$(".btn_list").on("click",function(){
			$("#FormObj").attr("method","get");
			$("#FormObj").attr("action","/sboard/list");
			$("#FormObj").submit();
		});
		
		
	      $("#replyBtn").on("click",function(event) {

	    	  event.preventDefault();
	            
	         var reptxt = $("#reptxt").val();
	           if (reptxt == ""
	                        ) {
	                alert("댓글 내용을 입력해주세요");
	              return;
	            }
	               
	         }); 
	      
	});
	
	


</script>


<script>
	var bno = $("#bno").val();
	var uno = $("#uno").val();
	var nickname = $("#nickname").val();

	
function getListAll(){
	$.getJSON("/replies/all/"+bno, function(data){
		
		
		console.log("닉네임 :" +nickname);
		
		var str = "";
	
	$(data).each(
			function(){
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
				+"<input type='hidden' class='thisrno' value='"+this.rno+"'>"+this.nickname + "<br> " + this.reptxt
				+"<input type='hidden' class='thisreptxt' value='"+this.reptxt+"'>"
				+"<c:if test='${sessionScope.LOGIN.nickname eq boardVO.nickname}'> <button type='submit' class='replyDelBtn'> 삭제 </button>"
				+"</c:if> </li>";
			});	

			$("#replies").html(str);
			});
		} getListAll();
	
	$("#replyBtn").on("click",function(){

		var reptxt = $("#reptxt").val();
		
		$.ajax({
			
			type : 'post',                              
			url : '/replies',
			headers: {"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
				
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				uno : uno,
				nickname : nickname,
				reptxt : reptxt
			}),
			
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					$("#reptxt").val("");
					getListAll();
				}
			}
			
			
		});
		
	});
	

	$(document).on("click", ".replyDelBtn",function(event) {
		
		var rno = $(".thisrno").val();
		
		confirm("댓글을 삭제하시겠습니까?");
	//	var reptxt = $("#thisreptxt").val();
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					self.location.reload();
				}
			}
		}); //ajax end
	}); //event end	

</script>

</body>
</html>