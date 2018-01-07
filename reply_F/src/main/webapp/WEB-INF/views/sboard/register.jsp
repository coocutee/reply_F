<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>cookie-register</title>
</head>
<body>

<div class="container"> 


<form id="register" method="post"> 

<input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }">
<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }">

<div class="panel panel-default"> 
<div class="panel-heading"><h4> WRITE </h4></div>
</div>

<div class="row"> 
<div class="col-md-6"> 
<div class="form-group"> 
<label for="name">닉네임 : </label> 
 ${sessionScope.LOGIN.nickname } 
</div> 
</div> 
</div>

 <div class="form-group">
 <label for="title"> 제목 </label>     
<input type="text" class="form-control" name="title" id="title">

</div>

<div class="form-group">
 <label for="content"> 내용 </label>   
 <textarea class="form-control" rows="10" name="content" id="content"></textarea> 
</div>

<button type="submit" id="regBtn" class="btn btn-default" > 등록하기 </button>

</form>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>

var register = $("#register");

$(document).ready(function() {
	   
	      $("#regBtn").on("click",function(event) {

	    	  event.preventDefault();
	            
	         var title = $("#title").val();
	         var content = $('#content').val();
	         var nickname = $('#nickname').val();

	                                          
	            if (nickname == ""|| $('#nickname').val() == ""
	                        || $('#title').val() == ""
	                        || $('#content').val() == ""
	                        ) {
	                           alert("항목을 입력해주세요");
	                           return;
	            }else{
	               
	               alert(" 글이 작성되었습니다! ");
	               register.submit();
	               
	            }
	               
	         }); 
});

</script>


</body>
</html>