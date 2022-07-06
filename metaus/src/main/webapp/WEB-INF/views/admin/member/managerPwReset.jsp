<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Metaus - Login</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/admin/css/sb-admin-2.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
$(function() {
	$('#frm-pw-update').submit(function(){
		if ($.trim($('#managerPwd').val()).length < 1) {
			alert("비밀번호를 입력해주세요.");
			$('#managerPwd').focus();
			event.preventDefault();

		} else if ($.trim($('#managerPwd').val()) != $.trim($('#managerPwdchk').val())) {
			alert("비밀번호가 일치하지 않습니다.");
			$('#managerPwdchk').focus();
			event.preventDefault();
					
		}
	});
	
	

	$('#managerPwdchk').keyup(function(){
		if($.trim($('#managerPwd').val()) != $.trim($('#managerPwdchk').val())){
			$('#managerPwCheckLb').html("&nbsp;&nbsp;[비밀번호 불일치]");
			$('#managerPwCheckLb').css("color","red");
		}else{
			$('#managerPwCheckLb').html("&nbsp;&nbsp;[비밀번호 일치]");
			$('#managerPwCheckLb').css("color","green");
			
		}
	});
});

</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-12 col-lg-12 col-md-8" style="padding-top: 20%">
                <div class="card o-hidden border-0 shadow-lg my-5" >
                    <div class="card-body p-0">
                    
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
	                                <div class="text-center">
	                                	<h1 class="h4 text-gray-900 mb-4">비밀번호 재설정</h1>
	                            	</div>
	                            	<form method="post" action="<c:url value='/admin/member/updatePw'/>"id="frm-pw-update">	                                
	                                	<div class="form-group">
                                    		
                                    			<label style="color: black;">비밀번호</label>
                                        		<input type="password" class="form-control form-control-user"
                                            		id="managerPwd" name="managerPwd" placeholder="Password">
                                            	<input type="hidden" name="managerId" value="${managerId }">
                                    		
                                    	</div>
                                    	<br>
                                    	<div class="form-group">	
		                                    
		                                    	<label style="color: black;">비밀번호 확인</label>
		                                    	<label id="managerPwCheckLb"></label>
		                                        <input type="password" class="form-control form-control-user"
		                                            id="managerPwdchk" name="managerPwdchk" placeholder="Repeat Password">
		                                    
                                		</div>
                                		<br>
                                			<button type="submit" id="btnsing" class="btn btn-primary btn-user btn-block">변경하기</button>
                                		<br>
	                                </form>	                                              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    
    <script src="<c:url value='/admin/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/admin/js/sb-admin-2.min.js'/>"></script>

</body>

</html>