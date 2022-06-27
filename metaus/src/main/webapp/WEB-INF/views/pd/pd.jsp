<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<canvas id="canvas" width="300px" height="300px"></canvas>

<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>

<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>

<script type="text/javascript">
//var url = "<c:url value='/gltfmodel/bathroom_interior.zip'/>";
var url = "<c:url value='/gltfmodel/shiba.zip'/>";
//var url = 'models/gltf/BoomBox.gltf';

var manager = new THREE.LoadingManager();

var scene = new THREE.Scene();
var renderer = new THREE.WebGLRenderer({
	canvas : document.querySelector('#canvas'),
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

<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>3D Model</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">3D model</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->
    <div class="sketchfab-embed-wrapper"> <iframe title="Love Is War - Shinomiya Kaguya" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/662e0168a6ba470fa0941c8d6daad904/embed"> </iframe> <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;"> <a href="https://sketchfab.com/3d-models/love-is-war-shinomiya-kaguya-662e0168a6ba470fa0941c8d6daad904?utm_medium=embed&utm_campaign=share-popup&utm_content=662e0168a6ba470fa0941c8d6daad904" target="_blank" style="font-weight: bold; color: #1CAAD9;"> Love Is War - Shinomiya Kaguya </a> by <a href="https://sketchfab.com/baniracoffee?utm_medium=embed&utm_campaign=share-popup&utm_content=662e0168a6ba470fa0941c8d6daad904" target="_blank" style="font-weight: bold; color: #1CAAD9;"> vanilla_coffee_ice </a> on <a href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=662e0168a6ba470fa0941c8d6daad904" target="_blank" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p></div>
<!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="">
                            <!-- Product image-->
                            <img class="card-img-top" src="" alt="..."/>
                            
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">젭(ZEP) 메타버스 월드 만들기</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        <a href="<c:url value='/pd/pdDetail?classNo=${classNo }'/>">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">제페토(ZEPETO) 메타버스 월드 만들기</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        <a href="<c:url value='/pd/pdDetail?classNo=${classNo }'/>">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">메타버스 만들기, 빌드잇 가상공간(1탄)</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                        </a>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<a href="<c:url value='/pd/pdDetail?classNo=${classNo }'/>">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">메타버스 세계로 들어오세요!</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                        	</a>
                        </div>
                    </div>
                                                            
                    </div>
                </div>
            </div>
        </section>
<%@ include file="../inc/footer.jsp"%>