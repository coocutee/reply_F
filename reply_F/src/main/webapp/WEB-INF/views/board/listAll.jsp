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

<style>
  table tr{
  height:40px;

  }
  
  table tr td{
   border-bottom:1px solid #80c4c5;
   text-align: center;
   
  }
  
  table tr td:nth-child(1){
  	width:45px;
  	font-weight: 600;
  }


  table tr td:nth-child(2){
  	width:130px;
  	
  }
  
  
   table tr td:nth-child(3){
  	width:230px;
  }
  
  
 table tr td:nth-child(4){
  	width:400px;
  }
</style>
<body>


<h1> 목록보기 :) </h1>

<table class="tb_1" cellspacing="0" cellpadding="0">

<tr >
<td> No. </td>
<td> 제목 </td>
<td> 작성자  </td>
<td> 작성일자 </td>
</tr>
</table>

<table>
	
<c:forEach items="${list}" var="boardVO">
<tr>
	<td> ${boardVO.bno} </td>
	<td> <a href='/board/view?bno=${boardVO.bno}'>${boardVO.title} </a></td>
	<td> ${boardVO.nick} </td>
	<td> <fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value = "${boardVO.regdate}"/> </td>	
</tr>
	

</c:forEach>


</table>

<a href="/board/register">글쓰기</a>


 <script>
	var result = '${msg}'
	
	if(result == 'success'){
		alert("글쓰기 완료!");
	}
	
	else if(result == 'remove'){
		alert("삭제되었습니다");
	}

</script>

</body>
</html>