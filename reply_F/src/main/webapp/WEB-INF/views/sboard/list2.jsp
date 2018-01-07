<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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


<title>cookie-list</title>
</head>

<style>

a{text-decoration: none; color:#666666;}
a:hover{color:#45a4a6;   font-weight: bold;}
body{
width:810px;
/* height:800px;  나중에 설정해줘도됨*/
margin:0 auto;}
/* 만약 위와 테이블간의 여백을 띄우고 싶다면 0의 수치를 변경해주면됨 */

ul {
list-style : none;
margin : 16px auto;
padding : 0;
height:30px;
width: 30%;
}
 li{
margin : 0 0 0 0 ;
padding : 0 0 0 0 ;
border : 0;
float : left;
}

li:last-child{
margin-left:10px;}
 ul li a{
  display:block;
  color:#333333;
height:16px;
line-height:16px;
  width:20px;
  text-decoration:none;

  }
  

  
  table tr{
  height:40px;

  }
  
  table tr td{
   border-bottom:1px solid #80c4c5;
   text-align: center;
   
  }
  
  table tr td:nth-child(1){
  	width:45px;
  	font-weight: 800;
  }


  table tr td:nth-child(2){
  	width:230px;
  	
  }
  
  
   table tr td:nth-child(3){
  	width:230px;
  }
  
  
 table tr td:nth-child(4){
  	width:200px;
  }
  
  .text-center{position:relative;}
  
  .atext {
    display: block;
    width: 15%;
    position: absolute;
	top: -4px;
	right : 140px;
} 

 .tr_1{background-color: #45a4a6;
 color:#fff;}

</style>
<body>


<h1> 목록보기 :) </h1>


<form name="hidden" method="post"> 
<input type="hidden" name="uno" value="${sessionScope.LOGIN.uno}">
<input type="hidden" name="nickname" value="${sessionScope.LOGIN.nickname}">
</form>
<table class="tb_1" cellspacing="0" cellpadding="0">

<tr >
<td> No. </td>
<td> 제목 </td>
<td> 작성자  </td>
<td> 조회수 </td>
<td> 작성일자 　  　　　 </td>
</tr>
</table>

<table>
	
<c:forEach items="${list}" var="boardVO">
<tr>
	<td> ${boardVO.bno} </td>
	<td> <a href='/sboard/view${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title} 
<c:if test="${boardVO.replycnt > 0}"> 	
	<strong>[${boardVO.replycnt}]</strong> </c:if> </a>
	
	</td> 

	<td> ${boardVO.nickname} </td>
	<td> ${boardVO.viewcnt}</td>
	<td> <fmt:formatDate pattern="yyyy-MM-dd"  value = "${boardVO.regdate}"/> </td>	
</tr>
	

</c:forEach>


</table>

<div class = "page">

	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li> <a 
				href = "list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a> </li>
		</c:if>
	
		<c:forEach begin = "${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
		<li
		 <c:out value="${pageMaker.cri.page == idx? 'class=active':''}" />>
			<a 
				href = "list${pageMaker.makeSearch(idx)}"> ${idx} </a>
		</li>
		</c:forEach>
		
		<c:if test = "${pageMaker.next && pageMaker.endPage > 0 }">
			<li> <a 
				href = "list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a> </li>
		</c:if>
	</ul>

</div>

				<div class='box-body'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목or내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							내용or작성자</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							제목or내용or작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='list'>전체목록</button>
<!-- 					<button id='newBtn'>New Board</button> -->

				</div>



<c:if test="${not empty sessionScope.LOGIN.nickname}">
<button type="submit" onclick="location.href='/sboard/register'" name ="register"> 글쓰기  </button>
<button type="submit" onclick="location.href='/user/logout'" name="logout"> 로그아웃 </button>
</c:if>

<c:if test="${empty sessionScope.LOGIN.nickname}">
<button type="submit" onclick="location.href='/user/login'" name="login"> 로그인 </button>
</c:if>



<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

 <script>
	var result = '${msg}'
	
	 if(result == 'remove'){
		alert("삭제되었습니다");
	}
	

</script>

	<script>
	$(document).ready(function() {
			$('#searchBtn').on("click",function(event) {
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
						});
				
				$("#list").on("click",function(event){
					self.location = "/sboard/list";
				});
				
				$('#logout').on("click",function(event){
					alert("로그아웃되셨습니다");
				});
	});
	
</script>

</body>
</html>