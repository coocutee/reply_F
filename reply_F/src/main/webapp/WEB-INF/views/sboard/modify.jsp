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
   
<title>cookie - modify</title>
</head>

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>

<body>
<div class="container"> 

<div class="panel panel-default"> 
<div class="panel-heading"><h4> MODIFY </h4></div>
</div>


<form id="modify" method="post"> 

<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="bno" value="${boardVO.bno}">
<input type="hidden" name="searchType" value="${cri.searchType}"> 
<input type="hidden" name="keyword" value="${cri.keyword}"> 

<input type="hidden" name="uno" value="${sessionScope.LOGIN.uno }">
<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname }">

<div class="row"> 
<div class="col-md-6"> 
<div class="form-group"> 
<label for="name">닉네임 : </label> 
 ${sessionScope.LOGIN.nickname } 
</div> 
</div> 
</div>

<div class="mod">  

<div class="form-group">
 <label for="title"> 제목 </label>     
<input type="text" class="form-control" name="title" id="title" value="${boardVO.title}">

</div>


<div class="form-group">
 <label for="content"> 내용 </label>   
 <textarea class="form-control" rows="10" name="content" id="content"> ${boardVO.content}</textarea> 
</div>


</div>

<div>
<button type="submit" class="btn btn-default" id="btn_com"> 수정하기 </button>
<button class="btn btn-default"> <a href="javascript:history.back();"> 취소하기</a> </button>
</div>

</form>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

	<script>
	
	$(document).ready(function(){
		
		$("#btn_can").on("click",function(){
			//self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
			  //"&searchType=${cri.searchType}&keyword=${cri.keyword}";
		
		});
		
		$("#btn_com").on("click",function(){
			alert("수정이 완료되었습니다!");
			$("#modify").submit();
			self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
			  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
	});
	
	
	</script>

</body>
</html>