<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>

    <!-- ===== Start of Candidate Profile Header Section ===== -->
    <section class="profile-header">
    </section>
    <!-- ===== End of Candidate Header Section ===== -->





    <!-- ===== Start of Main Wrapper Candidate Profile Section ===== -->
    <section class="pb80" id="candidate-profile2">
        <div class="container">

            <!-- Start of Row -->
            <div class="row candidate-profile">

                <!-- Start of Profile Picture -->
                <div class="col-md-12">
                    <div class="profile-photo">
                        <div style="
                    		width: 240px; 
                    		height:240px; 
                    		border-radius:100%;
                    	"><img src="<c:url value='/images/createrProfile/${memVo.memPic}'/>" class="img-responsive" alt="" style="height:100%;width:100%;" onerror="this.onerror=null; this.src='<c:url value='/images/createrProfile/user.png'/>'">
                    	</div>
                    </div>

                </div>
                <!-- End of Profile Picture -->


                <!-- Start of Profile Description -->
                <div class="col-md-6 col-xs-12 mt80">
                    <div class="profile-descr">

                        <!-- Profile Title -->
                        <div class="profile-title">
                            <h2 class="capitalize">${memVo.memNick }</h2>
                            <h5 class="pt10">${memVo.memId }</h5>
                        </div>

                        <!-- Start of Social Media Buttons -->
                        <ul class="social-btns list-inline mt20">
                        
                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll facebook transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-envelope-o"></i>
                                        <i class="social-btn-roll-icon fa fa-envelope-o"></i>
                                    </div>
                                </a>
                            </li>


                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll instagram transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-file-text"></i>
                                        <i class="social-btn-roll-icon fa fa-file-text"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll linkedin transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-shopping-basket"></i>
                                        <i class="social-btn-roll-icon fa fa-shopping-basket"></i>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- End of Social Media Buttons -->

                        <!-- Profile Details -->
                        <div class="profile-details mt40">
                            <p>${resumeVo.resContent }</p>
                        </div>
                    </div>

                </div>
                <!-- End of Profile Description -->


                <!-- Start of Profile Info -->
                <div class="col-md-4 col-md-offset-2 col-xs-12 mt80">
                    <ul class="profile-info">
                        <li>
                            <i class="fa fa-handshake-o"></i>
                            <span>${contactList.size()} contracts</span>
                        </li>

                        <li>
                            <i class="fa fa-inbox"></i>
                            <span>${portfolioList.size() } items</span>
                        </li>

                        <li>
                            <i class="fa fa-shopping-basket"></i>
                            <span> products</span>
                        </li>

                        <li>
                            <i class="fa fa-birthday-cake"></i>
                            <span>${memVo.memBirth }</span>
                        </li>

                        
                    </ul>
                </div>
                <!-- End of Profile Info -->

            </div>
            <!-- End of Row -->


            
        </div>
    </section>
    <!-- ===== End of Candidate Profile Section ===== -->




<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio ptb80">
        <div class="container">

            <div class="row">
                <h3 class="text-center pb60">Recent Work</h3>

                
            </div>

            <!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">
				
				<c:forEach var="portfolioVo" items="${portfolioList }">
				
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    	<canvas id="can${portfolioVo.portNo }" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/${portfolioVo.portFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${portfolioVo.portNo}'),
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
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );

	} );
</script>
                    
                </div>
                
                </c:forEach>
				

            </div>
            <!-- End of Portfolio Grid -->

        </div>
    </section>
    <!-- ===== End of Portfolio Section ===== -->





    <!-- ===== Start of Education Section ===== -->
    <section class="education ptb80">
        <div class="container">

            <div class="col-md-12 text-center">
                <h3 class="pb60">Contracts</h3>
            </div>
			
			<c:if test="${empty contactList }">
			<!-- Start of Education Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    
                    <div class="education-body" style="text-align:center">
                        <h5>계약 기록이 없습니다</h5>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->
			</c:if>
			
			<c:if test="${!empty contactList }">
			<c:forEach var="contactVo" items="${contactList }">
            <!-- Start of Education Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    <div class="education-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>${contactVo.comName }</h4>
                            <h5>${contactVo.recTitle }</h5>
                        </div>
                        <h6 class="time">${contactVo.conDonedate}</h6>
                    </div>
                    <!-- End of Education Header -->

                    <!-- Start of Education Body -->
                    <div class="education-body">
                        <p>${contactVo.recContent }</p>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->
			</c:forEach>
			</c:if>

        </div>
    </section>
    <!-- ===== End of Education Section ===== -->




<%@ include file="../inc/footer.jsp" %>