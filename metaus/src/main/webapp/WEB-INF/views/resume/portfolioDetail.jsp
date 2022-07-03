<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">
<script type="text/javascript">
$(function(){
	$('form[name=frmDelete]').submit(function(){
		if(confirm('삭제하시겠습니까?')){
			if($.trim($('input[name=portNo]').val()).length<1){
				event.preventDefault();
			}
		}else{
			event.preventDefault();
		}
	});
});
</script>
 <form name="frmDelete" action="<c:url value='/resume/portfolioDetail'/>" class="post-job-resume mt50" method="post" enctype="multipart/form-data">
 <section class="ptb80" id="job-page">
 	<section class="page-header">
        <div class="container">
            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h1>Portfolio</h1>
                </div>
            </div>
            <!-- End of Page Title -->
        </div>
    </section>
    
    <!-- Start of Post Resume Form -->
 
 <section class="ptb80" id="post-job">
        <div class="container">
            <input type="hidden" name="portNo"  value="${pvo.portNo }">
               <div class="row candidate-profile nomargin">            
                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">
						 
                        <!-- Profile Title -->
                        <div class="form-group" style="font-size: 17px;" align="center">
                           <!--  <label>포트폴리오제목 : </label>&nbsp; -->
                            <span class="title">< &nbsp;${pvo.portTitle }&nbsp; ></span>
                        </div>
                        <br>
                         
                        <br>
                        
                        
                        <div class="base">
							<div class="row skills mt40">
	
				                <div class="col-md-12 text-center" >
				                    <h2 class="header2">작업 파일</h2>
				                </div>
								<div class="form-group">
									
									<ul class="list list-introduction">
										<li class="item">
				                     		<div class="content">
					                     		${pvo.portOriginname}
				                     		</div>
									                    
										</li>
									</ul>
									
				                </div>
				                <div class="col-md-12 text-center" >
<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
<canvas id="can${pvo.portNo }" width="700px" height="700px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/${pvo.portFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${pvo.portNo}'),
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
						</div>
                        
                        <br>
                        
                        <div class="base">
							<div class="row skills mt40">
	
				                <div class="col-md-12 text-center" >
				                    <h2 class="header2">작업 내용</h2>
				                </div>
								<div class="form-group">
									
									<ul class="list list-introduction">
										<li class="item">
				                     		<div class="content">
					                     		${pvo.portContent}
				                     		</div>
									                    
										</li>
									</ul>
									
				                </div>
							</div>
						</div>
                                     
                      
                        <br>             
					  </div>	
                    </div>
                </div>
                <!-- End of Resume Details -->

            <!-- End of Post Resume Form -->
		</div>
        
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->
 </section>           


				<section class="portfolio ptb80">
        			<div class="container">
						
                        <!-- Form Group -->
                        <div class="form-group pt30 nomargin" id="last">
                            <input type="submit" class="btn btn-blue btn-effect" value="삭제">
                            <a href="<c:url value='/resume/resumeDetail'/>" class="btn btn-blue btn-effect">취소</a>
                        </div>
                    </div>
                </section> 
            </form>
 
     

        
 
<%@ include file="../inc/footer.jsp" %>