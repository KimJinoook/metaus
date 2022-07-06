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
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btnsing').click(function() {
			if($('#managerName').val().length < 1){
				alert("이름을 입력해주세요.");
				$('#managerName').focus();
				event.preventDefault();
			
			} else if ($('#managerIdchk').val() != 'Y' ) {
				alert("아이디 중복확인이 필요합니다.");
				$('#managerId').focus();
				event.preventDefault();
			} else if ($.trim($('#managerPwd').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#managerPwd').focus();
				event.preventDefault();
			} else if ($.trim($('#managerPwd').val()) != $.trim($('#managerPwdchk').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#managerPwdchk').focus();
				event.preventDefault();
						
			}
		});
		
		$('#managerIdCheck').click(function(){
					
					var id = $('#managerId').val();
					var getdata;
		
					$.ajax({
						url: "<c:url value='/admin/member/managerIdCheck'/>"+"?id="+id,
						type:"get",
						async:false,
						success:function(data){
							if(data==1){
								alert('사용가능한 아이디 입니다.');
								$('#managerIdchk').val('Y');
								
							}else if(data==2){
								alert('이미 사용중인 아이디입니다.');
								$('#managerId').val("");
							}else{
								alert('아이디 중복 체크가 실패했습니다.');
							}
						}
					});
					event.preventDefault();			
					
				});
	});
</script>


<body class="bg-gradient-primary">

    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5" style="padding-top: 79px; padding-bottom: 161px;">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                  <div class="col-lg-5 d-none d-lg-block bg-login-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관리자 등록</h1>
                            </div>
                            <form class="user" method="post" action="<c:url value='/admin/member/managerList'/>">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="managerName" name="managerName"
                                        placeholder="Name">
                                </div>
                                
                                <div class="form-group">
	                                <div class="input-group">
			                            <input type="text" class="form-control form-control-user" placeholder="Id"
			                                id="managerId" name="managerId">
			                            <div class="input-group-append">
			                                <button class="btn btn-primary" type="button" id="managerIdCheck">
			                                    <i>중복확인</i>
			                                </button>
										<input type="hidden" class="form-control" id="managerIdchk" name="managerIdchk">
			                            </div>
			                            
	                        		</div>
                                </div>
                                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="managerPwd" name="managerPwd" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="managerPwdchk" name="managerPwdchk" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <button type="submit" id="btnsing" class="btn btn-primary btn-user btn-block">등록</button>                   
                            </form>
                            <hr>                          
                        </div>
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
<%@ include file="../inc/adminFooter.jsp" %>
