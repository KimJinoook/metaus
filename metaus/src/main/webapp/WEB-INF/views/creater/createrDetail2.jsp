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
                            <h2 class="capitalize">크리에이터 김</h2>
                            <h5 class="pt10">kimjin0132@naver.com</h5>
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
                            <p> 저는 유니티를 이용해 3d 모델링 작업을 실시하며, 각 업체가 원하는 목적과 효과를 담아내기 위해 소통을 중심으로 작업을 실시합니다. 모 업체 제품을 3d모델로 만들어 제페토에 등록한 결과 해당 제품 매출량이 10% 상승한 이력이 있습니다. 패션, 음식 제품이 주 분야이며 관심 있으신 분들은 연락주시기 바랍니다</p>
                        </div>
                    </div>

                </div>
                <!-- End of Profile Description -->


                <!-- Start of Profile Info -->
                <div class="col-md-4 col-md-offset-2 col-xs-12 mt80">
                    <ul class="profile-info">
                        <li>
                            <i class="fa fa-handshake-o"></i>
                            <span>2 contracts</span>
                        </li>

                        <li>
                            <i class="fa fa-inbox"></i>
                            <span>4 items</span>
                        </li>

                        <li>
                            <i class="fa fa-shopping-basket"></i>
                            <span>15 products</span>
                        </li>

                        <li>
                            <i class="fa fa-birthday-cake"></i>
                            <span>1994.12.15</span>
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
				
				
				
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    	<canvas id="cana" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/1.zip'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#cana'),
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
                
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    	<canvas id="can2" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/2.zip'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can2'),
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
				 <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    	<canvas id="can3" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/1.zip'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can3'),
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
				 <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    	<canvas id="can4" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/2.zip'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can4'),
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
			

			
		
		
            <!-- Start of Education Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    <div class="education-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>품어떡</h4><br>
                            <h5>품어떡 음식 메뉴 제품 제작</h5>
                        </div>
                        <h6 class="time">2022-06-01</h6>
                    </div>
                    <!-- End of Education Header -->

                    <!-- Start of Education Body -->
                    <div class="education-body">
                        <p>품어떡 업체 대표메뉴 5개를 3D모델로 만들어 주실 크리에이터를 구합니다. 수육국밥과 떡볶이, 치킨 등 분식메뉴와 한끼 식사를 제공하는 업체이며, 페이 협상 후 진행하겠습니다</p>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->
            
            <!-- Start of Education Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    <div class="education-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>봉구스 밥버거</h4><br>
                            <h5>봉구스 밥버거 건물 제작</h5>
                        </div>
                        <h6 class="time">2022-06-29</h6>
                    </div>
                    <!-- End of Education Header -->

                    <!-- Start of Education Body -->
                    <div class="education-body">
                        <p>봉구스밥버거 가게건뭉릉ㄹ 3d모델로 제작해 주실 크리에이터를 구합니다. 플랫폼은 제페토로 생각중이며 페이는 15만원 입니다.</p>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->


        </div>
    </section>
    <!-- ===== End of Education Section ===== -->




<%@ include file="../inc/footer.jsp" %>