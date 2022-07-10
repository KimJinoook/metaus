<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="memId" name="memId" value="${memId }">
<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
    <!-- ===== Start of Portfolio Section ===== -->
    <section class="shop ptb80">
        <div class="container">

            <!-- <div class="row">
                <h3 class="text-center pb60">Recent Work</h3>

                
            </div> -->
<!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">
				
                <!-- Start of Shop Product Wrapper -->
                <div class="col-md-12 col-xs-12 shop-products-wrapper">
				<c:if test="${empty list }">
            <p class="noPd2" style="text-align: center;"><img src="<c:url value='/images/noPd2.png'/>" alt="..." width="40%"/></p>            
            </c:if>
            
            <c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }">
				
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                                <div class="product-image">
                    	<canvas id="can${vo.pdNo }" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/product/${vo.pdFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${vo.pdNo}'),
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
 							<!-- Product Image -->

                                    <a href="<c:url value='/images/shop/product1.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product1.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cart'/>"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>
                    <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                        <h4>${vo.pdName }</h4>

                                        <!-- Price -->
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$<fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/></span>
                                        </span>
                                    </a>
                                </div>
                </div>
                
                </c:forEach>
</c:if>				

            </div>
            <!-- End of Portfolio Grid -->

        </div>
    </section>
    <!-- ===== End of Portfolio Section ===== -->