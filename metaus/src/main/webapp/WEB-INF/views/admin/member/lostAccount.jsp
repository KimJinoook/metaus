<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>
<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">
<link href="<c:url value='/admin/css/sb-admin-2.css'/>" rel="stylesheet">
<!-- Sheet JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>


<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-login-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">                           
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
                            
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
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

<%@ include file="../inc/adminFooter.jsp" %>
