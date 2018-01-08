<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cookie - view </title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<style>
ul {
list-style: none;
padding-left : 0px;

}

.replyDelBtn {
    background-color: white;
    color: black;
    border: 2px solid white; /* Green */
}

</style>

<body>

<div class="panel panel-default"> 
<div class="panel-heading"><h4>${boardVO.nickname}님의 글입니다!</h4></div>
</div>


<form id="FormObj" method="post"> 

<input type="hidden" name="bno" id="bno" value="${boardVO.bno}"> 
<input type="hidden" name="page" value="${cri.page}"> 
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="searchType" value="${cri.searchType}"> 
<input type="hidden" name="keyword" value="${cri.keyword}"> 

<input type="hidden" name="uno"  id="uno" value="${sessionScope.LOGIN.uno}">
<input type="hidden" name="nickname" id="nickname" value="${sessionScope.LOGIN.nickname}">

 <div class="container">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%"> ${boardVO.title }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value = "${boardVO.regdate}"/> 
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td>
                                ${boardVO.nickname } <span style='float:right'>조회 : ${boardVO.viewcnt }</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>  ${boardVO.content }</p>
                        
                                </td>
                            </tr>
                        </tbody>
                    </table>                   

   
     <table id="commentTable" class="table table-condensed"></table>
  <table class="table table-condensed">
       <tr>
      <td>
 <div class="reply">
	<ul class = "replies" id="replies">


	</ul>
</div>

<c:if test="${!empty sessionScope.LOGIN.nickname}">
	<span class="form-inline" role="form">
	
	<textarea id="reptxt" name="reptxt" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>

	<div class="form-group">
		<button type="button" id="replyBtn" name="replyBtn" class="btn btn-default">확인</button>
		</div>
	</span>
	</c:if>
	</td>
	</tr>
</table>

    <table class="table table-condensed">
 	<thead>
		<tr>  <td>
	<span style='float:right'>
		<c:if test="${sessionScope.LOGIN.nickname eq boardVO.nickname}">
			<button type="submit"  class="btn btn-default" id ="btn_modify"> 수정  </button>
			<button type="submit"  class="btn btn-default" id ="btn_remove"> 삭제  </button>
		</c:if>
	<button type="submit"  class="btn btn-default" id ="btn_list"> 목록  </button>

				
</span>
</td>
</tr>
</thead>
</table>
</form> 

<script>

	$(document).ready(function(){
		
		var nickname = $("#nickname").val();
		console.log(nickname);
		
		//수정버튼 눌렀을때 이벤트 활성화
		$("#btn_modify").on("click",function(){
			$("#FormObj").attr("action","/sboard/modify");
			$("#FormObj").attr("method","get");
			$("#FormObj").submit();
			
		});
		
		//삭제버튼 이벤트
		$("#btn_remove").on("click",function(){
			
			if(confirm("정말 삭제하시겠습니까?") == true){
			$("#FormObj").attr("action","/sboard/remove");
			$("#FormObj").submit();
			} else {
				return;
			}
		});
		
		//목록버튼 이벤트
		$("#btn_list").on("click",function(){
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
				str += "<div> <li data-rno='"+this.rno+"'value='"+this.rno+"' class='replyLi'>"
				+"<input type='hidden' class='thisrno' value='"+this.rno+"'> <strong>"+this.nickname + "</strong> <br> " + this.reptxt 
				+"<input type='hidden' class='thisreptxt' value='"+this.reptxt+"'>"
				+"<input type='hidden' class='thisname' id='thisname' value='"+this.nickname+"'>"
				+"<c:if test='${sessionScope.LOGIN.nickname eq boardVO.nickname}'> <button type='submit' class='replyDelBtn'> x </button>"
				+"</c:if> </li> </div>";
			});	
	
// 	str += "<div> <li data-rno='"+this.rno+"'value='"+this.rno+"' class='replyLi'>"
// 	+"<input type='hidden' class='thisrno' value='"+this.rno+"'> <strong>"+this.nickname + "</strong> <br> " + this.reptxt 
// 	+"<input type='hidden' class='thisreptxt' value='"+this.reptxt+"'>"
// 	+"<input type='hidden' class='thisname' id='thisname' value='"+this.nickname+"'>"
// 	+"<c:if test='${sessionScope.LOGIN.nickname eq thisname.val()}'> <button type='submit' class='replyDelBtn'> x </button>"
// 	+"</c:if> </li> </div>";
	
	console.log(data);
	
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
		
		var rno = this.closest("li").value;
	
		//var pr = $(".replyDelBtn").parent();
		
		console.log(rno);
	
		
		if(confirm("댓글을 삭제하시겠습니까?")){
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
		}else{
			return false;
		}
	}); //event end	

</script>

</body>
</html>