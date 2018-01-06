<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

   <form action="register" method="post" id="registerPost">
   
    <input type="text" name="id" id="id"  placeholder="아이디" value="" /> 
    <br>
   
     <input type="password" id="pw" name="pw"  placeholder="비밀번호" value=""> 
     <br>
     <input type="password" id="checkpw" placeholder="비밀번호 재확인" value="">
     <br>
             <div class="form-group has-feedback">
          <font name="check" size="2" color="red"></font>
        </div>
        <div class="form-group has-feedback">
          <font name="pwcheck" size="2" color="red"></font>
        </div>
        
   <input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임" value="" /> 
   <div>
             <button type="submit" id="regBtn" >완료</button>
</div>
   </form>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
	var pw = $("#pw").val();
	var checkpw = $("#checkpw").val();
	
	$(function(){
		$("#checkpw").keyup(function(){
			if($("#pw").val() != $("#checkpw").val()) {
	            $('font[name=check]').text('');
	            $('font[name=check]').html("비밀번호를 확인해 주세요.");
				
			}else{
	            $('font[name=check]').text('');
	            $('font[name=check]').html("");
			}

		});
		
	});
	


</script>

<script>

var register = $("#registerPost");
	
	   $(document).ready(function() {
		   
		      $("#regBtn").on("click",function(event) {

		    	  event.preventDefault();
		            
		         var uid = $("#id").val();
		         var upw = $('#pw').val();

		                                          
		            if (id == ""|| $('#id').val() == ""
		                        || $('#pw').val() == ""
		                        || $('#nickname').val() == ""
		                        ) {
		                           alert("항목을 입력해주세요");
		                           return;
		            }else{
		               
		               register.submit();
		               
		            }
		               
		         }); // end regBtn click...
	   });
</script>

    <script>
	var result = '${msg}'
	
	if(result == 'fail'){
		alert("중복된 아이디입니다!");
	}
	
</script>
</body>
</html>