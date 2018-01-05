<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> 등록페이지</h1>

<form id="register" method="post"> 

<input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }">
<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }">


제목 : <input type="text" name="title" id="title">
<p> 
내용 : <input type="text" name="content" id="content"> 

<button type="submit" id="regBtn"> 등록하기 </button>

</form>

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