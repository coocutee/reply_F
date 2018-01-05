<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1> 수정페이지 </h1>



<form id="modify" method="post"> 

<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="bno" value="${boardVO.bno}">
<input type="hidden" name="searchType" value="${cri.searchType}"> 
<input type="hidden" name="keyword" value="${cri.keyword}"> 

<input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }">
<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }">

닉네임 : ${boardVO.nickname}
<div class="mod">  

<p>
제목 : <input type="text" name="title" value="${boardVO.title}" placeholder="${boardVO.title}">
<p> 
내용 : <input type="text" name="content" value="${boardVO.content}" placeholder="${boardVO.content}" > 

</div>

<div>
<button type="submit" class="btn_can"> 취소하기 </button>
<button type="submit" class="btn_com"> 수정하기 </button>
</div>

</form>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

	<script>
	
	$(document).ready(function(){
		
		$(".btn_can").on("click",function(){
			self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
			  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
		$(".btn_com").on("click",function(){
			$("#modify").submit();
		});
		
	});
	
	
	</script>

</body>
</html>