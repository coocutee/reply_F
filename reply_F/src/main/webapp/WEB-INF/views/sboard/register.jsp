<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</head>
<body>

<div class="container">
<table class="table table-bordered">

        <caption> 글쓰기 </caption>

    <tbody>
        <form name="register" method="post" encType="multiplart/form-data">
        
           <input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }">
			<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }">
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="30" placeholder="내용을 입력하세요. " name="content"></textarea></td>
            </tr>
           
                <td colspan="2">
                    <button type="submit" name="regBtn"> 등록 </button> 
                </td>
        </form>
    </tbody>
</table>
</div>






<!-- <h1> 등록페이지</h1> -->

<!-- <form id="register" method="post">  -->

<%-- <input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }"> --%>
<%-- <input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }"> --%>


<!-- 제목 : <input type="text" name="title" id="title"> -->
<!-- <p>  -->
<!-- 내용 : <input type="text" name="content" id="content">  -->

<!-- <button type="submit" id="regBtn"> 등록하기 </button> -->

<!-- </form> -->

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