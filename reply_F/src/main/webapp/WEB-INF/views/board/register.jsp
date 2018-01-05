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


제목 : <input type="text" name="title">
<p> 
내용 : <input type="text" name="content"> 

<button type="submit"> 등록하기 </button>

</form>



</body>
</html>