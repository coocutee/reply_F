<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<H2> 테스트페이지 </H2>

<ul id="replies">


</ul>

<div>
<div>
	댓글쓴이 <input type='text' name="nickname" id="nickname2" >
	
	댓글내용 <input type='text' name="reptxt" id="reptxt2" >
	</div>
	<button id="replyBtn"> 쓰기 </button>
</div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
<script>
	var bno = 125;
	var uno = 7;
	
	function getAllList(){
	
	$.getJSON("/replies/all/"+bno, function(data){
		console.log(data.length);
		var str = "";
	
	$(data).each(
			function(){
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
				+this.rno + ":" + this.reptxt
				+"</li>";
			});		
	
			$("#replies").html(str);
			});
	}
	
	$("#replyBtn").on("click",function(){
		
		var nickname = $("#nickname2").val();
		var reptxt = $("#reptxt2").val();
		
		$.ajax({
			
			type : 'post',                              
			url : '/replies',
			headers: {"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
				
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				uno : uno,
				nickname : nickname,
				reptxt : reptxt
			}),
			
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					getAllList();
				}
			}
			
			
		});
		
	});

</script>

</body>
</html>