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
$(function(){
	$('#managerIdFind').click(function() {
		if ($.trim($('#managerName').val()).length < 1) {
			alert("이름을 입력해주세요");
			$('#managerName').focus();
			event.preventDefault();

		} else if ($.trim($('#managerTel').val()).length < 1) {
			alert("전화번호를 입력해주세요");
			$('#managerTel').focus();
			event.preventDefault();

		} else if(!validate_tel($('#managerTel').val())){
			alert("사업자번호는 숫자만 입력해주세요.");
			$('#managerTel').focus();
			event.preventDefault();				
		} else{
			var name = $('#managerName').val();
			var tel = $('#managerTel').val();
			
			$.ajax({
				url: "<c:url value='/admin/member/findId'/>",
				type:"GET",
				data:{
					managerName:name,
					managerTel:tel
				},
				async:false,
				success:function(data){
					if(data==""){
						alert('사용자의 정보와 일치하는 아이디가 없습니다.');
						
					}else{
						alert("회원님의 아이디는 "+data+" 입니다.");
						$('#managerId').val(data);
						$('#managerId').focus();
					}
				},
				error:function(){
					alert('ajax 오류');
				}
			});
		}
	});
	
	$('#menagerPwFind').click(function() {
		if ($.trim($('#managerName').val()).length < 1) {
			alert("이름을 입력해주세요");
			$('#managerName').focus();
			event.preventDefault();

		} else if ($.trim($('#managerTel').val()).length < 1) {
			alert("전화번호를 입력해주세요");
			$('#managerTel').focus();
			event.preventDefault();

		} else if(!validate_tel($('#managerTel').val())){
			alert("사업자번호는 숫자만 입력해주세요.");
			$('#managerTel').focus();
			event.preventDefault();				
		} else if ($.trim($('#managerId').val()).length < 1) {
			alert("아이디를 입력해주세요");
			$('#managerId').focus();
			event.preventDefault();

		} else{
			var name = $('#managerName').val();
			var tel = $('#managerTel').val();
			var id = $('#managerId').val();
			
			$.ajax({
				url: "<c:url value='/admin/member/findPw'/>",
				type:"GET",
				data:{
					managerName:name,
					managerTel:tel,
					managerId:id
				},
				async:false,
				success:function(data){
					if(data==0){
						alert('사용자의 정보와 일치하는 계정이 없습니다.');
						
					}else if(data==1){
						document.querySelector('#maPwFindFrm').submit();
					}
				},
				error:function(){
					alert('ajax 오류');
				}
			});
		}
	});
	
	function validate_tel(tel) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
}); 

</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-12 col-lg-12 col-md-8">

                <div class="card o-hidden border-0 shadow-lg my-5" >
                    <div class="card-body p-0">
                    
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                
	                                <form method="post" action="" id="" >
	                                
	                                    <div class="form-group">
	                                	<label style="color: black;">이름</label>                                    
	                                        <input type="text" class="form-control form-control-user" id="managerName" name="managerName"
	                                            placeholder="Name"> 
	                                </div>
	                                <div class="form-group">
	                                	<label style="color: black;">전화번호</label>                                    
	                                        <input type="text" class="form-control form-control-user" id="managerTel"
	                                            placeholder="Tel"> 
	                                </div>
	                                	<button type="button" class="btn btn-primary btn-user btn-block" id="managerIdFind">아이디 찾기</button>                             
	                                <hr>
	                                </form>
                           	
		                            <form method="post" action="<c:url value='/admin/member/managerPwReset'/>" id="maPwFindFrm"> 
		                                
		                                <div class="form-group">
		                                	<label style="color: black;">아이디</label>                                    
		                                        <input type="text" class="form-control form-control-user" id="managerId"
		                                            placeholder="Id"> 
		                                </div>
		                                <div class="form-group">
		                                	<label style="color: black;">이름</label>                                    
		                                        <input type="text" class="form-control form-control-user" id="managerName"
		                                            placeholder="Name"> 
		                                </div>
		                                <div class="form-group">
		                                	<label style="color: black;">전화번호</label>                                    
		                                        <input type="text" class="form-control form-control-user" id="managerTel"
		                                            placeholder="Tel"> 
		                                </div>                                
										<button type="button" class="btn btn-primary btn-user btn-block" id="menagerPwFind">비밀번호 찾기</button>                               
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