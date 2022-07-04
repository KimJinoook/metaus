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
	                                            src="<c:url value='/images/managerProfile/${managerVo.managerPic }'/>" alt="..." onerror="this.onerror=null; this.src='<c:url value='/admin/img/undraw_profile.svg'/>'">
	                                    
	                                    </div>
	                                    <div class="text-center">
	                                    	JPG, PNG 파일 업로드
	                                    </div>
	                                    <br>
	                                    <div class="text-center">
	                                    	<a href="javascript:upfileClick()" class="btn btn-primary btn-icon-split btn-lg">
		                                        
		                                        <span class="text">파일 업로드</span>
		                                        <div style="display:none;"><input type="file" name="upfile" id="inputPic"></div>
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
	                                    <form class="user" method="post" action="<c:url value='/admin/login/adminLogin'/>">
	                                		<div class="row">
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                        	<span>아이디</span>
			                                            <input type="text" class="form-control form-control-user"
			                                                aria-describedby="emailHelp" value="${managerVo.managerId }"
			                                                placeholder="Id" name="managerId" readonly="readonly">
			                                                
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                            <input type="password" class="form-control form-control-user"
			                                                id="exampleInputPassword" placeholder="Password" name="managerPwd">
			                                        </div>
			                                        <br/>
			                                        <button type="button" class="btn btn-primary btn-user btn-block" id="adminLoginBtn">Login</button>
			                                        <br/><br/><br/>
			                               
		                                   		</div>
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                            <input type="text" class="form-control form-control-user"
			                                                id="exampleInputEmail" aria-describedby="emailHelp"
			                                                placeholder="Id" name="managerId">
			                                                
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                            <input type="password" class="form-control form-control-user"
			                                                id="exampleInputPassword" placeholder="Password" name="managerPwd">
			                                        </div>
			                                        <br/>
			                                        <button type="button" class="btn btn-primary btn-user btn-block" id="adminLoginBtn">Login</button>
			                                        <br/><br/><br/>
			                               
		                                   		</div>
		                                		<div class="col-lg-2">
			                                        <button type="button" class="btn btn-primary btn-user btn-block" id="adminLoginBtn">Login</button>
			                               
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
