<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cookie-sign up</title>
 <!-- Bootstrap -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
   
    </head>
    <body>
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
             
            <div class="row">
                <p></p>
                <div class="col-md-6">
                    <small>
                    <a href="/user/login">로그인</a> | <a href="/sboard/list">게시판</a>
                    </small></div>
                
            </div>
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
                <!-- 본문 들어가는 부분 -->
                 
 
 
        <form class="form-horizontal" role="form" method="post" action="register" id="registerPost">

            <div class="form-group" id="divId">
                <label for="inputId" class="col-lg-2 control-label">아이디</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id"data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divpw">
                <label for="inputpw" class="col-lg-2 control-label">패스워드</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="pw" name="pw" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divpwCheck">
                <label for="inputpwCheck" class="col-lg-2 control-label">패스워드 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="pwCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                </div>
            </div>
           
            <div class="form-group" id="divNickname">
                <label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="nickname" name="nickname" data-rule-required="true" placeholder="닉네임" maxlength="15">
                </div>
            </div>
             
            </div>
            <div class="col-sm-3" style="text-align:center;">
            
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" id="regBtn" class="btn btn-default">Sign in</button>
                </div>
                </div>
            </div>
        </form>
         
         
        <script>
         
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                 
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                 
                //------- 검사하여 상태를 class에 적용
                $('#id').keyup(function(event){
                     
                    var divId = $('#divId');
                     
                    if($('#id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                });
                 
                $('#pw').keyup(function(event){
                     
                    var divpw = $('#divpw');
                     
                    if($('#pw').val()==""){
                        divpw.removeClass("has-success");
                        divpw.addClass("has-error");
                    }else{
                        divpw.removeClass("has-error");
                        divpw.addClass("has-success");
                    }
                });
                 
                $('#pwCheck').keyup(function(event){
                     
                    var pwCheck = $('#pwCheck').val();
                    var pw = $('#pw').val();
                    var divpwCheck = $('#divpwCheck');
                     
                    if((pwCheck=="") || (pw!=pwCheck)){
                        divpwCheck.removeClass("has-success");
                        divpwCheck.addClass("has-error");
                    }else{
                        divpwCheck.removeClass("has-error");
                        divpwCheck.addClass("has-success");
                    }
                });
                 
                $('#name').keyup(function(event){
                     
                    var divName = $('#divName');
                     
                    if($.trim($('#name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                });
                 
                $('#nickname').keyup(function(event){
                     
                    var divNickname = $('#divNickname');
                     
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
                    }
                });
                 
                $('#email').keyup(function(event){
                     
                    var divEmail = $('#divEmail');
                     
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                 
                $('#phoneNumber').keyup(function(event){
                     
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    if($.trim($('#phoneNumber').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                 
                 
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                     
                    var provision = $('#provision');
                    var memberInfo = $('#memberInfo');
                    var divId = $('#divId');
                    var divpw = $('#divpw');
                    var divpwCheck = $('#divpwCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    //회원가입약관
                    if($('#provisionYn:checked').val()=="N"){
                        modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                        modal.modal('show'); //모달 띄우기
                         
                        provision.removeClass("has-success");
                        provision.addClass("has-error");
                        $('#provisionYn').focus();
                        return false;
                    }else{
                        provision.removeClass("has-error");
                        provision.addClass("has-success");
                    }
                     
                    //개인정보취급방침
                    if($('#memberInfoYn:checked').val()=="N"){
                        modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        memberInfo.removeClass("has-success");
                        memberInfo.addClass("has-error");
                        $('#memberInfoYn').focus();
                        return false;
                    }else{
                        memberInfo.removeClass("has-error");
                        memberInfo.addClass("has-success");
                    }
                     
                    //아이디 검사
                    if($('#id').val()==""){
                        modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                        $('#id').focus();
                        return false;
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                     
                    //패스워드 검사
                    if($('#pw').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divpw.removeClass("has-success");
                        divpw.addClass("has-error");
                        $('#pw').focus();
                        return false;
                    }else{
                        divpw.removeClass("has-error");
                        divpw.addClass("has-success");
                    }
                     
                    //패스워드 확인
                    if($('#pwCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divpwCheck.removeClass("has-success");
                        divpwCheck.addClass("has-error");
                        $('#pwCheck').focus();
                        return false;
                    }else{
                        divpwCheck.removeClass("has-error");
                        divpwCheck.addClass("has-success");
                    }
                     
                    //패스워드 비교
                    if($('#pw').val()!=$('#pwCheck').val() || $('#pwCheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                         
                        divpwCheck.removeClass("has-success");
                        divpwCheck.addClass("has-error");
                        $('#pwCheck').focus();
                        return false;
                    }else{
                        divpwCheck.removeClass("has-error");
                        divpwCheck.addClass("has-success");
                    }
                     
                    //이름
                    if($('#name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                     
                    //닉네임
                    if($('#nickname').val()==""){
                        modalContents.text("닉네임을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                        $('#nickname').focus();
                        return false;
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
                    }
                     
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                     
                    //휴대폰 번호
                    if($('#phoneNumber').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#phoneNumber').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                     
                 
                });
                 
            });
             
        </script>
        
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
		            
		         var id = $("#id").val();
		         var pw = $('#pw').val();
		         var pwCheck = $("#pwCheck").val();

		                                          
		            if (id == ""|| $('#id').val() == ""
		                        || $('#pw').val() == ""
		                        || $('#nickname').val() == ""
		                        ) {
		                           alert("항목을 입력해주세요");
		                           return;
		            }else if (pw != pwCheck) {
							  alert("비밀번호를 확인해주세요");
							  return;
		            } else{
		               
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
                <!--// 본문 들어가는 부분 -->
            <hr/>
            <!-- 푸터 들어가는 부분 -->
             
            <div>
                <p class="text-center">
                    <small><strong> INTER DATA</strong></small><br>
                    <small>Copyrightⓒ cookie All rights reserved.</small>
                </p>
            </div>
            <!--// 푸터 들어가는 부분 -->
    </body>
</html>