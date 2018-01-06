<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<form action="/user/loginPost" method="post">

	<input type="text" name="id" class="form-control" placeholder="ID">
<br>
    <input type="password" name="pw" class="form-control" placeholder="Password">

    <button type="submit" id="loginBtn" > 로그인 </button>
    
       </form>
       <Br>
    <a href="../user/register" class="text-center">회원가입</a>
    
    <script>
	var result = '${result}'
	var msg = '${msg}'
	
	if(result == 'fail'){
		alert("아이디나 비밀번호를 확인해주세요!");
	} else if(msg == 'good') {
		alert("회원가입을 축하합니다 :) 로그인 해주세요!");
	}
	
	
</script>

</body>
</html>