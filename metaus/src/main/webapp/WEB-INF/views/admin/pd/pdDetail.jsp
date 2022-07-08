<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">


<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script>

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
	                                
	                                    
	                                    	<canvas id="canvas1" width="500px" height="500px"></canvas>
	                                    
	                                    <script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>

<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
<script type="module">
	

	//var url = "<c:url value='/gltfmodel/bathroom_interior.zip'/>";

	var url = "<c:url value='/gltfmodel/2.zip'/>";

	//var url = 'models/gltf/BoomBox.gltf';

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#canvas1'),
		antialias : true
	});
	renderer.outputEncoding = THREE.sRGBEncoding;
	
	var camera = new THREE.PerspectiveCamera(30,1);
	camera.position.set(0,0,5)
	
	let controls = new THREE.OrbitControls(camera, renderer.domElement);
	controls.update();

	scene.background = new THREE.Color('white');


	const grid = new THREE.GridHelper( 20, 20, 0x000000, 0x000000 );
	grid.material.opacity = 0.2;
	grid.material.transparent = true;
	grid.position.y = -1;
	scene.add( grid );

	new Promise( function( resolve, reject ) {

		if ( url.match( /\.zip$/ ) ) {

			new THREE.ZipLoader().load( url ).then( function( zip ) {

				manager.setURLModifier( zip.urlResolver );

				resolve( zip.find( /\.(gltf|glb)$/i )[ 0 ] );

			} );

		} else {

			resolve( url );

		}

	} ).then( function ( file ) {

		new THREE.GLTFLoader( manager ).load( file, function ( gltf ) {

			scene.add( gltf.scene );
			function animate(){
				requestAnimationFrame(animate)
				controls.update();
				renderer.render(scene,camera);
			}
			animate();


		} );

	} );
</script>
	                               
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
                        
                        <div class="row">

                        <!-- Area Chart -->
	                        <div class="col-xl-12 col-lg-12">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div
	                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">월별 매출액</h6>
	                                    
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-area">
	                                        <canvas id="myAreaChart"></canvas>
	                                    </div>
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
