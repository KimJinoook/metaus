<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">


<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script>
	function upfileClick(){
		$('#inputPic').click();
	}
	$(function(){
		/**파일첨부*/
		$('#inputPic').change(function(){
			$('#filename').html($('#inputPic').val());			
		});
		
		
		/**비밀번호 확인*/
		$('#pwc').keyup(function(){
			if($.trim($('#pw').val()) != $.trim($('#pwc').val())){
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치하지 않습니다]");
				$('#memPwCheckLb').css("color","red");
			}else{
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치합니다]");
				$('#memPwCheckLb').css("color","green");
				
			}
		});
		
		/**서브밋*/
		$('#adminEditBtn').click(function(){
			if ($.trim($('#pw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#pw').focus();
				event.preventDefault();

			} else if ($.trim($('#pw').val()) != $.trim($('#pwc').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pwc').focus();
				event.preventDefault();
						
			}
		});
		
	});
</script>

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-2 text-gray-800">사용자 정보</h1>
                    </div>
                    
                
                    

                    	<div class="row">

	                        <div class="col-lg-4">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">프로필 사진</h6>
	                                </div>
	                                <div class="card-body">
		                                <div class="text-center">
	                                        <img class="rounded-circle mt-3 mb-4" style="width: 15rem;height:15rem;"
	                                            src="<c:url value='/manager_profile/${managerVo.managerPic }'/>" alt="..." onerror="this.onerror=null; this.src='<c:url value='/admin/img/undraw_profile.svg'/>'">
	                                    
	                                    </div>
	                                    <div class="text-center">
	                                    	JPG, PNG 파일 업로드<br>
	                                    	<span id="filename">&nbsp;</span>
	                                    </div>
	                                    <br>
	                                    <div class="text-center">
	                                    	<a href="javascript:upfileClick()" class="btn btn-primary btn-icon-split btn-lg">
		                                        
		                                        <span class="text">파일 업로드</span>

		                                    </a>
	                                    </div>
	                                </div>
	                            </div>
	
	                        </div>
	                        
	                        <div class="col-lg-8">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">프로필 정보</h6>
	                                </div>
	                                <div class="card-body">
	                                    <form class="user" method="post" enctype="multipart/form-data" action="<c:url value='/admin/member/managerEdit'/>">
	                                		<div class="row">
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                        	<span>아이디</span>
			                                            <input type="text" class="form-control form-control-user"
			                                                value="${managerVo.managerId }"
			                                                placeholder="Id" name="managerId" readonly="readonly">
			                                            <input type="hidden" name="managerNo" value="${managerVo.managerNo }">    
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                        	<span>비밀번호</span>
			                                            <input type="password" class="form-control form-control-user"
			                                                id="pw" placeholder="Password" name="managerPwd">
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                        	<span>비밀번호 확인</span><span id="memPwCheckLb" style="color: red"></span>
			                                            <input type="password" class="form-control form-control-user"
			                                                id="pwc" placeholder="Password" name="managerPwdChk">
			                                        </div>
			                                        
			                                        <br/>
			                               
		                                   		</div>
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                        	<span>이름</span>
			                                            <input type="text" class="form-control form-control-user"
			                                            	value="${managerVo.managerName }"
			                                                placeholder="name" name="managerName">
			                                                
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                        	<span>전화번호</span>
			                                            <input type="tel" class="form-control form-control-user"
			                                            	value="${managerVo.managerTel }"
			                                                placeholder="tel" name="managerTel">
			                                        </div>
			                                        <br/>
			                                        <div style="display:none;"><input type="file" name="upfile" id="inputPic" accept="image/gif, image/jpg, image/JPG, image/jpeg, image/png, image/PNG"></div>
			                                        <input type="hidden" value="${managerVo.managerPic }" name="managerPic">
			                                        
			                               
		                                   		</div>
		                                		<div class="col-lg-2">
			                                        <button type="submit" class="btn btn-primary btn-user btn-block" id="adminEditBtn">저장</button>
			                               
		                                   		</div>
	                                   		</div>
	                                    </form>
	                                </div>
	                            </div>
	
	                        </div>
	                        
	                        
	                        
                        </div>




                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
	<!-- Page level plugins -->
	<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	
	<!-- Page level custom scripts -->
	<script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>

<%@ include file="../inc/adminFooter.jsp" %>
