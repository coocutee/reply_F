<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cookie-login</title>

</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }

</style>


<body>

<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" action="/user/loginPost" method="post">
                    <div>
                        <input type="text" class="form-control" name="id" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="pw" placeholder="Password">
                    </div>
                    <div>
                        <button type="submit" id='loginBtn' class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
                    <div>
                    <button type="submit" onclick="location.href='../user/register'" class="form-control btn btn-primary">회원가입</button>
                    </div>
            </div>
        </div>
    </div>
</div>
   <script>
	var result = '${result}'
	var msg = '${msg}'
	
	if(result == 'fail'){
		alert("아이디나 비밀번호를 확인해주세요!");
	} else if(msg == 'good') {
		alert("회원가입을 축하합니다 :) 로그인 해주세요!");
	}
	
	
</script>


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>